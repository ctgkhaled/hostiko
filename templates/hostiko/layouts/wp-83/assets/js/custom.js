
// console.log("Owl caraousal");
$(document).ready(function($) {
    $('.hostiko_carousel').owlCarousel({
        loop:true,
        margin:10,
        nav: false,
        dots: true,
        autoplay: false,
        autoplayTimeout: 4500,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
            },
            575:{
                items:2,
            },
            768:{
                items:2,
            },
            922:{
                items:3,
            },
            1200:{
                items:4,
                // loop:false
            }
        }
    })
});