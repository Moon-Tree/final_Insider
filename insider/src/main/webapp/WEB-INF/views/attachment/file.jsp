<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
    function previewFile() {
        var preview = document.getElementById('preview');
        var file = document.getElementById('attach').files[0];
        var reader = new FileReader();

        if (file.type.match('image.*')) {
            reader.onloadend = function() {
                preview.innerHTML = '<img src="' + reader.result + '" style="max-width: 500px;">';
            }
        } else if (file.type.match('video.*')) {
            reader.onloadend = function() {
                preview.innerHTML = '<video src="' + reader.result + '" controls style="max-width: 500px;"></video>';
            }
        } else {
            preview.innerHTML = '';
        }

        if (file) {
            reader.readAsDataURL(file);
        }
    }
</script>


<div class="container">
    <div class="row">
        <article class="col">
            <div class="row">
                <div class="col">
                    <h1>파일 업로드</h1>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <!-- name -->
                    <form action="upload" method="post" enctype="multipart/form-data">
                        <input type="file" name="attach" id="attach" accept="image/*, video/*" onchange="previewFile()">
                        <br><br>
                        <div id="preview"></div>
                        <br><br>
                        <button>업로드</button>
                        <br><br>
                        <a href="/">취소</a>
                    </form>
                </div>
            </div>
        </article>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>