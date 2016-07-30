$(document).on("turbolinks:load",function(){

  $(".js-avatar_preview").change(function(){
    if(!this.files.length){
      return;
    };
    var file = this.files[0],
        $img = $(this).parent();
    upload(file, $img);
  });

  function upload(file, $img) {
    var reader = new FileReader();
    reader.onload = function(event) {
      $img.attr("style", "background-image: url("+ event.target.result + ");");
    };
    reader.readAsDataURL(file);
  };
});
