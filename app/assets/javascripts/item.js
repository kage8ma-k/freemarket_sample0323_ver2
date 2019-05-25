$(document).on('turbolinks:load', function() {

  // selectを追加するHTML(親要素)
  var cat_seach = $("#new-first-category");

  function appendSelect(catNum) {
    if(catNum == 1) {
      var select_id = `m_category`
    } else if(catNum == 2) {
      var select_id = `s_category`
// このあと親を取ってきたら子（m）とだす。違ったら孫をだす（s）。違ったらブランドとサイズカテゴリーをだす。
    }
    var html =
    `<select class="select-default" name="item[category_id]" id="${select_id}">
        <option value>---</option>
    </select>`
    cat_seach.append(html)
  }


  // optionを追加するHTML
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
        url: "/items/search",
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
      url: "/items/search",
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
  $(document).on('change', ".form-group__category", function() {
    $('.form-group__category').nextAll().css('display', 'block');
  });
});

// 配送方法の指定
$(function() {
  $(document).on('change', ".form-group__fee", function() {
    $('.form-group__fee').next().css('display', 'block');
  });
});

//   // submitボタンを押した時の処理
//   $('#new-item-btn').on('submit', function(e){
//     e.preventDefault();
//     e.stopPropagation();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     console.log(formData);
//     console.log(url);
//     $.ajax({
//       url: url,
//       type: 'POST',
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })

//     .always(function(data){
//       $("#new-item-btn").prop("disabled", false);
//     })
//   });
