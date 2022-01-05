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

    var toggleRow = function ($icon, data, requireUpdateDisplay) {
      // テキストフィールドとラベル表示を切り替える FIXME: あとでいいコメント考えてくだしあ
      // this = i → row取得→配下tdの特定クラスを切りかえる
      var row = $icon.parent().parent();
      // edit→saveアイコンに切り替えるとき、行配下のセルを編集可能にする。
      row.children('.mission-count-area').each(function (index, td) {
        var $td = $(td);
        if (requireUpdateDisplay) {
          var $editor = $td.find('.mission-count-editor');
          console.log(data[$editor.data('colname')]);
          var value = data[$editor.data('colname')];
          $editor.val(value);
          $td.find('.mission-count-display-cell').text(value);
        }

        $td.find('.mission-count-display-cell').toggleClass('d-none');
        $td.find('.mission-count-editor').toggleClass('d-none');
      });
    }
    $('.edit-row-icon').on('click', function () {
      // 「編集」列のアイコンをクリックしたときの処理(保存処理)
      var $icon = $(this);
      var dataFaI2Svg = $icon.find('[data-fa-i2svg]');

      if (dataFaI2Svg.hasClass('fa-save')) {
        if (!confirm('更新しますか？')) return;
        // アイコンを切り替える。
        dataFaI2Svg.toggleClass('fa-edit');
        var url = $icon.parent().find(".row_save_link").attr('href');
        var sendRowData = {};
        var row = $icon.parent().parent();
        row.children('.mission-count-area').each(function (index, td) {
          var $td = $(td);
          $td.find('.mission-count-editor').each(function (index, editor) {
            sendRowData[editor.dataset.colname] = editor.value;
          });
        });
        commonJsonAjax(url, 'post', sendRowData, function (data) {
          toggleRow($icon, data, true);
        }, function () {
          // TODO: 実装
        });
      } else {
        // アイコンを切り替える。
        dataFaI2Svg.toggleClass('fa-save');
        // TODO: ここに編集時の動作追加
        var url = $icon.parent().find(".row_get_link").attr('href');
        commonJsonAjax(url, 'get', {}, function (data) {
          toggleRow($icon, data, false);
        }, function () {
          // TODO: 実装
        });
      }
    });
  });
})(jQuery);