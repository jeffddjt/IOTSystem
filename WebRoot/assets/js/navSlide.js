$(function () {
   
    $("#notice").click(function () {
        $("#dian").show().animate({ height: "150px"});
    });

   
    
 
    $("#dian").mouseout(function () {
        $("#dian").animate({ height: "0px" }).hide();
    });
    

    $(".sideMenu").slide({
        titCell: "h3",
        targetCell: "ul",
        defaultIndex: 0,
        effect: 'slideDown',
        delayTime: '500',
        trigger: 'click',
        triggerTime: '150',
        defaultPlay: true,
        returnDefault: false,
        easing: 'easeInQuint',
        endFun: function () {
            scrollWW();
        }
    });
    $(window).resize(function () {
        scrollWW();
    });
});
function scrollWW() {
    if ($(".side").height() < $(".sideMenu").height()) {
        $(".scroll").show();
        var pos = $(".sideMenu ul:visible").position().top - 50;
        $('.sideMenu').animate({ top: -pos });
    } else {
        $(".scroll").hide();
        $('.sideMenu').animate({ top: 0 });
        n = 1;
    }
}

var n = 1;
function menuScroll(num) {
    var Scroll = $('.sideMenu');
    var ScrollP = $('.sideMenu').position();
    /*alert(n);
    alert(ScrollP.top);*/
    if (num == 1) {
        Scroll.animate({ top: ScrollP.top - 150 });
        n = n + 1;
    } else {
        if (ScrollP.top > -150 && ScrollP.top != 0) { ScrollP.top = -150; }
        if (ScrollP.top < 0) {
            Scroll.animate({ top: 150 + ScrollP.top });
        } else {
            n = 1;
        }
        if (n > 1) {
            n = n - 1;
        }
    }

}