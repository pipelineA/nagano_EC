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
//= require_tree .
//= require jquery
//= require bootstrap-sprockets


$(function(){
  // ".edit-button"をクリックした時
	$('.edit-button').on('click',function(){

    // クリックされた".edit-button"は$(this)で取得できる。
    // $(this).parent()で、クリックされた".edit-button"の親要素の<td>が取得できる。
    // $(this).parent().parent()で、クリックされた".edit-button"の親要素の<td>のさらに親要素の<tr>が取得できる。
    // 取得した<tr>を$parentという変数に代入する。
		let $parent = $(this).parent().parent();

    // $parent.find('クラス名')で、$parentで指定した<tr>の中にある'クラス名'だけを取得することができる。
    // （これを指定しない場合は、クリックした<tr>以外の列の'クラス名'にまで、影響が及んでしまう）
    
    // それぞれの'クラス名'のボタンなどに、'none-active'クラスを追加したり削除したりすることで、表示・非表示を切り替えることができる。
    // （'none-active'クラスには、cssで{display: none;}を設定している）
		$parent.find('.edit-button').addClass('none-active');
		$parent.find('.submit-button').removeClass('none-active');
		$parent.find('.genre-text').addClass('none-active');
		$parent.find('.genre-form').removeClass('none-active');
		return false;
	});
});