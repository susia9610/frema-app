$("#category_form").change(function () {
  // 選択した親の値を取得する
  let parentValue = $("#category_form").val();
  // 初期値("---")以外を選択したらajaxを開始
  if (parentValue.length != 0) {
    $.ajax({
      url: '/items/get_category_children',
      type: 'GET',
      // postsコントローラーにparamsをparent_idで送る
      data: { parent_id: parentValue },
      dataType: 'json'
    })
      .done(function (data) {
      })
      .fail(function () {
      });
  }
});

function build_childSelect() {
  let child_select = `
            <select name="items[category_id]" class="new-wrapper__main__input-select">
              <option value="">---</option>
            </select>
            `
  return child_select;
}

// selectタグにoptionタグを追加
function build_Option(children) {
  let option_html = `
                    <option value=${children.id}>${children.name}</option>
                    `
  return option_html;
}
      // 一部省略
      .done(function (data) {
        // selectタグを生成してビューにappendする
        let child_select = build_childSelect
        $("#category_field").append(child_select);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        data.forEach(function (d) {
          let option_html = build_Option(d)
          $(".child_category_id").append(option_html);
        })
      })
      .fail(function () {
        alert("通信エラーです！");
      });