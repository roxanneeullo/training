// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require react
//= require react_ujs
//= require components
//= require autosize
//= require_tree .
	
	$(document).ready(function() {
	      var review_text = $("#review_text");
	      var counter     = $("#counter");
	      var max_length  = 500;
				var text = 'Chars left: ';

	      review_text.keyup(function() {
					var limit = max_length - $(this).val().length;
					var out = text + limit;
	        counter.text(out);
	      });
				
				$('#post_btn').attr('disabled',true);
				    $('#review_text').keyup(function(){
				        if($(this).val().length !=0)
				            $('#post_btn').attr('disabled', false);            
				        else
				            $('#post_btn').attr('disabled',true);
				    })

						function handleFileSelect(evt) {
						    var files = evt.target.files; // FileList object
						      f=files[0]
						      // Only process image files.
						      if (f.type.match('image.*')) {
						        var reader = new FileReader();
						        reader.onload = (function(theFile) {
						          return function(e) {
						            // alert(e.target.result);
						            document.getElementById('preview').src=e.target.result;
						          };
						        })(f);

						      // Read in the image file as a data URL.
						      reader.readAsDataURL(f);
						      }
						    }
						  document.getElementById('preview-here').addEventListener('change', handleFileSelect, false);
							
							
	    });
			
			
			
			