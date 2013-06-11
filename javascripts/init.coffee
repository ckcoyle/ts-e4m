$(document).ready ->
	$("input.erase").each ->
		$(this).data("default", $(this).val()).addClass("inactive").focus(->
			$(this).removeClass "inactive"
			$(this).val ""	if $(this).val() is $(this).data("default") or ""
		).blur ->
			default_val = $(this).data("default")
			if $(this).val() is ""
				$(this).addClass "inactive"
				$(this).val $(this).data("default")


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
