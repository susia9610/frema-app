$(document).on('turbolinks:load', ()=> {

  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class=item-content>
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"<br>
                    <div class="item-content__delete">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $(".new-wrapper__main__image-field").on('change', '.file-field', function(e) {
    
    $(".new-wrapper__main__image-field").append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });
  $(".new-wrapper__main__image-field").on('click', '.item-content__delete', function(){
    $(this).parent().remove();

    if ($('.item-content').length == 0) $(".new-wrapper__main__image-field").append(buildFileField(fileIndex[0]));
  });
  
});