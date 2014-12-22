jQuery.noConflict()(function($){
	"use strict";
	$(document).ready(function() {

		$('ul.sf-menu').superfish({
			//delay: 300,
			autoArrows:false,
			dropShadows:false,
			/*hoverClass:    'sfhover',*/
			animation:     {opacity: "show", marginTop: "0"},
			animationOut:  {opacity: "hide", marginTop: "20"}
		});

		// Create mobile drop-down menu
		$("<select />").appendTo(".navigation-main");
		$("<option />",{
			"selected":"selected",
			"value":"",
			"text": ( typeof ct_localization != 'undefined' || ct_localization != null ) ? ct_localization.go_to : "MENU"
		}).appendTo(".navigation-main select");
		$(".navigation-main li a").each(function() {
			var el = $(this);
			$("<option />",{
				"value":el.attr("href"),
				"text":el.text()
			}).appendTo(".navigation-main select");
		});

		$(".navigation-main select").change(function() {
			window.location = $(this).find("option:selected").val();
		});

		// Remove items with null URL
		$(".navigation-main select option[value='#']").each(function() {
			$(this).remove();
		});

		//$('#blog-entry').css({'background-color':'transparent'});


		$('.format-chat .entry-content p').each(function() {
			var h = $(this).html();
			var index = h.indexOf(' ');
			if(index == -1) {
				index = h.length;
			}
			$(this).html('<span class="chat-first-word">' + h.substring(0, index) + '</span>' + h.substring(index, h.length));
		});

		// Search
		$('.searchform').click(function(e){
			e.stopPropagation();
		});

		$('.entry-search .search-toggle').click(function(e){
			e.stopPropagation();

			if ($(this).parent().find('.search-container').css('display')=='block') {
				$(this).parent().find('.search-container').hide();
				$(this).parent().find('.search-toggle').removeClass("colored");
			} else {
				$(this).parent().find('.search-container').show();
				$(this).parent().find('.search-toggle').addClass("colored");
			}
		});

		$(document).click(function(){
			$('#masthead .search-container').hide();
			$('#sticky-header .search-container').hide();
			$('#masthead .search-toggle').removeClass("colored");
			$('#sticky-header .search-toggle').removeClass("colored");
			//console.log('fooo');
		});

		// Add .btn class to default form button
		$( ".form-submit input[type=submit]" ).addClass( "btn" );
		$( ".wpcf7-form input[type=submit]" ).addClass( "btn" );


		// Load Scroll To Top
		$(window).scroll(function(){
			if ($(this).scrollTop() > 100) {
				$('.ct-totop').fadeIn();
			} else {
				$('.ct-totop').fadeOut();
			}
		}); 

		$('.ct-totop').click(function(){
			$("html, body").animate({ scrollTop: 0 }, 600);
			return false;
		});


		// Custom scripts
		var ct_script_pretty = customjs.script_pretty;

		if ( ct_script_pretty == '1' ) {
			// Load Pretty Photo
			$('a[data-rel]').each(function() {
				$(this).attr('rel', $(this).data('rel'));
			});

			$("a[rel^='prettyPhoto']").prettyPhoto({
				animationSpeed: 'normal', /* fast/slow/normal */
				opacity: 0.80, /* Value between 0 and 1 */
				showTitle: false, /* true/false */
				theme:'light_square',
				deeplinking: false
			});
		} // Load Pretty Photo



		// Sticky Menu
		var ct_sticky_menu = stickymenu.sticky_menu;

		if ( ct_sticky_menu == '1' ) {

			var ct_menu_background = stickymenu.menu_background;
			var ct_rgba = stickymenu.rgba;
			var ct_admin_bar = stickymenu.admin_bar;
			var ct_logo_padding = stickymenu.logo_padding_px;
			var ct_menu_padding = stickymenu.menu_padding_px;
			var ct_i = 0;

			if ( ct_admin_bar == '0' ) {
				var sticky_navigation_offset_top = $('#entry-header').offset().top;
			} else {
				var sticky_navigation_offset_top = $('#entry-header').offset().top-32;
			}
			
			var sticky_navigation = function(){
				var scroll_top = $(window).scrollTop(); // our current vertical position from the top
				var menuheight = $('#entry-header').height();

				//console.log(sticky_navigation_offset_top);

				if (scroll_top > menuheight) { 
					if ( ct_admin_bar == '0' ) {
						$('#sticky-header').css({ 'background-color': ct_rgba, 'display': 'block' });

						if ( ct_i == 0) {
							$( "#sticky-header" ).animate({
								top: "0",
							}, 500 );

							ct_i++;
						}
					} else {
						$('#sticky-header').css({ 'background-color': ct_rgba, 'display': 'block' });

						if ( ct_i == 0) {
							$( "#sticky-header" ).animate({
								top: "32",
							}, 500 );

							ct_i++;
						}
					}
				} else {
					$('#sticky-header').css({ 'top': -100, 'display': 'none' });

					ct_i = 0;
				}
			};

			// run our function on load
			sticky_navigation();

			// and run it again every time you scroll
			$(window).scroll(function() {
				sticky_navigation();
			});
		} //ct_sticky_menu

	}); //$(document).ready
}); //jQuery.noConflict


jQuery.noConflict()(function($){
	$(window).load(function() {    
		"use strict";

		// equal heigth for content and sidebar
		var ct_flex_slider = ctsidebar.flex_slider;
		var ct_primary_height = $("#primary").height()
		var ct_secondary_height = $("#secondary").height()

		if ( ct_primary_height > ct_secondary_height ) {
			if ( ct_flex_slider == 1) {
				var ct_height = $("#primary").height() + 422 + 20 +'px';
			} else {
				var ct_height = $("#primary").height() + 'px';
			}
		}

		//console.log( ct_height );

		$("#secondary").css( { 'height': ct_height } );

		/*$( "#secondary" ).animate({
			height: ct_height
		}, 500, function() {
			// Animation complete.
		});*/
	});
});