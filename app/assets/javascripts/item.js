$(document).on('turbolinks:load', function() {

  // セレクトボックス定義
  var cat_seach = $("#new-first-category");

  function appendSelect(catNum) {
    if(catNum == 1) {
      var select_id = 'm_category'
      $('.form-group#size').css('display', "none");
      $('.form-group#brand').css('display', "none");
    } else if(catNum == 2) {
      var select_id = 's_category'
      $('.form-group#size').css('display', "none");
      $('.form-group#brand').css('display', "none");
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
})
// サイズとブランド部分の出現
$(function() {
  $(document).on('change', ".select-wrapper#new-first-category",
    function() {
    $('.form-group#size').css('display', "block");
    $('.form-group#brand').css('display', "block");
  })
});

// 配送方法の指定
$(function() {
  $(document).on('change', ".form-group#burden", function() {
    $('.form-group#burden').next().css('display', 'block');
  });
});
