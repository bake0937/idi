$(document).on("ready page:load", function () {
  var mainImageId = "#js-main-image";

  // アップロードする画像を選択
  function uploadImage(idName) {
    $(idName + ' input[type=file]').change(function () {
      var upfile = $(this).prop('files')[0];
      if (upfile.type.match('image.*')) {
        setImage(upfile, idName);
      } else {
        alert("Please upload image");
      }
    });
  }

  // アップロードする画像をプレビュー
  function setImage(upfile, idName) {
    var reader = new FileReader();
    reader.onload = function () {
      $(idName + ' img').attr('src', reader.result);
      $(idName + ' img').addClass("image-preview");
      $('.cover-image-upload').css({ 'background': 'white' });
    };
    reader.readAsDataURL(upfile);
  }

  uploadImage(mainImageId);
});
