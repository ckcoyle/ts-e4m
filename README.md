#[Topspin Powered HTML E4M]

##Overview
Quickly create an HTML and jQuery powered Topspin Email For Media Widget. Benefits include no Flash reliance, better mobile styling and completely custom interface. 

Making your own custom HTML E4M doesn't get any easier than this!

---
 
##Installation

###Include

````html
<script type="text/javascript" src="js/jquery.min.js"></script>
````

###HTML Form
This markup provides the necessary visible and hidden inputs to properly relay information to the Topspin REST API. Change the `artist_id`, `fan[source_campaign]`, and `fan[referring_url]`, `fan[confirmation_target]`. In order to provide the `fan[source_campaign]`, you will need a relevant Topspin account and an Email For Media widget created within the platform. To locate the `fan[source_campaign]`, simply do the following:

1. Find the widget_id="" url in your embed code
2. Paste that into a browser
3. Find the url inside the <campaign> tag (ex. http://app.topspin.net/api/v1/artist/1051/campaign/10150220)

In order to provide the `fan[confirmation_target]`, you will need to create a new Topspin Labs Download Anywhere URL. Go to http://labs.topspin.net/downloadanywhere/ and enter your credentials. Once generated, replace the `fan[confirmation_target]` value with your unique Download Anywhere URL.

````html
<form id="signup" action="" method="" >
	<input id="email"  name="fan[email]" type="email" value="enter your email here" placeholder="enter your email here" class="erase email" />	
	<input name="artist_id" value="1051" id="artist_id" type="hidden">
	<input name="fan[source_campaign]" value="http://app.topspin.net/api/v1/artist/1051/campaign/10150220" id="source_campaign" type="hidden">
	<input name="fan[referring_url]" value="http://www.builtbyeande.com" id="referring_url" type="hidden">
	<input name="fan[confirmation_target]" value="http://labs.topspin.net/downloadanywhere/confirm.php?sessionid=188a0d0a116380c2180c37a7dcb33e1e" id="confirmation_target" type="hidden">			
	<input id="submit" name="submit" type="submit" value="submit" />
</form>
````

###jQuery Form Method

Utilize jQuery's built in AJAX method to submit the form. Includes a basic success function that returns "Thanks, Check Your Inbox!" when on success.

````coffeescript
// ajax submit the form
	$("#signup").on "submit", (e) ->
		
		email = $("#email").val()
		source = $("#source_campaign").val()
		ref = $("#referring_url").val()
		confirmation = $("#confirmation_target").val()
		id = $("#artist_id").val()

		e.preventDefault()
		$("#signup").addClass "loading"
		
		$.ajax
			url: "http://app.topspin.net/api/v1/fan/create_fan"
			type: "POST"
			dataType: "jsonp"
			data: (
				fan:
					email: email
					source_campaign: source
					referring_url: ref
					confirmation_target: confirmation
					artist_id: id
			)
			success: (resp) ->
				$("#signup").removeClass "loading"
				$("#email").val "Thanks, Check Your Inbox!"
				$("#email, #submit").prop "disabled", true
````

###jQuery Input Clear

Include to handle basic active / inactive states on the HTML form. Provides a clean way to remove the placeholder text when in focus and add it back in when default.

````coffeescript
// clear out our form on focus
	$("input.erase").each ->
		$(this).data("default", $(this).val()).addClass("inactive").focus(->
			$(this).removeClass "inactive"
			$(this).val ""	if $(this).val() is $(this).data("default") or ""
		).blur ->
			default_val = $(this).data("default")
			if $(this).val() is ""
				$(this).addClass "inactive"
				$(this).val $(this).data("default")
````

---

##Copyright and License
Dual licensed under the MIT and GPL licenses:

* http://www.opensource.org/licenses/mit-license.php
* http://www.gnu.org/licenses/gpl.html

You may use the Topspin HTML E4M under the terms of either the MIT License or the GNU General Public License (GPL) Version 2.
The MIT License is recommended for most projects. It is simple and easy to understand and it places almost no restrictions on what you can do with the plugin.

If the GPL suits your project better you are also free to use the plugin under that license.

You don't have to do anything special to choose one license or the other and you don't have to notify anyone which license you are using. You are free to use the Topspin HTML E4M in commercial projects.

---
