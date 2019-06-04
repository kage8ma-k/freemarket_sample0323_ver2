$(document).on('turbolinks:load', function() {

// 商品出品ボタン押す
  $(function(){
    $('#edit_item_form').on('submit',function(e){
      e.preventDefault();
      var item_id = $('#default_images').data('itemid')
      var formdata = new FormData(this);

      $.ajax({
        url: "/items/new/search" + item_id,
        type: "PATCH",
        data: formdata,
        dataType: "json",
        processData: false,
        contentType: false
      })
    })
  });

  // セレクトボックス定義
  var cat_seach = $("#edit-first-category");

  function appendSelect(catNum) {
    if(catNum == 1) {
      var select_id = `m_category`
    } else if(catNum == 2) {
      var select_id = `s_category`
    }
    var html =
    `<select class="select-wrapper__select" name="item[category_id]" id="${select_id}">
        <option value>---</option>
    </select>`
    cat_seach.append(html)
  }
  // カテゴリーの条件定義
  function appendCat(catOption, catNum) {
    if (catNum == 1) {
      var appendId = $("#m_category")
    } else if (catNum == 2) {
      var appendId = $("#s_category")
    }
    appendId.append(
      $("<option>")
        .val($(catOption).attr('id'))
        .text($(catOption).attr('name'))
    )
  }

  // Lカテゴリーが選択された時のアクション（子要素出現）
  $("#l_category").on('change', function() {
    l_cat = $(this).val()
    $("#m_category, #s_category").remove()
    // ajaxでリクエストを送信
      $.ajax({
        type: "GET",
        url: "/items/new/search",
        data: {l_cat: l_cat},
        dataType: 'json'
      })
      // doneメソッドでappendする
      .done(function(m_cat) {
        var catNum = 1
        appendSelect(catNum)
        m_cat.forEach(function(m_cat) {
          appendCat(m_cat, catNum)
        })
      })
    })

// Mカテゴリーが選択された時のアクション（孫要素出現）
  $(document).on('change', "#m_category", function() {
    m_cat = $(this).val()
    $("#s_category").remove()
    $.ajax({
      type: "GET",
      url: "/items/new/search",
      data: {m_cat: m_cat},
      dataType: 'json'
    })
    .done(function(s_cat) {
      var catNum = 2
      appendSelect(catNum)
      s_cat.forEach(function(s_cat) {
        appendCat(s_cat, catNum)
      })
    })
  })
  // 孫まで出しとく

  // サイズとブランド部分の出現
  $(function() {
    $(document).ready(".select-wrapper#edit-first-category",
      function() {
      $('.form-group#edit-size').css('display', "block");
      $('.form-group#edit-brand').css('display', "block");
    })
  });

  // 配送方法の指定
  $(function() {
    $(document).ready(".form-group#edit-burden", function() {
      $('.form-group#edit-burden').next().css('display', 'block');
    });
  });
});
