$(function () {
  $('#search-clear').click(function (e) {

    $('.detail_search_sort').find('select').val("");
    $('.detail_search__group--label').find('input').val("");
    $('.detail_search__group--forms').find('input').val("");
    $('#search_submit').val("完了");
    e.preventDefault();
    return false;
  });
});
