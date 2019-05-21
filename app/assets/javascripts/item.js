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

//   // 送料が自己負担の時の処理（配達の方法出現）
//   function selfHTML(delivery_method) {
//     var html =
//     `<option value="">---</option>
//     <option value="nodecided">未定</option>
//     <option value="merukaribin">メルカリ便</option>
//     <option value="yuumail">ゆうメール</option>
//     <option value="letter">レターパック</option>
//     <option value="ordinary">普通郵便(定形、定形外)</option>
//     <option value="kuroneko">クロネコ</option>
//     <option value="yuupack">ゆうパック</option>
//     <option value="clickpost">クリックポスト</option>
//     <option value="yuupaket">ゆうパケット</option>`
//     $('#item_transportation').append(html);
//   }

//   // 送料が着払いの時の処理（配達の方法出現）
//   function otherHTML(delivery_burden) {
//     var html =
//     `<option value="">---</option>
//     <option value="nodecided">未定</option>
//     <option value="kuroneko">クロネコ</option>
//     <option value="yuupack">ゆうパック</option>
//     <option value="yuumail">ゆうメール</option>`
//     $('#item_transportation').append(html);
//   }

//   // カテゴリー4層目を表示(サイズ)
//   $('#new-third-category').change(function(){
//     var grand_child_id = $('#new-third-category option:selected').val();
//     console.log(grand_child_id);
//     $('#size').css('display','none')
//     $('#grand_category_id').remove();
//     $.ajax({
//       url: '/items/new',
//       type: 'get',
//       data: { grand_child_id: grand_child_id },
//       dataType: 'json'
//     })
//     .always(function(categories){
//       console.log(categories)
//       if(categories.length !== 0) {
//         $('#new-size-category').append($('<select id="grand_category_id" class="select__default" name="item[category_id]">'));
//         $('#grand_category_id').empty().append(`<option value>---</option>`);
//         categories.forEach(function(category){
//           addSelectGreatGrandChildren(category)
//           $('#size').css('display','block')
//         });
//       }
//       else {
//         $('#size').css('display','none');
//         changeAttr(grand_child_id)
//       }
//     });
//   });

//    // 配送方法の指定
//   $('#delivery_burden').change(function(){
//     var delivery_burden = $('#delivery_burden option:selected').val();
//     $('#delivery_method').remove();
//     console.log(delivery_burden);
//     if(delivery_burden == 'self_burden') {
//       $('#new-delivery_method').append($('<select id="delivery_method" class="select__default" name="item[delivery_method]">'));
//       $('#delivery_method').empty();
//       selfHTML(delivery_burden)
//       $('#delivery_method').css('display','block');
//     }
//     else if(delivery_burden == 'other'){
//       $('#new-delivery_method').append($('<select id="delivery_method" class="select__default" name="item[delivery_method]">'));
//       $('#delivery_method').empty();
//       otherHTML(delivery_burden)
//       $('#delivery_method').css('display','block');
//     }
//     else {
//       $('#delivery_method').css('display','none');
//     }
//   })

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
