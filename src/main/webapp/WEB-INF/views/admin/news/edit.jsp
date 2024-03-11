
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ include file="/shared/taglib.jsp" %>

<title>Sửa tin tức</title>


<form id="edit-form" method="post" action="/admin/news/updateNews/${news.getId()}" enctype='multipart/form-data'>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Tiêu đề</label>
		<div class="col-sm-12 col-md-10">
			<input type="text" class="form-control" name="title" value="${news.getTitle()}"
				   placeholder="Nhập tiêu đề...">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Ảnh</label>
		<div class="col-sm-12 col-md-10">
			<div class="drag-container">
				<div class="drag-area active">
					<div class="area-upload-container">
						<div class="area-icon">
							<i class="fa-regular fa-images"></i>
						</div>
						<div class="paragraph-container">
							<span>Drag & Drop</span> <span>or
															<button class="browse-btn btn">browse</button>
														</span> <span class="support">Supports: JPEG, JPG, PNG</span>
							<input
									type="file" name="image" id="file-input" hidden>

						</div>
					</div>
					<img class="selected-img" src="${ news.getImageSrc() }" />
				</div>
			</div>
			<button class="clear-file-btn show btn">Loại bỏ ảnh đã chọn</button>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Mô tả</label>
		<div class="col-sm-12 col-md-10">
                <textarea class="form-control" placeholder="Nhập mô tả..." name="description" cols="30" rows="10">${news.getDescription()}</textarea>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Nội dung</label>
		<div class="col-sm-12 col-md-10">
			<textarea class="form-editor" id="content-editor" name="content">${news.content}</textarea>
		</div>
	</div>
	<div class="form-group row">
		<input style="color: aliceblue; font-weight: bold;"
			   class="form-control btn-primary"
			   value="Thêm tin tức"
			   type="submit"
		/>
	</div>
</form>


<script src="https://cdn.tiny.cloud/1/dh2x54uau60s6fhopcds18g64hz8ybq6bojfgbve5v7z536s/tinymce/6/tinymce.min.js"
		referrerpolicy="origin"></script>
<script src="<c:url value='/assets/admin/js/helper.js' />"></script>
<script src="<c:url value='/assets/admin/js/image-review.js' />"></script>
<script src="<c:url value='/assets/admin/js/tinymce.js' />"></script>

<script>
	$(document).ready(function () {
		$("#edit-form").submit(function () {
			let content = tinymce.activeEditor.getContent();
			$("textarea#content-editor").val(decodeEntities(content));
		});
	});
</script>









