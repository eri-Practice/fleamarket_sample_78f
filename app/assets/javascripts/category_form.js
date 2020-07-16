$(function(){
// 子のselectタグを追加
  function build_childSelect() {
    let child_select =
      `<select name="item[category_id]" class="child_category_id">
        <option value="">---</option>
      </select>`
    return child_select;
  }
  function build_gcSelect() {
    let gc_select = `
              <select name="post[category_id]" class="gc_category_id">
              </select>
              `
    return gc_select;
  }
  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html =
      `<option value=${children.id}>${children.name}</option>`
    return option_html;
  }
  $("#parent-form").change(function () {
    // 選択した親の値を取得する
    let parentValue = $(this).val();
    // 初期値("---")以外を選択したらajaxを開始
    if (parentValue.length != 0) {
      $.ajax({
      url: '/items/category',
      type: 'GET',
      // postsコントローラーにparamsをparent_idで送る
      data: { parent_id: parentValue },
      dataType: 'json'
      })
      .done(function (data) {
         // selectタグを生成してビューにappendする
        let child_select = build_childSelect()
        $("#parent-form").after(child_select);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        data.forEach(function (d) {
          let option_html = build_Option(d)
          $(".child_category_id").append(option_html);
        })
      })
    }
  });
    // 子セレクトを変更したらjQueryが発火する
  $(document).on("change", ".child_category_id", function () {

    // 選択した子の値を取得する
    let childValue = $(".child_category_id").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/items/category',
        type: 'GET',
        // postsコントローラーにparamsをchildren_idで送る
        data: { children_id: childValue },
        dataType: 'json'
      })
      .done(function (gc_data) {
       
        // selectタグを生成してビューにappendする
        let gc_select = build_gcSelect()
        $(".child_category_id").after(gc_select);
        // jbuilderから取得したデータを1件ずつoptionタグにappendする
        gc_data.forEach(function (gc_d) {
          let option_html = build_Option(gc_d);
          
          $(".gc_category_id").append(option_html);
        });
      })
      .fail(function () {
        alert("通信エラーです！");
      });
    }
  })
})