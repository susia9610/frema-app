//この1行目の記述でリロード時に動作
$(document).on('turbolinks:load', function(){
  //オプション設定
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  //子カテゴリー表示
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class="new-category-input-box" id="child_category" name="item[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>`;
    $('.new-category-box').append(childSelectHtml);
  }
  //孫カテゴリー表示
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `    <select class="new-category-input-box" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>`;
    $('.new-category-box').append(grandchildSelectHtml);
  }
  //親カテゴリー選択後イベント発火
  $('#category_form').on('change', function(){
    //選択された親カテゴリーのidを取得
    var parent_category_id = document.getElementById('category_form').value;
    if (parent_category_id != "---"){
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parent_category_id },
        dataType: 'json'
      })
      .done(function(children){
        //親カテゴリが変更された時に子・孫カテゴリを削除する
        $('#child_category').remove();
        $('#grandchild_category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
       //エラー警告
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').remove();
      $('#grandchild_category').remove();
    }
  });
  //子カテゴリー選択後イベント発火
  $('.new-category-box').on('change', '#child_category', function(){
    var child_category_id = $('#child_category option:selected').data('category');
    if (child_category_id != "---"){
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: child_category_id },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          //子カテゴリが変更された時に孫カテゴリを削除する
          $('#grandchild_category').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      //エラー警告
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category').remove();
    }
  });
});