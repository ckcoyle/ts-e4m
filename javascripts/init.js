// Generated by CoffeeScript 1.4.0
(function(){$(document).ready(function(){$("input.erase").each(function(){return $(this).data("default",$(this).val()).addClass("inactive").focus(function(){$(this).removeClass("inactive");if($(this).val()===$(this).data("default")||"")return $(this).val("")}).blur(function(){var e;e=$(this).data("default");if($(this).val()===""){$(this).addClass("inactive");return $(this).val($(this).data("default"))}})});return $("#signup").bind("submit",function(e){e.preventDefault();$("#signup").addClass("loading");return $(this).ajaxSubmit({success:function(){$("#signup").removeClass("loading");$("#email").val("Thanks, Check Your Inbox!");return $("#email, #submit").prop("disabled",!0)}})})})}).call(this);