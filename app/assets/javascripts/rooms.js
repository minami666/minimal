$(function(){
    // モーダル表示
    $(".roomimages_show__room_detail__left").on("click",function(){
        $(".test").css('display','block');
        $(".wrapper__roomimages_modal").css({'width':'auto','height':'70%'});
        $(".wrapper__roomimages_modal").css('opacity','1');
        $(".roomimages_show__topbox").fadeIn("3000");
    });

    // モーダル解除
    $(".wrapper__roomimages_modal").on("click",function(){
        $(".wrapper__roomimages_modal").css({'opacity':'0','width':'0','height':'0'});
        $(".test").css('display','none');
    });
})