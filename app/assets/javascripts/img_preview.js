$(document).on("turbolinks:load",function(){

  $(".js-img_preview").change(function(){
    if(!this.files.length){
      return;
    };
    var file = this.files[0],
        $img = $(this).next();
    upload(file, $img);
  });

  function upload(file, $img) {
    var reader = new FileReader();
    reader.onload = function(event) {
      $img.attr("src", event.target.result);
      $img.addClass("fit_img");
      if (($img).parent(/\.height.00/)){
        $($img).parent(/\.height.00/).removeClass(function(index, className){
        return className.match(/height.00/)[0];
        });
      };
    };

    reader.readAsDataURL(file);
  };
});
