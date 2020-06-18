$(document).on('turbolinks:load', ()=> {

  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="item-content">
                    <label class="label-images">
                      <i class="fas fa-camera"></i>
                      <input class="file-field" type="file"
                      name="item[images_attributes][${index}][image]"
                      id="item_images_attributes_${index}_image"><br>
                    </label>
                    <div class="item-content__delete">削除</div>
                  </div>`;
    return html;
  }

  const buildImg = (index,url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.file-field', function(e) {

    const targetIndex = $(this).parent().parent().data('index');
    console.log(targetIndex)
    const file = e.target.files[0];
    console.log(file)
    const blobUrl = window.URL.createObjectURL(file);
    console.log(blobUrl)
    $("#previews").append(buildImg(targetIndex, blobUrl));

    const css = {
      "display": "flex",
      "flex-wrap": "wrap",
      "height": "360px"
    }
    $(".new-wrapper__main__image-field__text").css('display','none');
    $('#image-box').css(css);
    $('#previews').css(css);
    
    $(".file-field").css('display','none');

    $('img').css('margin', '40px 0px 0px 7px');


    $('#previews').append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    $(".item-content__delete").css('margin-top', '40px').css('text-align', 'left');

    $(".label-image").css('display', 'none');
    
    const aaa = $(this).parent().parent().children().children().css('visibility', 'hidden');
    console.log(aaa)

    $(".item-content__delete").css('margin-top', '40px');

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.item-content__delete', function() {
    $(this).parent().prev().remove();
    $(this).remove();
    // $("i").css('display', 'none');

    if ($('.file-field').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});