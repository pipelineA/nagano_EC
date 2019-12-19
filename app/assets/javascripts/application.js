// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require_tree .
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function(){
  // オプションを指定してSkipprの実行
  $("#theTarget").skippr({
    // スライドショーの変化（"fade" or "slide"）
    transition : 'fade',
    // 変化にかかる時間（ミリ秒）
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形（"block" or "bubble"）
    navType : 'bubble',
    // 子要素の種類（"div" or "img"）
    childrenElementType : 'div',
    // ナビゲーション矢印の表示（trueで表示）
    arrows : false,
    // スライドショーの自動再生（falseで自動再生なし）
    autoPlay : true,
    // 自動再生時のスライド切替間隔（ミリ秒）
    autoPlayDuration : 2500,
    // キーボードの矢印キーによるスライド送りの設定（trueで有効）
    keyboardOnAlways : true,
    // 1枚目のスライド表示時に戻る矢印を表示するかどうか（falseで非表示）
    hidePrevious : false
  });
});

$(document).on('turbolinks:load', function(){
    // ".edit-button"をクリックした時
    $('.edit-button').on('click',function(){

    // クリックされた".edit-button"は$(this)で取得できる。
    // $(this).parent()で、クリックされた".edit-button"の親要素の<td>が取得できる。
    // $(this).parent().parent()で、クリックされた".edit-button"の親要素の<td>のさらに親要素の<tr>が取得できる。
    // 取得した<tr>を$parentという変数に代入する。
    	var parent = $(this).parent().parent();

    // $parent.find('クラス名')で、$parentで指定した<tr>の中にある'クラス名'だけを取得することができる。
    // （これを指定しない場合は、クリックした<tr>以外の列の'クラス名'にまで、影響が及んでしまう）

    // それぞれの'クラス名'のボタンなどに、'none-active'クラスを追加したり削除したりすることで、表示・非表示を切り替えることができる。
    // （'none-active'クラスには、cssで{display: none;}を設定している）
    	parent.find('.edit-button').addClass('none-active');
    	parent.find('.submit-button').removeClass('none-active');
    	parent.find('.genre-text').addClass('none-active');
    	parent.find('.genre-form').removeClass('none-active').focus();
    	return false;
    });

    // 注文情報入力画面でのフォームの制御
    $('#order_address_type_address1').on('click', function() {
      $('.new-address').prop("disabled", true);
      $('#address-list').prop("disabled", true);
      $('.address1-li').removeClass('hidden-area');
      $('.address2-li, .address3-li').addClass('hidden-area');
    });
    $('#order_address_type_address2').on('click', function() {
      $('.new-address').prop("disabled", true);
      $('#address-list').prop("disabled", false);
      $('.address2-li').removeClass('hidden-area');
      $('.address1-li, .address3-li').addClass('hidden-area');
    });
    $('#order_address_type_address3').on('click', function() {
      $('.new-address').prop("disabled", false);
      $('.new-address-posatal-code').focus();
      $('#address-list').prop("disabled", true);
      $('.address3-li').removeClass('hidden-area');
      $('.address1-li, .address2-li').addClass('hidden-area');
    });

    if ($('#order_address_type_address1').prop("checked")) {
      $('.address1-li').removeClass('hidden-area');
    }
    if ($('#order_address_type_address2').prop("checked")) {
      $('#address-list').prop("disabled", false);
      $('.address2-li').removeClass('hidden-area');
    }
    if ($('#order_address_type_address3').prop("checked")) {
      $('.new-address').prop("disabled", false);
      $('.new-address-posatal-code').focus();
      $('.address3-li').removeClass('hidden-area');
    }

    $('.credit-radio').on('click', function() {
      $('.bank').addClass('hidden-area');
      $('.credit').removeClass('hidden-area');
    });
    $('.bank-radio').on('click', function() {
      $('.credit').addClass('hidden-area');
      $('.bank').removeClass('hidden-area');
    });

    if ($('.credit-radio').prop("checked")) {
      $('.credit').removeClass('hidden-area');
    }
    if ($('.bank-radio').prop("checked")) {
      $('.bank').removeClass('hidden-area');
    }

});

// 商品新規登録時に、画像を選択した段階でプレビューが表示されるようにする
function previewFile() {
  var preview = document.getElementById('item_image_preview');//どこでプレビューするか指定。'img[name="preview"]'などにすればimg複数あっても指定できます。
  var file    = document.querySelector('input[type=file]').files[0];//'input[type=file]'で投稿されたファイル要素の0番目を参照します。input[type=file]にmutipleがなくてもこのコードになります。
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
    preview.src = reader.result;//めちゃめちゃ長い文字列が引き渡されます。ユーザーのファイルパスに紐付かない画像情報だと思います。
  }, false);

  if (file) {
    reader.readAsDataURL(file);//ここでreaderのメソッドに引数としてfileを入れます。ここで、readerのaddEventListenerが発火します。
  }
}