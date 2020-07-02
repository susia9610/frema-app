$(document).on('turbolinks:load', () => {
  const buildFileField = (index)=> {
    const html = `
                    <label class="label-images">
                      <i class="fas fa-camera"></i>
                      <input class="file-field" type="file"
                      name="item[images_attributes][${index}][image]"
                      id="item_images_attributes_${index}_image"><br>
                    </label>
                    `;
    return html;
  }
  const buildDelete = (index)=> {
    const html = `<div data-index="${index}" class="item-content">
                    <div class="item-content__delete">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index,url)=> {
    const html = `<div class="preview-box">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                  </div>`;
    return html;
  }
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  lastIndex = $('.item-content:last').data('index');
  fileIndex.splice(0,lastIndex);
  $('.hidden-destroy').hide();
  if (document.location.href.match(/\/items\/\d+\/edit/)){
    const css = {
      "display": "flex",
      "flex-wrap": "wrap",
      "height": "360px"
    }
    $(".new-wrapper__main__image-field__text").css('display','none');
    $('#image-box').css(css);
    $('#previews').css(css);
    $(".file-field").css('display','none');
    $('img').css('margin', '40px 12px 0px 12px');
    $(".label-image").not(".label-image:last").css('display', 'none');
  }
  $('#image-box').on('change', '.file-field', function(e) {
    const targetIndex = $(this).parent().parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $("#previews").append(buildImg(targetIndex, blobUrl));
    const css = {
      "display": "flex",
      "flex-wrap": "wrap",
      "height": "360px"
    }
    $(".new-wrapper__main__image-field__text").css('display', 'none');
    $('#image-box').css(css);
    $('#previews').css(css);
    $(".file-field").css('display', 'none');
    $('img').css('margin', '40px 12px 0px 12px');
    $('#previews').append(buildFileField(fileIndex[0]));
    $(".preview-box:last").append(buildDelete(fileIndex[0]));
    fileIndex.shift();
    $(".label-image").css('display', 'none');
    $(this).parent().children().css('display', 'none')
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });
  $('#image-box').on('click', '.item-content__delete', function() {
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().prev().remove();
    $(this).remove();
    if ($('.file-field').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});