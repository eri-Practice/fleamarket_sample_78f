$(function(){
  $("#parent-form").on("change",function(){
    // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var parentValue = document.getElementById("parent-form").value;
    //  ("parent-form")は親ボックスのid属性
    $.ajax({
      url: '/items/search',
      type: "GET",
      data: {
        parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
      },
      dataType: 'json'
        //json形式を指定
    })
  })
});

// // 親セレクトを変更したらjQueryが発火する
// $("#category_form").change(function () {
//   // 選択した親の値を取得する
//   let parentValue = $("#category_form").val();
//   // 初期値("---")以外を選択したらajaxを開始
//   if (parentValue.length != 0) {
//     $.ajax({
//       url: '/items/search',
//       type: 'GET',
//       // postsコントローラーにparamsをparent_idで送る
//       data: { parent_id: parentValue },
//       dataType: 'json'
//     })
//       .done(function (data) {
//       })
//       .fail(function () {
//       });
//   }
// });