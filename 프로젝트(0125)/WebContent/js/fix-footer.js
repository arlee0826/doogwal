var $footer = $("#footer");

function fixFooter() {
	
	console.log("리사이즈됨!");
	
    var wHeight = $(window).height();
    var bHeight = $("body").height()+80;


    if($footer.hasClass("fixed")) {
        bHeight += 150;
    }

    if(wHeight>=bHeight) {
        $footer.addClass("fixed");
    }else {
        $footer.removeClass("fixed");
    }
}

$(window).resize(fixFooter);

fixFooter();