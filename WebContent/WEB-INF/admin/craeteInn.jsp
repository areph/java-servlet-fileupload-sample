<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/_head.jsp"%>

<body>
	<%@ include file="/WEB-INF/_navbar.jsp"%>
	<div class="container">
		<h1>宿を登録する</h1>

		<form action="craete-inn" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label for="innName">宿名</label> <input type="text"
					class="form-control" id="innName" placeholder="あなたのお宿">
			</div>

			<div class="form-group">
				<label for="file">宿の画像アップロード</label>
				<div id="file" class="input-group">
					<div class="custom-file">
						<input type="file" id="cutomfile" class="custom-file-input" name="fileUpload" />
							<label class="custom-file-label" for="customfile" data-browse="参照">ファイル選択...</label>
					</div>
					<div class="input-group-append">
						<button type="button" class="btn btn-outline-secondary reset">取消</button>
					</div>
				</div>
			</div>

			<button type="submit" class="btn btn-primary">登録</button>
		</form>
	</div>

	<%@ include file="../_script.jsp"%>

</body>
<script>
$('.custom-file-input').on('change', handleFileSelect);
function handleFileSelect(evt) {
        $('#preview').remove();// 繰り返し実行時の処理
        $(this).parents('.input-group').after('<div id="preview"></div>');

    var files = evt.target.files;

    for (var i = 0, f; f = files[i]; i++) {

        var reader = new FileReader();

        reader.onload = (function(theFile) {
            return function(e) {
                if (theFile.type.match('image.*')) {
                    var $html = ['<div class="d-inline-block mr-1 mt-1"><img class="img-thumbnail" src="', e.target.result,'" title="', escape(theFile.name), '" style="height:100px;" /><div class="small text-muted text-center">', escape(theFile.name),'</div></div>'].join('');// 画像では画像のプレビューとファイル名の表示
                } else {
                    var $html = ['<div class="d-inline-block mr-1"><span class="small">', escape(theFile.name),'</span></div>'].join('');//画像以外はファイル名のみの表示
                }

                $('#preview').append($html);
            };
        })(f);

        reader.readAsDataURL(f);
    }
    $(this).next('.custom-file-label').html('ファイルを選択しました');
}

//ファイルの取消
$('.reset').click(function(){
    $(this).parent().prev().children('.custom-file-label').html('ファイル選択...');
    $('#preview').remove();
    $('.custom-file-input').val('');
})

</script>
</html>