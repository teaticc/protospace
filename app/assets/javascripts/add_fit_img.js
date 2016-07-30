$(document).on("turbolinks:load",function(){
  $("img.add_fit_img").each(function(){
    if (($(this).attr("src")) && ($(this).parent(/\.height.00/))){
      $(this).addClass("fit_img");
      $(this).parent(/\.height.00/).removeClass(function(index, className){
        return className.match(/height.00/)[0]
      });
    };
  });
});
