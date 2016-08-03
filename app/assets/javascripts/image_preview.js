$(document).on("ready page:load", function(){
  const mainImageId = "#js-main-image"

  function uploadImage(idName){
    $(idName + ' input[type=file]').change(function(){
      let file = $(this).prop('files')[0];
      if(file.type.match('image.*')) {
        setImage(file, idName);
      } else {
        alert("Please upload image");
      }
    });
  }

  function setImage(file, idName) {
    var reader = new FileReader();
    reader.onload = function() {
      $(idName + ' img').attr('src', reader.result);
      $(idName + ' img').addClass("image-preview")
      $('.cover-image-upload').css({'background': 'white'});
    }
    reader.readAsDataURL(file);
  }

  uploadImage(mainImageId);
})
