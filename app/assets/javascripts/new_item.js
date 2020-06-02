$(function(){

  var dataBox = new DataTransfer();

  var file_field = document.querySelector('input[type=file]')

  $('.file-field').change(function(e){

    file = e.target.files[0]

    $.each(this.files, function(i, file){

      var fileReader = new FileReader();

      dataBox.items.add(file)

      file_field.files = dataBox.files

    var num = $(".item-content").length + 1 + i
    
    fileReader.readAsDataURL(file);

    if (num == 10){
      var none = {
        "display": "none"
      }
      $(".new-wrapper__main__image-field").css(none);
    }
     
    fileReader.onloadend = function() {
      var src = fileReader.result
      console.log(src)
      var html = `
      <div class='item-content'>
      <img src="${src}" width="114" height="80" class="item-content__icon">
      <button class='item-content__delete'>削除</button>
      </div>`
      var css = {
        "display": "flex",
        "flex-wrap": "wrap" 
      }
      $(".image-preview").css(css);

      $(".new-wrapper__main__image-field").before(html);
    };
    });
  });

  $(".new-wrapper__main").on("click", '.item-content__delete', function(e){

    var target_image = $(this).parent()
    
    target_image.remove();
    
    num = $(".item-content").length

    if(9 == num){
      var block = {
        "display": "block"
      }
      $(".new-wrapper__main__image-field").css(block);

      $('.new-wrapper__main__image-field')[0].style.removeProperty({"display": "none"});
   }
  })
});