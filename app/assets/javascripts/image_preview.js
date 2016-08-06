$(document).on("ready page:load", function(){
  const mainImageId = "#js-main-image"

  function uploadImage(idName){
    $(idName + ' input[type=file]').change(function(){
      let upfile = $(this).prop('files')[0];
      if(upfile.type.match('image.*')) {
        setImage(upfile, idName);
      } else {
        alert("Please upload image");
      }
    });
  }

  function setImage(upfile, idName) {
    var reader = new FileReader();
    reader.onload = function() {
      $(idName + ' img').attr('src', reader.result);
      $(idName + ' img').addClass("image-preview")
      $('.cover-image-upload').css({'background': 'white'});
    }
    reader.readAsDataURL(upfile);
  }

  uploadImage(mainImageId);
})
