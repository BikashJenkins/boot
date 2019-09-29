package com.web.hulklogic.controllers;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletContext;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hulklogic.conversion.WordConvertPDF;
import com.web.hulklogic.entity.Applicants;
import com.web.hulklogic.entity.JobsDocuments;
import com.web.hulklogic.service.ApplicantService;
import com.web.hulklogic.service.ApplicationService;
import com.web.hulklogic.service.UserService;
import com.web.hulklogic.utility.DocumentDeleteUtility;

@Controller
public class ShowDocumentsController {
	
	private static Logger logger = Logger.getLogger(ShowDocumentsController.class);
	
	@Autowired
	UserService userService;
	@Autowired
    private ServletContext context;
	@Autowired
	private ApplicationService applicantionService;
	@Autowired
	private ApplicantService applicationService;

	@RequestMapping(value="/user/sendJobsDocuments",method=RequestMethod.POST)
	public @ResponseBody JobsDocuments sendJobsDocuments(@RequestParam(value="jobid", required=false) int jobid){
		
		logger.info("jobid:"+jobid);
		JobsDocuments  jobsDocuments=null;
		String pdffile=null;
		String pdffile1=null;
		DocumentDeleteUtility documentDelete=null;
		String beforeDot=null;
		
		
	          try{
			   jobsDocuments=userService.getJobsDocuments(jobid);	     
		     if(jobsDocuments.getUploaddocument1()!=null){
				    	  
					    String uploaddocument1=jobsDocuments.getUploaddocument1();
		                int index = uploaddocument1.lastIndexOf(".");
		       		    int addvalue=index+1;
		       		    String lastDot= uploaddocument1.substring(addvalue);
		       		    logger.info("lastDot:"+lastDot);
					
		                if( lastDot.equals("docx"))
		        	    
		              {      
		       
		                String filename = context.getRealPath("/WEB-INF/uploaded/")+jobsDocuments.getUploaddocument1();
		                String getAfterDot = uploaddocument1;
		        	    int lastIndxDot = getAfterDot.lastIndexOf('.');
		        	    if (lastIndxDot != -1) {
		        	    	beforeDot = getAfterDot.substring(0, lastIndxDot);
		        	        logger.info("afterDot:"+beforeDot);
		        	    }
		                pdffile=context.getRealPath("/WEB-INF/uploaded/")+beforeDot+".pdf";
		                pdffile1 = beforeDot+".pdf";
		               
		                WordConvertPDF wordconvertpdf=new WordConvertPDF();
		                wordconvertpdf.ConvertToPDF(filename, pdffile);
		                File destinationFile = new File(pdffile);
		                FileInputStream fileInputStreamReader = null;
		       try{
		                fileInputStreamReader = new FileInputStream(destinationFile);
		                byte[] bytes = new byte[(int)destinationFile.length()];
		                fileInputStreamReader.read(bytes);
		                String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
		                jobsDocuments.setUploaddocument1(encodedupload1);
		              
		        }catch (Exception e) {
		            	  
		                logger.error("Exception is: "+e);
		       }
		               try {
		            	   
		                  if(fileInputStreamReader!=null)
		                  fileInputStreamReader.close();  
		                  }catch (Exception e) {
		    	          logger.error("Exception is: "+e);
		              } 
		        }else {
		        	
		    	       File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + jobsDocuments.getUploaddocument1());
		    	        pdffile1=jobsDocuments.getUploaddocument1();
	                    FileInputStream fileInputStreamReader = null;
	            
	              try{
	            	  
	            	  fileInputStreamReader = new FileInputStream(destinationFile);
	                  byte[] bytes = new byte[(int)destinationFile.length()];
	                  fileInputStreamReader.read(bytes);
	                  String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
	                  jobsDocuments.setUploaddocument1(encodedupload1);
	                  
	           
	            }
	            catch (Exception e) {
	            	 logger.error("Exception is: "+e);
				}
	            
				try {
					    if(fileInputStreamReader!=null)
						fileInputStreamReader.close();
					    
				}catch (Exception e) {
					
			           logger.error("Exception is: "+e);
	            } 
		     
			 }	
		              
		              
		              int result=applicationService.updateDocument1(pdffile1, jobid);
		              File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded"));
		              String docXFileName=beforeDot+".docx";
		              String docFileName=beforeDot+".doc";
		               if(result>0){
		               documentDelete=new DocumentDeleteUtility();
		                  documentDelete.deleteDocument(destinationFile, docXFileName);
		             }
		}              
				
				        
		               if(jobsDocuments.getUploaddocument2()!=null){
							
						    String uploaddocument2=jobsDocuments.getUploaddocument2();
						    int index = uploaddocument2.lastIndexOf(".");
			       		    int addvalue=index+1;
			       		    String lastDot= uploaddocument2.substring(addvalue);
			       		    logger.info("lastDot:"+lastDot);
						
			              if( lastDot.equals("docx"))
			        	    
			           {      
			       
			                String filename = context.getRealPath("/WEB-INF/uploaded/")+jobsDocuments.getUploaddocument2();
			                String getAfterDot = uploaddocument2;
			        	    int lastIndxDot = getAfterDot.lastIndexOf('.');
			        	    if (lastIndxDot != -1) {
			        	    	beforeDot = getAfterDot.substring(0, lastIndxDot);
			        	        logger.info("afterDot:"+beforeDot);
			        	    }
			                pdffile=context.getRealPath("/WEB-INF/uploaded/")+beforeDot+".pdf";
			                pdffile1 =beforeDot+".pdf";
			               
			       
			                WordConvertPDF wordconvertpdf=new WordConvertPDF();
			                wordconvertpdf.ConvertToPDF(filename, pdffile);
			                File destinationFile = new File(pdffile);
			                FileInputStream fileInputStreamReader = null;
			         try{
			                fileInputStreamReader = new FileInputStream(destinationFile);
			                byte[] bytes = new byte[(int)destinationFile.length()];
			                fileInputStreamReader.read(bytes);
			                String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
			                jobsDocuments.setUploaddocument2(encodedupload1);
			                
			      }catch (Exception e) {
			            	  
			                logger.error("Exception is: "+e);
			      }
			               try {
			            	   
			                  if(fileInputStreamReader!=null)
			                  fileInputStreamReader.close();  
			                  }catch (Exception e) {
			    	          logger.error("Exception is: "+e);
			                  }  
				        
			   }  else{   
			    	        File destinationFile1 = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + jobsDocuments.getUploaddocument2());
			    	        pdffile1=jobsDocuments.getUploaddocument2();
		                    FileInputStream fileInputStreamReader1= null;
		                   
		          try{
		                	  
		             
		    	          fileInputStreamReader1 = new FileInputStream(destinationFile1);
	                      byte[] bytes = new byte[(int)destinationFile1.length()];
	                      fileInputStreamReader1.read(bytes);
	                      String  encodeupload2 = new String(Base64.encodeBase64(bytes), "UTF-8");
	                      jobsDocuments.setUploaddocument2(encodeupload2 );
	                    
		                 }catch (Exception e) {
		                	 
		    	          logger.error("Exception is: "+e);
				   }
				     try {
					     if(fileInputStreamReader1!=null)
					    fileInputStreamReader1.close();
				      } catch (Exception e) {
					     logger.error("Exception is: "+e);
					}
				    
			   }  
			       int result =applicationService.updateDocument2(pdffile1, jobid);
			       File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded"));
			       String docXFileName=beforeDot+".docx";
			       String docFileName=beforeDot+".doc";
			        if(result>0){
			        documentDelete=new DocumentDeleteUtility();
			           documentDelete.deleteDocument(destinationFile, docXFileName);
			      }
			
		 }		
				
		                
	             }        catch(Exception e){
		        	 logger.error("Exception is: "+e);
			}
	          
	          return jobsDocuments;
					        
	}		        


	
	
	@RequestMapping(value="/user/sendCvsDocuments",method=RequestMethod.POST)
	 public @ResponseBody Applicants sendCvsDocuments(@RequestParam(value="applicantid", required=false) int applicantid){
	  
	  logger.info("applicantid:"+applicantid);
	  Applicants  getApplicant=null;
	  
	  try{
	    getApplicant=applicantionService.getUploadDocuments(applicantid);
	    if(getApplicant.getUplaodcv()!=null) {
	    	
	   
	    File destinationFile = new File(context.getRealPath("/WEB-INF/cvs")+ File.separator + getApplicant.getUplaodcv());
	  
	             FileInputStream fileInputStreamReader = null;
	             try{
	              fileInputStreamReader = new FileInputStream(destinationFile);
	              
	                 byte[] bytes = new byte[(int)destinationFile.length()];
	                 fileInputStreamReader.read(bytes);
	               String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
	               getApplicant.setUplaodcv(encodedupload1);
	             }
	             catch (Exception e) {
	               logger.error("Exception is: "+e);
	    }
	    try {
	     if(fileInputStreamReader!=null)
	      fileInputStreamReader.close();
	    } catch (Exception e) {
	      logger.error("Exception is: "+e);
	             } 
	    }
	     
	    if(getApplicant.getOtheruploads()!=null) {
	    	
	    File destinationFile1 = new File(context.getRealPath("/WEB-INF/cvs")+ File.separator + getApplicant.getOtheruploads());
	         FileInputStream fileInputStreamReader1= null;
	         try{
	          fileInputStreamReader1 = new FileInputStream(destinationFile1);
	                byte[] bytes = new byte[(int)destinationFile1.length()];
	                fileInputStreamReader1.read(bytes);
	              String  encodeupload2 = new String(Base64.encodeBase64(bytes), "UTF-8");
	              getApplicant.setOtheruploads(encodeupload2);
	         }catch (Exception e) {
	          logger.error("Exception is: "+e);
	    }
	    try {
	     if(fileInputStreamReader1!=null)
	     fileInputStreamReader1.close();
	    } catch (Exception e) {
	      logger.error("Exception is: "+e);
	     }
	    }
	                  } catch(Exception e){
	                   logger.error("Exception is: "+e);
	                  }
	  return getApplicant;
	 }
	
	
	
	   @RequestMapping(value="/user/cvUploadDocument",method=RequestMethod.POST)
       public @ResponseBody Applicants sendcvUploadDocument(@RequestParam(value="applicantid", required=false) int applicantid) {
         logger.info("applicantid:"+applicantid);

                 Applicants  getApplicant=null;
                 String pdffile=null;
                 String pdffile1=null;
                 DocumentDeleteUtility documentDelete=null;
                 String beforeDot=null;
        try{

                getApplicant=applicantionService.getUploadDocuments(applicantid);

       if(getApplicant.getUplaodcv()!=null){

                String uploadcv=getApplicant.getUplaodcv();
                int index = uploadcv.lastIndexOf(".");
       		    int addvalue=index+1;
       		    String lastDot= uploadcv.substring(addvalue);

             if( lastDot.equals("docx"))
             {      

                String filename = context.getRealPath("/WEB-INF/cvs/")+getApplicant.getUplaodcv();
                int lastIndxDot = uploadcv.lastIndexOf('.');
        	    if (lastIndxDot != -1) {
        	    	beforeDot = uploadcv.substring(0, lastIndxDot);
        	        logger.info("afterDot:"+beforeDot);
        	    }
                pdffile=context.getRealPath("/WEB-INF/cvs/")+beforeDot+".pdf";
                pdffile1=beforeDot+".pdf";

                logger.info("pdffile1:"+pdffile1);

                WordConvertPDF wordconvertpdf=new WordConvertPDF();
                wordconvertpdf.ConvertToPDF(filename, pdffile);
                File destinationFile = new File(pdffile);

                FileInputStream fileInputStreamReader = null;

         try{

                fileInputStreamReader = new FileInputStream(destinationFile);
                byte[] bytes = new byte[(int)destinationFile.length()];
                fileInputStreamReader.read(bytes);
                String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
                getApplicant.setUplaodcv(encodedupload1);

           }

              catch (Exception e) {
              logger.error("Exception is: "+e);

         }

               try {
                  if(fileInputStreamReader!=null)

                  fileInputStreamReader.close();  

                  }catch (Exception e) {

               logger.error("Exception is: "+e);

              } 
        }
      else{

                   File destinationFile = new File(context.getRealPath("/WEB-INF/cvs")+ File.separator + getApplicant.getUplaodcv());
                   pdffile1 =  getApplicant.getUplaodcv();
                   FileInputStream fileInputStreamReader = null;

           try
           {
                 fileInputStreamReader = new FileInputStream(destinationFile);
                 byte[] bytes = new byte[(int)destinationFile.length()];
                 fileInputStreamReader.read(bytes);
                 String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
                 getApplicant.setUplaodcv(encodedupload1);  
           }catch (Exception e) {

           logger.error("Exception is: "+e);

           }
           
            try {
                   if(fileInputStreamReader!=null)
                   fileInputStreamReader.close();

            }catch (Exception e) {
            	logger.error("Exception is: "+e);

             } 
        }

        int result =applicationService.updateCvsDocument(pdffile1, applicantid);
        File destinationFile = new File(context.getRealPath("/WEB-INF/cvs"));
        String docXFileName=beforeDot+".docx";
        String docFileName=beforeDot+".doc";
        if(result>0){
         documentDelete=new DocumentDeleteUtility();
         documentDelete.deleteDocument(destinationFile, docXFileName);
         }
        
   }}catch(Exception e){

         logger.error("Exception is: "+e);

        }

   return getApplicant;

}

	   @RequestMapping(value="/user/cvOtherUploadDocument",method=RequestMethod.POST)
       public @ResponseBody Applicants OtherUploadDocument(@RequestParam(value="applicantid", required=false) int applicantid) {
         logger.info("applicantid:"+applicantid);

                 Applicants  getApplicant=null;
                 String pdffile=null;
                 String pdffile1=null;
                 DocumentDeleteUtility documentDelete=null;
                 String beforeDot=null;
           try{

                getApplicant=applicantionService.getOtherUploadDocuments(applicantid);

          if(getApplicant.getOtheruploads()!=null){

                String otherUploadcv=getApplicant.getOtheruploads();
                int index = otherUploadcv.lastIndexOf(".");
       		    int addvalue=index+1;
       		    String lastDot= otherUploadcv.substring(addvalue);
       		    logger.info("lastDot:"+lastDot);

           if( lastDot.equals("docx"))
        	  
           {      

                String filename = context.getRealPath("/WEB-INF/cvs/")+getApplicant.getOtheruploads();
                int lastIndxDot = otherUploadcv.lastIndexOf('.');
        	    if (lastIndxDot != -1) {
        	    	beforeDot = otherUploadcv.substring(0, lastIndxDot);
        	    	 logger.info("afterDot:"+beforeDot);
        	    }
                pdffile=context.getRealPath("/WEB-INF/cvs/")+beforeDot+".pdf";
                pdffile1=beforeDot+".pdf";

                logger.info("pdffile1:"+pdffile1);

                WordConvertPDF wordconvertpdf=new WordConvertPDF();
                wordconvertpdf.ConvertToPDF(filename, pdffile);
                File destinationFile = new File(pdffile);

                FileInputStream fileInputStreamReader = null;

         try{

                fileInputStreamReader = new FileInputStream(destinationFile);
                byte[] bytes = new byte[(int)destinationFile.length()];
                fileInputStreamReader.read(bytes);
                String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
                getApplicant.setOtheruploads(encodedupload1);

           }

              catch (Exception e) {
              logger.error("Exception is: "+e);

         }

               try {
                  if(fileInputStreamReader!=null)

                  fileInputStreamReader.close();  

                  }catch (Exception e) {

               logger.error("Exception is: "+e);

              } 
        }
      else{

                   File destinationFile = new File(context.getRealPath("/WEB-INF/cvs")+ File.separator +getApplicant.getOtheruploads());
                   pdffile1 =  getApplicant.getOtheruploads();
                   FileInputStream fileInputStreamReader = null;

           try
           {
                 fileInputStreamReader = new FileInputStream(destinationFile);
                 byte[] bytes = new byte[(int)destinationFile.length()];
                 fileInputStreamReader.read(bytes);
                 String  encodedupload1 = new String(Base64.encodeBase64(bytes), "UTF-8");
                 getApplicant.setOtheruploads(encodedupload1);  
           }catch (Exception e) {

           logger.error("Exception is: "+e);

           }
           
            try {
                   if(fileInputStreamReader!=null)
                   fileInputStreamReader.close();

            }catch (Exception e) {
            	logger.error("Exception is: "+e);

             } 
        }
           int result= applicationService.updateCvsDocument1(pdffile1, applicantid);
           File destinationFile = new File(context.getRealPath("/WEB-INF/cvs"));
           String docXFileName=beforeDot+".docx";
           String docFileName=beforeDot+".doc";
           if(result>0){
            documentDelete=new DocumentDeleteUtility();
            documentDelete.deleteDocument(destinationFile, docXFileName);
          }

       }           
   }catch(Exception e){

         logger.error("Exception is: "+e);

        }

   return getApplicant;

}


}
