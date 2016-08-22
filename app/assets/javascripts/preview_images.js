$(function () {
    $('.js-image-uploader').each(function () {
        // inputタグの取得
        var preview_image = $(this).find('input[type=file]');
        var preview_field = $(this);
        preview_image.change(function () {
            var file = this.files[0];
            // fileの形式のチェック
            if(!file.type.match(/image/)) {
                alert('画像ファイルを選んでください');
                return;
            }
            var filereader = new FileReader();
            // ファイルの読み込みに失敗した時
            filereader.onerror = function () {
                alert('ファイルの読み込みに失敗しました')
            };
            // ファイルの読み取りに成功した時
            filereader.onload = function () {
               preview_image.css({
                   'background-image': 'url(' + filereader.result + ')'
               });
            };
            //　ファイルの読み取りの実行
            filereader.readAsDataURL(file);
        });
    });
});