$(function(){

  var dataBox = new DataTransfer();

  var file_field = document.querySelector('input[type=file]')

  $('.file-field').change(function(e){
    console.log("OK")

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
      console.log(num)
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
      // var image = `<div class='new-wrapper__main__image-field'>
      //              <label class="label-image">
      //              <i class="fas fa-camera"></i>
      //              <input class="file-field" type="file">
      //              </label>
      //              <div class="new-wrapper__main__image-field__text">クリックでアップロード</div>
      //              </div>`

      var flex = {"display": "flex"}
      // var field = $(".new-wrapper__main__image-field");
    

      // $(".item-content:last").after(field)
      // $(".item-content:last").css(flex);

      
      // $(".item-content__delete").css(initial);

      // $(".new-wrapper__main__image-field").css({'width': `calc(100% - 650px)`});

     
      
   }
    console.log(num)
  })
});


