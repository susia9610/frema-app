$(function(){

  var file_field = document.querySelector('input[type=file]')

  $('.file-field').change(function(e){
    file = e.target.files[0]

    var fileReader = new FileReader();

    fileReader.onloadend = function() {

      var src = fileReader.result
      var html= `<div class='item-content'>
      <img src="${src}" width="114" height="80" class="item-content__icon">
      <button class= 'item-content__delete'>削除</button>
      </div>`

      $(".new-wrapper__main__image-field").before(html);
    }
    fileReader.readAsDataURL(file);
  });

  $(".new-wrapper__main").on("click", '.item-content__delete', function(e){
    // e.stopPropagation();

    var target_image = $(this).parent()
    
    target_image.remove();

    // file_field.val("")
  })

});