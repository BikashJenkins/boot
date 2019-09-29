
	var type1;
	var type2;
	var templatedata;
	var template_id;
	var doc1;
	var doc2;
	$("#cvupload").change(function() {
		var filesSelected = document.getElementById("cvupload").files;
		if (filesSelected.length > 0) {
			var fileToLoad = filesSelected[0];
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {
				var base64value = fileLoadedEvent.target.result;
				base64 = base64value.split(',')[1];
				var type = base64value.split('/')[1];
				type1 = type.split(';')[0];
				$("#response").val(base64);
			};
			fileReader.readAsDataURL(fileToLoad);
		}
	});
	$("#cvupload1").change(function() {
		var filesSelected = document.getElementById("cvupload1").files;
		if (filesSelected.length > 0) {
			var fileToLoad = filesSelected[0];
			var fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent) {
				var base64value = fileLoadedEvent.target.result;
				base64 = base64value.split(',')[1];
				var type = base64value.split('/')[1];
				type2 = type.split(';')[0];
				$("#response1").val(base64);
			};
			fileReader.readAsDataURL(fileToLoad);
		}
	});
	
	
	$('#myCheckbox').click(function() {
		if ($('#myCheckbox').is(':checked')) {
			$('#jobup').css('display', 'none');
			$('#controls').css('display', 'none');

		} else {
			$('#jobup').css('display', 'block');

		}
	});
	$('#myCheckbox1').click(function() {
		if ($('#myCheckbox1').is(':checked')) {

			$('#checkotp').css('display', 'none');
		} else {
			$("#checkotp").css("display", "block");
			
		}
	});
	
	$(document)
			.ready(
					function() {
						$("textarea").prop('disabled', true);
						$('input[type="text"], date').prop("disabled", true);
						$("#templatename").prop('disabled', false);
						$('#myCheckbox1').attr('disabled', true);
						$('#myCheckbox').attr('disabled', true);
						$("#upload").css("display", 'none');
						$
								.ajax({
									type : "POST",
									url : "${pageContext.servletContext.contextPath}/user/getAllTemplateNames",
									dataType : "json",
									complete : function(data) {
										console.log(data);
										templatedata = data;
										for (var i = 0; i < data.responseJSON.length; i++) {
											$('#template')
													.append(
															$(
																	'<option>',
																	{
																		value : data.responseJSON[i].template_id,
																		text : data.responseJSON[i].template_name
																	}));
										}
									}
								})

						$('#template').select2();
					})
	$("#template")
			.on(
					"change",
					function() {
						$("#temdoc2").text("");
						$("#temdoc1").text("");
						var selected = $(this).val();
						for (var i = 0; i < templatedata.responseJSON.length; i++) {
							if (selected == templatedata.responseJSON[i].template_id) {
								template_id = templatedata.responseJSON[i].template_id;
								$('#subject').val(
										templatedata.responseJSON[i].subject);
								$('#body').val(
										templatedata.responseJSON[i].body);
								$('#documents').css('display', 'block');
								if (templatedata.responseJSON[i].attachement == null) {
									$("#doc1").css('display', 'none');
								} else {
									doc1 = templatedata.responseJSON[i].attachement;
									$("#jobdoc1")
									.text(
											templatedata.responseJSON[i].attachement
													.replace(/[\d_]+/g, ''));
								}
								if (templatedata.responseJSON[i].attachement1 == null) {
									$("#doc2").css('display', 'none');
								} else {
									doc2 = templatedata.responseJSON[i].attachement1;
									$('#jobdoc2')
											.text(
													templatedata.responseJSON[i].attachement1
															.replace(/[\d_]+/g,
																	''));
								}
								
							}
						}
					});

	function checkedit() {
		$('input[type="text"], date, select').prop("disabled", false);
		$("#reg").css("display", "none");
		$("#update").css("display", "block");
		$("#register").css("display", "none");
		$('#upload').css('display', 'block');
		$('#checkotp').css('display', 'block');
		$('#myCheckbox1').attr('disabled', false);
		$('#myCheckbox').attr('disabled', false);
		$("textarea").prop('disabled', false);
		$('#success').text('');
		$('#success1').text('');
		$('#jobid').text("");
	}

	function updatejob() {

		if ($('#template').text() == ''
				|| $('#template').text().trim() == '') {
			$('#error').text('Template Name is required !');
			$('#error1').text('Template Name is required !');
			$('#template').attr('style',
					"border-radius: 5px; border:#FF0000 1px solid;");
			return;
		} else {
			var name = $('#template').text();
		}
		if ($('#subject').val() == '' || $('#subject').val().trim() == '') {
			$('#error').text('Subject is required !');
			$('#error1').text('Subject is required !');
			$('#subject').attr('style',
					"border-radius: 5px; border:#FF0000 1px solid;");
			return;
		} else {
			var subject = $('#subject').val();
		}
		if ($('#body').val() == '' || $('#body').val().trim() == '') {
			$('#error').text('Body is required !');
			$('#error1').text('Body is required !');
			$('#body').attr('style',
					"border-radius: 5px; border:#FF0000 1px solid;");
			return;
		} else {
			var body = $('#body').val();
		}

		if ($('#myCheckbox').is(':checked')) {

		} else {
			if ($('#cvupload').val() == '' || $('#cvupload').val().trim() == '') {
				$('#error').text('Upload attachment is required !');
				$('#error1').text('Upload attachment is required !');
				$('#body').attr('style',
						"border-radius: 5px; border:#FF0000 1px solid;");
				return;
			} else {

			}
		}
		var path = $('#cvupload').val();
		var filename = path.match(/[^\\/]*$/)[0];
		var res = filename.split(".");
		var documentName = res[0];
		var resfile = $('#response').val();
		var filetype = type1;

		if ($('#myCheckbox1').is(':checked')) {

		} else {
			var path1 = $('#cvupload1').val();
			var filename1 = path1.match(/[^\\/]*$/)[0];
			var res1 = filename1.split(".");
			var documentName1 = res1[0];
			var resfile2 = $('#response1').val();
			var filetype1 = type2;
		}

		var json = {
			template_name : name,
			subject : subject,
			body : body,
			attachement : resfile,
			attachement1 : resfile2,
			fileType : filetype,
			fileType1 : filetype1,
			documentName : documentName,
			documentName1 : documentName1,
			template_id : template_id
		}
		console.log(json);
		$
				.ajax({
					type : "POST",
					data : {
						createtemplate : JSON.stringify(json)
					},
					dataType : "json",
					url : "${pageContext.servletContext.contextPath}/user/updateTemplate",
					complete : function(response) {
						console.log(response);
						if ("success" == response.responseText) {
							$('#reg').attr("disabled", true);
							$("#reg").css("display", "none");
							$("#update").css("display", "none");
							$('#register').css("display", "block");
							$('input[type="text"], date, select,file').prop(
									"disabled", true);
							$("textarea").prop('disabled', true);
							$('#myCheckbox1').attr('disabled', true);
							$('#myCheckbox').attr('disabled', true);
							$('#upload').css('display', 'none');
							$('#documents').css('display', 'block');
							$('#checkotp').css('display', 'none');
							$("#cvupload1").val('');
							$("#cvupload").val('');
							$("#response1").val('');
							$('#response').val('');
						 	$('#jobid').text(template_id);	
							documents(template_id)
							type1 = null;
							type2 = null;
							$('#success').text(
									'Template is updated succesfully!');
							$('#success1').text(
									'Template is updated succesfully!');
							$('#error').text('');
							$('#error1').text('');

						} else if ("fail" == response.responseText) {
							$('#error').text('Template update failed!');
							$('#error1').text('Template update failed!');
							$('#success').text('');
							$('#success1').text('');

						}

					}
				});
	}
	function temporg() {
		$
				.ajax({
					type : "POST",
					url : "${pageContext.servletContext.contextPath}/user/sendTemplateDocument",
					dataType : "json",
					data : {
						templateId : template_id
					},
					complete : function(data) {
						console.log(data);
						var voterimage = "data:application/pdf;base64,";
						voterimage += data.responseJSON.attachement;
						var win = window.open();
						win.document
								.write('<iframe src="'
										+ voterimage
										+ '" frameborder="0" style="border:0; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%;" allowfullscreen></iframe>');
					}
				});
	}
	function temporg1() {
		$
				.ajax({
					type : "POST",
					url : "${pageContext.servletContext.contextPath}/user/sendTemplateDocument",
					dataType : "json",
					data : {
						templateId : template_id
					},
					complete : function(data) {
						console.log(data);
						var voterimage = "data:application/pdf;base64,";
						voterimage += data.responseJSON.attachement1;
						var win = window.open();
						win.document
								.write('<iframe src="'
										+ voterimage
										+ '" frameborder="0" style="border:0; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%;" allowfullscreen></iframe>');
					}
				});
	}
	
	function firstdocdel(){
		$
		.ajax({
			type : "POST",
			url : "${pageContext.servletContext.contextPath}/user/deleteTemplateFile",
			data : {templateId:template_id,filename:doc1,fileNumber:1},
			dataType : "json",
			complete : function(data) {
				console.log(data);
				documents(template_id);
	}
		})
		}
	
	function seconddocdel(){
		alert(doc2);
		$
		.ajax({
			type : "POST",
			url : "${pageContext.servletContext.contextPath}/user/deleteTemplateFile",
			data : {templateId:template_id,filename:doc2,fileNumber:2},
			dataType : "json",
			complete : function(data) {
				console.log(data);
				documents(template_id);
	}
		})
		}
	
	
	function upload() {
		$("#controls").css("display", "none");
		$("#checkotp").css("display", "block");
	}
	
	function documents(templateid){
		 $('#jobdoc2')
			.text("");
		 $('#jobdoc1')
			.text("");
			$
			.ajax({
				type : "POST",
				url : "${pageContext.servletContext.contextPath}/user/getAttachments",
				dataType : "json",
				data : {
					template_id : templateid
				},
				complete : function(data) {
					  console.log(data);
					  if (data.responseJSON[0].attachement == null) {
							$("#doc1").css('display',
									'none');
						} 
						else {
							doc1 = data.responseJSON[0].attachement;
							$("#jobdoc1")
									.text(
											data.responseJSON[0].attachement.replace(/[\d_]+/g, ''));
						}
					if (data.responseJSON[0].attachement1 == null) {
						$("#doc2").css('display',
								'none');
					} 
					else {
						if (data.responseJSON[0].attachement1 == null) {
							$("#doc2").css('display',
									'none');
						}
						else{
							$("#doc2").css('display',
							'block');
							doc2 = data.responseJSON[0].attachement1;
						$('#jobdoc2')
								.text(
										data.responseJSON[0].attachement1.replace(/[\d_]+/g, ''));
						}
					}
					

				}
			});
		}
