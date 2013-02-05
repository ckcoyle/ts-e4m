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


	$("#signup").bind "submit", (e) ->
		e.preventDefault()
		$("#signup").addClass "loading"
		$(this).ajaxSubmit success: ->
			$("#signup").removeClass "loading"
			$("#email").val "Thanks, Check Your Inbox!"
			$("#email, #submit").prop "disabled", true
