const { data } = require("jquery");

(function ($) {
  $(function () {
    // FIXME: 関数名は適当。後で共通的なハンドリング用のクラスなどを作ること。(ただし、Vue.jsへの置き換えを行ってから)
    var commonJsonAjax = function (url, method, dataMap, successFunc, errorFunc) {
      // TODO: スピナー表示は真ん中に持ってくる必要があるし、なんならモーダル化して他の項目を触れなくする必要がある。
      var $loadingImage = $('#loading-image');
      $.ajax(
        url,
        {
          type: method,
          data: dataMap,
          dataType: 'json',
          cache: false,
          beforeSend: function (jqXHR, options) {
            $loadingImage.removeClass('d-none');
            // TODO: 暫定対応。本来は、rails/ujsで常に埋め込まれているべき。
            var token;
            console.log(options)
            if (!options.crossDomain) {
              token = $('meta[name="csrf-token"]').attr('content');
              if (token) {
                return jqXHR.setRequestHeader('X-CSRF-Token', token);
              }
            }
          }
        }).done(function (data) {
          successFunc(data);
        }).fail(function (jqXHR, textStatus, errorThrown) {
          // FIXME: ここ共通的なエラー処理を実装。
          errorFunc();
        }).always(function (jqXHR, textStatus) {
          $loadingImage.addClass('d-none');
        });
    };
    // TODO: 後で適切な引数名に変更すること。更新とそうでないときの処理を分けること。
    var toggleRow = function ($icon, data) {
      // テキストフィールドとラベル表示を切り替える FIXME: あとでいいコメント考えてくだしあ
      // this = i → row取得→配下tdの特定クラスを切りかえる
      var row = $icon.parent().parent();
      // edit→saveアイコンに切り替えるとき、行配下のセルを編集可能にする。
      row.children('.mission-count-area').each(function (index, td) {
        var $td = $(td);
        // TODO: ここにサーバから取得した最新の情報を反映する処理の追加が必要になる。
        // TODO: 列が「どのカラムに対応するか」どこかで保持している必要がある。data-"カラム名"のようにするか？
        // data
        $td.find('.mission-count-display-cell').toggleClass('d-none');
        $td.find('.mission-count-editor').toggleClass('d-none');
      });
    }
    $('.edit-row-icon').on('click', function () {
      // 「編集」列のアイコンをクリックしたときの処理
      var $icon = $(this);
      var dataFaI2Svg = $icon.find('[data-fa-i2svg]');
      dataFaI2Svg.toggleClass('fa-edit')
        .toggleClass('fa-save');
      if (dataFaI2Svg.hasClass('fa-edit')) {
        // TODO: ここに保存時の動作追加
        var url = $icon.parent().find(".row_save_link").attr('href');

        let sendRowData = new Map();
        var row = $icon.parent().parent();
        row.children('.mission-count-area').each(function (index, td) {
          var $td = $(td);
          $td.find('.mission-count-editor').each(function (index, editor) {
            sendRowData.set(editor.dataset.colname, editor.value);
            console.log(editor.dataset.colname + ":" + editor.value);
          });
        });
        console.log("size:" + sendRowData.size);
        commonJsonAjax(url, 'post', JSON.stringify(sendRowData), function (data) {
          // TODO: ここにサーバから取得した最新の情報を反映する処理の追加が必要になる。
          toggleRow($icon, data);
        }, function () {
          // TODO: 実装
        });
      } else {
        // TODO: ここに編集時の動作追加
        var url = $icon.parent().find(".row_get_link").attr('href');
        commonJsonAjax(url, 'get', {}, function (data) {
          toggleRow($icon, data);
        }, function () {
          // TODO: 実装
        });
      }
    });
  });
})(jQuery);