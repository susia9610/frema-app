$(function(){

  var file_field = document.querySelector('input[type=file]')

  $('.file-field').change(function(e){
    file = e.target.files[0]

    var fileReader = new FileReader();

    fileReader.onloadend = function() {

      var src = fileReader.result
      var html= `<div class='item-content'>
      <img src="${src}" width="114" height="80" class="item-content__icon">
      <div class= 'item-content__delete'>削除</div>
      </div>`

      $(".new-wrapper__main__image-field").before(html);
    }
    fileReader.readAsDataURL(file);
  });
});