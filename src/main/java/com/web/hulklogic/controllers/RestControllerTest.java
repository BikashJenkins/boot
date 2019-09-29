package com.web.hulklogic.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.hulklogic.conversion.WordConvertPDF;
import com.web.hulklogic.entity.Applicants;
import com.web.hulklogic.entity.CreateJob;
import com.web.hulklogic.entity.JobTitle;
import com.web.hulklogic.entity.JobsDocuments;
import com.web.hulklogic.entity.QuoteMessages;
import com.web.hulklogic.entity.User;
import com.web.hulklogic.service.ApplicantService;
import com.web.hulklogic.service.ApplicationService;
import com.web.hulklogic.service.ApplicationSettingsService;
import com.web.hulklogic.service.JobTitleService;
import com.web.hulklogic.service.SupportService;
import com.web.hulklogic.service.UserService;
import com.web.hulklogic.utility.DocumentDeleteUtility;
import com.web.hulklogic.utility.Parser;
import com.web.hulklogic.utility.ParserData;
import com.web.hulklogic.utility.ResponseObj;
import com.web.hulklogic.utility.StatusEnum;



/*@CrossOrigin(origins = "*", maxAge = 3600)*/
@RestController
public class RestControllerTest {
	private static Logger logger = Logger.getLogger(RestControllerTest.class);
	@Autowired
	private UserService userService;
	@Autowired
	private ApplicationSettingsService applicationSettingsService;
	@Autowired
	private ServletContext context;
	@Autowired
	ApplicantService appservice;
	@Autowired
	private SupportService supportService;
	@Autowired
	private JobTitleService jobtitleService;
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private ApplicantService applicantService;

	static Gson gson = new Gson();
	static ResponseObj responseObj = new ResponseObj();

	@GetMapping("/rest/test")
	public String testRest() {
		return "Rest working !!";
	}
	
	 
	@RequestMapping(value = "/rest/quotemessage", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String quotemessage(@RequestBody QuoteMessages quote, HttpServletRequest request) {
		ResponseObj responseObj = new ResponseObj();
		int result = userService.saveQuote(quote);

		if (result > 0) {
			boolean linkStatus = userService.sendcontactdetails(quote);
			logger.info("linkStatus:" + linkStatus);
			if (!linkStatus) {
				responseObj.setEvent("Fail");
				responseObj.setStatus(StatusEnum.FAIL.name());
				return new Gson().toJson(responseObj);
			} else {

				responseObj.setEvent("Success");
				responseObj.setStatus(StatusEnum.SUCCESS.name());
				return new Gson().toJson(responseObj);
			}

		}
		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);
	}

	@RequestMapping(value = "/rest/contactmessage", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String contactmessage(@RequestBody QuoteMessages quote) {
		ResponseObj responseObj = new ResponseObj();
		int result = userService.saveContact(quote);

		if (result > 0) {
			boolean linkStatus = userService.sendcontdetails(quote);
			logger.info("linkStatus:" + linkStatus);
			if (!linkStatus) {
				responseObj.setEvent("Fail");
				responseObj.setStatus(StatusEnum.FAIL.name());
				return new Gson().toJson(responseObj);
			} else {

				responseObj.setEvent("Success");
				responseObj.setStatus(StatusEnum.SUCCESS.name());
				return new Gson().toJson(responseObj);
			}

		}
		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);
	}
	/*@CrossOrigin(origins = "https://hulklogic.com")*/
	@RequestMapping(value = "/rest/getCompanies", method = RequestMethod.POST)
	public @ResponseBody String getAllCompanies() {
		List<CreateJob> listcompanies = null;
		try {

			listcompanies = applicationSettingsService.getCompanies();

			Gson gson = new Gson();
			String listcompanyStr = gson.toJson(listcompanies);
			responseObj.setEvent("Success");
			responseObj.setStatus(listcompanyStr);
			return new Gson().toJson(responseObj);

		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}

		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);

	}
	/*@CrossOrigin(origins = "https://hulklogic.com")*/
	@RequestMapping(value = "/rest/getalljobs", method = RequestMethod.POST)
	public @ResponseBody String getalljobs() {
		List<CreateJob> jobs = null;
		try {
			jobs = userService.getalljobs();
			String jobsStr = gson.toJson(jobs);
			responseObj.setEvent("Success");
			responseObj.setStatus(jobsStr);
			return new Gson().toJson(responseObj);
		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}

		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);
	}
	@CrossOrigin(origins = "https://hulklogic.com")
	@RequestMapping(value = "/rest/getperCompany", method = RequestMethod.POST)
	public @ResponseBody String getperCountries(@RequestParam(value = "company", required = false) String company) {
		List<CreateJob> listcoutries = null;
		try {

			listcoutries = applicationSettingsService.getperCompanies(company);

			Gson gson = new Gson();
			String listcoutriesStr = gson.toJson(listcoutries);
			responseObj.setEvent("Success");
			responseObj.setStatus(listcoutriesStr);
			return new Gson().toJson(responseObj);

		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}

		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);

	}

	@RequestMapping(value = "/rest/carrerapplicants", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String applicantcreations(HttpServletRequest request,
			@RequestBody Applicants createApplicants) {
		boolean status = appservice.getappemailCheck(createApplicants.getEmail());
		String result = "fail";
		String sendAlertEmail = null;
		logger.info(createApplicants.getJobid());
		String email = applicationService.getAssignEmail(createApplicants.getJobid());
		logger.info(email);
		User user = userService.getUserByEmail(email);
		String teamname = user.getTeamname();
		logger.info("teamname:" + teamname);
		Integer userid = user.getUserid();
		logger.info("userid:" + userid);
		JobTitle jobtitle = new JobTitle();
		jobtitle.setJobid(createApplicants.getJobid());
		if (status) {
			int applicantid = appservice.getapplicantid(createApplicants.getEmail());

			jobtitle.setApplicantid(applicantid);

			jobtitle.setReferncedemail(email);
			jobtitle.setTeamname(teamname);
			jobtitle.setUserid(userid);
			sendAlertEmail = supportService.managerEmailForSenderAlert(teamname);
			logger.info("sendAlertEmail:" + sendAlertEmail);
			jobtitle.setSender_email(sendAlertEmail);
			try {

				result = jobtitleService.createApplicantDirectly(jobtitle);

			} catch (Exception e) {
				logger.error("Exception is: " + e);
			}
			if (result.equals("success")) {

				responseObj.setEvent("Success");
				responseObj.setStatus(StatusEnum.SUCCESS.name());
				return new Gson().toJson(responseObj);
			} else {
				responseObj.setEvent("Fail");
				responseObj.setStatus(StatusEnum.FAIL.name());
				return new Gson().toJson(responseObj);
			}

		} else {

			String document1 = null;
			String document2 = null;
			Parser parser = null;
			String countNouns = null;
			String numbers = "0123456789";
			String values = numbers;
			int len = 6;
			Random rndm_method = new Random();
			char[] password = new char[len];
			for (int i = 0; i < len; i++) {
				password[i] = values.charAt(rndm_method.nextInt(values.length()));
			}

			String text = String.valueOf(password);
			createApplicants.setPassword(text);
			if (createApplicants.getSource().equals("Linkedin")) {
				result = userService.createApplicantManager(createApplicants);
				responseObj.setEvent(result);
				responseObj.setStatus(StatusEnum.SUCCESS.name());
				return new Gson().toJson(responseObj);

			} else if (createApplicants.getSource().equals("Carrer")) {
				try {
					java.util.Date todayDate = new java.util.Date();
					FileOutputStream fois1 = null;

					if (createApplicants.getFiletype1() != null) {
						byte[] documentdecode1 = DatatypeConverter.parseBase64Binary(createApplicants.getUplaodcv());
						if (createApplicants.getFiletype1()
								.equals("vnd.openxmlformats-officedocument.wordprocessingml.document")) {
							document1 = createApplicants.getDocname1() + "_" + todayDate.getYear() + "_"
									+ todayDate.getMonth() + "_" + todayDate.getDay() + "_" + todayDate.getHours() + "_"
									+ todayDate.getSeconds() + ".docx";
						} else {
							document1 = createApplicants.getDocname1() + "_" + todayDate.getYear() + "_"
									+ todayDate.getMonth() + "_" + todayDate.getDay() + "_" + todayDate.getHours() + "_"
									+ todayDate.getSeconds() + ".pdf";

						}
						File destinationFile1 = new File(
								context.getRealPath("/WEB-INF/cvs") + File.separator + document1);
						fois1 = new FileOutputStream(destinationFile1);
						fois1.write(documentdecode1);
						try {
							if (fois1 != null)
								fois1.close();
						} catch (Exception e) {
							logger.error("Exception is: " + e);
						}
						createApplicants.setUplaodcv(document1);
					} else {
						createApplicants.setUplaodcv(null);
					}
					result = userService.createApplicantManager(createApplicants);
					System.out.println(result);
					String[] arrOfStr = result.split(" ");

					int applicant_id = Integer.parseInt(arrOfStr[1]);
					System.out.println(arrOfStr[1]);

					createApplicants.setApplicantid(Integer.parseInt(arrOfStr[1]));
					String results = arrOfStr[0];
					if (results.equals("success")) {
						logger.info("applicant creation");
						jobtitle.setApplicantid(applicant_id);
						jobtitle.setReferncedemail(email);
						jobtitle.setTeamname(teamname);
						jobtitle.setUserid(userid);
						sendAlertEmail = supportService.managerEmailForSenderAlert(teamname);
						logger.info("sendAlertEmail:" + sendAlertEmail);
						jobtitle.setSender_email(sendAlertEmail);
						try {

							result = jobtitleService.createApplicantDirectly(jobtitle);

						} catch (Exception e) {
							logger.error("Exception is: " + e);
						}
						if (result.equals("success")) {

							boolean linkStatus = userService.sendApplicantLink(createApplicants);
							logger.info("linkStatus:" + linkStatus);
							if (linkStatus) {
								responseObj.setEvent("Success");
								responseObj.setStatus(StatusEnum.SUCCESS.name());
								return new Gson().toJson(responseObj);
							} else {
								responseObj.setEvent("Fail");
								responseObj.setStatus(StatusEnum.FAIL.name());
								return new Gson().toJson(responseObj);

							}

						} else {
							responseObj.setEvent("Fail");
							responseObj.setStatus(StatusEnum.FAIL.name());
							return new Gson().toJson(responseObj);
						}
					}
				} catch (Exception e) {

					logger.error("Exception is: " + e);
				}
				responseObj.setEvent("Fail");
				responseObj.setStatus(StatusEnum.FAIL.name());
				return new Gson().toJson(responseObj);
			}
		}
		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);
	}

	@RequestMapping(value = "/rest/getdatajob", method = RequestMethod.POST)
	public @ResponseBody String sendVideo(@RequestParam(value = "jobid", required = false) int jobid) {
		logger.info("jobid:" + jobid);

		ParserData parserdata = null;
		ParserData parserdata1 = null;
		String countNouns = null;
		String getparserData = null;
		String getparserData1 = null;
		CreateJob createjob = userService.getVideo(jobid);
		System.out.println(createjob.getVideoname());
		File destinationFile = new File(
				context.getRealPath("/WEB-INF/videos") + File.separator + createjob.getVideoname());
		System.out.println(createjob.getVideoname());
		FileInputStream fileInputStreamReader = null;
		try {
			fileInputStreamReader = new FileInputStream(destinationFile);
			byte[] bytes = new byte[(int) destinationFile.length()];
			fileInputStreamReader.read(bytes);
			String encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
			System.out.println(encodedupload1);
			createjob.setVideoencoded(encodedupload1);
			String uploaddocument1 = createjob.getUploaddocument1();
			int index = uploaddocument1.lastIndexOf(".");
			int addvalue = index + 1;
			String lastDot = uploaddocument1.substring(addvalue);
			logger.info("lastDot:" + lastDot);

			parserdata = new ParserData();
			String filename = context.getRealPath("/WEB-INF/uploaded/") + createjob.getUploaddocument1();
			getparserData = parserdata.getParserData(filename, lastDot);
			if (null != getparserData && !getparserData.trim().isEmpty()) {
				logger.info("getparserData1:" + getparserData);
				createjob.setParserData1(getparserData);
			}

			if (createjob.getUploaddocument2() != null) {
				String uploaddocument2 = createjob.getUploaddocument2();
				int index1 = uploaddocument1.lastIndexOf(".");
				int addvalue1 = index1 + 1;
				String lastDot1 = uploaddocument2.substring(addvalue);
				logger.info("lastDot:" + lastDot);

				parserdata1 = new ParserData();
				String filename1 = context.getRealPath("/WEB-INF/uploaded/") + createjob.getUploaddocument2();
				getparserData1 = parserdata.getParserData(filename, lastDot);
				if (null != getparserData1 && !getparserData1.trim().isEmpty()) {
					logger.info("getparserData1:" + getparserData);
					createjob.setParserData1(getparserData1);

				}

			}
		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}

		try {
			if (fileInputStreamReader != null)
				fileInputStreamReader.close();
		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}

		String jobdata = gson.toJson(createjob);
		responseObj.setEvent("Success");
		responseObj.setStatus(jobdata);
		return new Gson().toJson(responseObj);

	}

	@RequestMapping(value = "/rest/getAllCountries", method = RequestMethod.POST)
	public @ResponseBody String getAllCountriesByPhoneCode(
			@RequestParam(value = "phoneCode", required = false) int phoneCode) {
		logger.info("phoneCode:" + phoneCode);
		List<CreateJob> listCountries = null;
		ResponseObj responseObj = null;
		try {
			responseObj = new ResponseObj();
			listCountries = applicationSettingsService.getCountriesByPhoneCode(phoneCode);
			Gson gson = new Gson();
			String countriesStr = gson.toJson(listCountries);
			responseObj.setEvent("Success");
			responseObj.setStatus(countriesStr);

		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}
		return new Gson().toJson(responseObj);
	}

	@RequestMapping(value = "/rest/getStates", method = RequestMethod.POST)
	public @ResponseBody String getAllStates(@RequestParam(value = "countryId", required = false) int countryId) {
		logger.info("countryId:" + countryId);
		ResponseObj responseObj = null;
		List<CreateJob> liststates = null;
		try {
			responseObj = new ResponseObj();
			liststates = applicationSettingsService.getAllStates(countryId);
			Gson gson = new Gson();
			String statesStr = gson.toJson(liststates);
			responseObj.setEvent("Success");
			responseObj.setStatus(statesStr);

		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}
		return new Gson().toJson(responseObj);
	}

	@RequestMapping(value = "/rest/getAllCities", method = RequestMethod.POST)
	public @ResponseBody String getAllCities(@RequestParam(value = "state_id", required = false) int state_id) {
		logger.info("state_id:" + state_id);
		ResponseObj responseObj = null;
		List<CreateJob> listcities = null;
		try {

			responseObj = new ResponseObj();
			listcities = applicationSettingsService.getAllCities(state_id);
			Gson gson = new Gson();
			String citiesStr = gson.toJson(listcities);
			responseObj.setEvent("Success");
			responseObj.setStatus(citiesStr);

		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}
		return new Gson().toJson(responseObj);
	}

	@RequestMapping(value = "/rest/sendJobsDocuments", method = RequestMethod.POST)
	public @ResponseBody String sendJobsDocuments(@RequestParam(value = "jobid", required = false) int jobid) {
		logger.info("jobid:" + jobid);
		JobsDocuments jobsDocuments = null;
		String pdffile = null;
		String pdffile1 = null;
		DocumentDeleteUtility documentDelete = null;
		String beforeDot = null;
		try {
			jobsDocuments = userService.getJobsDocuments(jobid);
			if (jobsDocuments.getUploaddocument1() != null) {
				String uploaddocument1 = jobsDocuments.getUploaddocument1();
				int index = uploaddocument1.lastIndexOf(".");
				int addvalue = index + 1;
				String lastDot = uploaddocument1.substring(addvalue);
				logger.info("lastDot:" + lastDot);
				if (lastDot.equals("docx")) {
					String filename = context.getRealPath("/WEB-INF/uploaded/") + jobsDocuments.getUploaddocument1();
					String getAfterDot = uploaddocument1;
					int lastIndxDot = getAfterDot.lastIndexOf('.');
					if (lastIndxDot != -1) {
						beforeDot = getAfterDot.substring(0, lastIndxDot);
						logger.info("afterDot:" + beforeDot);
					}
					pdffile = context.getRealPath("/WEB-INF/uploaded/") + beforeDot + ".pdf";
					pdffile1 = beforeDot + ".pdf";
					WordConvertPDF wordconvertpdf = new WordConvertPDF();
					wordconvertpdf.ConvertToPDF(filename, pdffile);
					File destinationFile = new File(pdffile);
					FileInputStream fileInputStreamReader = null;
					try {
						fileInputStreamReader = new FileInputStream(destinationFile);
						byte[] bytes = new byte[(int) destinationFile.length()];
						fileInputStreamReader.read(bytes);
						String encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
						jobsDocuments.setUploaddocument1(encodedupload1);

					} catch (Exception e) {
						logger.error("Exception is: " + e);
					}
					try {

						if (fileInputStreamReader != null)
							fileInputStreamReader.close();
					} catch (Exception e) {
						logger.error("Exception is: " + e);
					}
				} else {

					File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded") + File.separator
							+ jobsDocuments.getUploaddocument1());
					pdffile1 = jobsDocuments.getUploaddocument1();
					FileInputStream fileInputStreamReader = null;
					try {

						fileInputStreamReader = new FileInputStream(destinationFile);
						byte[] bytes = new byte[(int) destinationFile.length()];
						fileInputStreamReader.read(bytes);
						String encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
						jobsDocuments.setUploaddocument1(encodedupload1);
					} catch (Exception e) {
						logger.error("Exception is: " + e);
					}

					try {
						if (fileInputStreamReader != null)
							fileInputStreamReader.close();
					} catch (Exception e) {
						logger.error("Exception is: " + e);
					}
				}

				int result = applicantService.updateDocument1(pdffile1, jobid);
				File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded"));
				String docXFileName = beforeDot + ".docx";
				String docFileName = beforeDot + ".doc";
				if (result > 0) {
					documentDelete = new DocumentDeleteUtility();
					documentDelete.deleteDocument(destinationFile, docXFileName);
				}
			}

			if (jobsDocuments.getUploaddocument2() != null) {

				String uploaddocument2 = jobsDocuments.getUploaddocument2();
				int index = uploaddocument2.lastIndexOf(".");
				int addvalue = index + 1;
				String lastDot = uploaddocument2.substring(addvalue);
				logger.info("lastDot:" + lastDot);

				if (lastDot.equals("docx"))

				{

					String filename = context.getRealPath("/WEB-INF/uploaded/") + jobsDocuments.getUploaddocument2();
					String getAfterDot = uploaddocument2;
					int lastIndxDot = getAfterDot.lastIndexOf('.');
					if (lastIndxDot != -1) {
						beforeDot = getAfterDot.substring(0, lastIndxDot);
						logger.info("afterDot:" + beforeDot);
					}
					pdffile = context.getRealPath("/WEB-INF/uploaded/") + beforeDot + ".pdf";
					pdffile1 = beforeDot + ".pdf";

					WordConvertPDF wordconvertpdf = new WordConvertPDF();
					wordconvertpdf.ConvertToPDF(filename, pdffile);
					File destinationFile = new File(pdffile);
					FileInputStream fileInputStreamReader = null;
					try {
						fileInputStreamReader = new FileInputStream(destinationFile);
						byte[] bytes = new byte[(int) destinationFile.length()];
						fileInputStreamReader.read(bytes);
						String encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
						jobsDocuments.setUploaddocument2(encodedupload1);

					} catch (Exception e) {

						logger.error("Exception is: " + e);
					}
					try {

						if (fileInputStreamReader != null)
							fileInputStreamReader.close();
					} catch (Exception e) {
						logger.error("Exception is: " + e);
					}

				} else {
					File destinationFile1 = new File(context.getRealPath("/WEB-INF/uploaded") + File.separator
							+ jobsDocuments.getUploaddocument2());
					pdffile1 = jobsDocuments.getUploaddocument2();
					FileInputStream fileInputStreamReader1 = null;

					try {

						fileInputStreamReader1 = new FileInputStream(destinationFile1);
						byte[] bytes = new byte[(int) destinationFile1.length()];
						fileInputStreamReader1.read(bytes);
						String encodeupload2 = new String(Base64.encodeBase64(bytes), "UTF-8");
						jobsDocuments.setUploaddocument2(encodeupload2);

					} catch (Exception e) {

						logger.error("Exception is: " + e);
					}
					try {
						if (fileInputStreamReader1 != null)
							fileInputStreamReader1.close();
					} catch (Exception e) {
						logger.error("Exception is: " + e);
					}
				}

				int result = applicantService.updateDocument2(pdffile1, jobid);
				File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded"));
				String docXFileName = beforeDot + ".docx";
				String docFileName = beforeDot + ".doc";
				if (result > 0) {

					documentDelete = new DocumentDeleteUtility();
					documentDelete.deleteDocument(destinationFile, docXFileName);
				}
			}
			String jobsDocumentsStr = gson.toJson(jobsDocuments);
			responseObj.setEvent("Success");
			responseObj.setStatus(jobsDocumentsStr);
			return new Gson().toJson(responseObj);

		} catch (Exception e) {
			logger.error("Exception is: " + e);
		}

		responseObj.setEvent("Fail");
		responseObj.setStatus(StatusEnum.FAIL.name());
		return new Gson().toJson(responseObj);

	}

}
