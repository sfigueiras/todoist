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
//= require foundation
//= require turbolinks
//= require masonry/jquery.masonry
//= require_tree .

$(function(){ $(document).foundation(); });

var ready = function() {
	$('.task').on('mouseover', function() {
		var $remove = $(this).find('.remove');
		$remove.css({display: 'inline-block'});
	});

	$('.task').on('mouseout', function() {
		var $remove = $(this).find('.remove');
		$remove.css({display: 'none'});
	});

	$('.updatable').bind('change', function() {
		$form = $(this).closest('form')[0];
		$form.submit();
	});

	$('.state').change(function() {
		$description = $(this).closest('form').find('.description');
		if(this.checked) {
			cross($description);
		} else {
			uncross($description);
		}
	});

	$('.card').on('click', function() {
		window.location = $(this).prev().prop('href');
	});

	$('#masonry-container').masonry({
		isFitWidth: true	
	});

	$('.copy').on('click', function() {
		if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
		  debugger;
	        var textarea = document.createElement("textarea");
	        textarea.textContent = text;
	        textarea.style.position = "fixed";  // Prevent scrolling to bottom of page in MS Edge.
	        document.body.appendChild(textarea);
	        textarea.select();
	        try {
	            return document.execCommand("copy");  // Security exception may be thrown by some browsers.
	        } catch (ex) {
	            console.warn("Copy to clipboard failed.", ex);
	            return false;
	        } finally {
	            document.body.removeChild(textarea);
	        }
	      }
	})

	function cross(element) {
		element.addClass('crossed');
	}

	function uncross(element) {
		element.removeClass('crossed');
	}
}

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
