function checkKey(e)
{
	var key;
	var keychar;
	var numcheck;
	var sender_text_field = $("input#sender_text_field")[0];

	if ( window.event ) key = e.keyCode; // IE
	else if ( e.which ) key = e.which; 	// Netscape/Firefox/Opera
	
	if(key == 13) sendMsg();
	else if(key ==8 || key == 32 || key == undefined) return true;
	else
	{
		keychar = String.fromCharCode(key)
		numcheck = /^[a-zA-Z0-9@\-\_\?\.]+$/;
		return numcheck.test(keychar);
	}
}

function sendMsg()
{
	var message = $("#sender_text_field")[0].value;
	var msgBox	= $("#message_panel")[0];
	
	if ( message.replace(/\s|\t/g, '') != '' )
		$.post("/conversation", { phrase: message }, function(data) {
		      $("#server_message").html(
		        $("#server_message").html() +
		        "<p> You said: " + message +"</p>" +
		        "<p>" + data + "</p>"
		      );
						msgBox.scrollTop = msgBox.scrollHeight;
		    });
		
  $("#sender_text_field")[0].value = "";
}