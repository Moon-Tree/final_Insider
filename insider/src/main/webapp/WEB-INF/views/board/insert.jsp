<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<style>
	.div-center {
		display: inline-block;
		text-align: center;
	}

	.img {
		
		width: 45px;
		height: 45px;
		
	}
	
	.img.img-circle {
		border-radius: 50%;
	}
	
.note-editor .note-editing-area .note-editable {
    width: 100% !important;
    height: 200px !important;
    resize: none !important;
}
  
  .left {
  	text-align: left;
  	vertical-align: middle;
  }
  
  .right{
  	text-align: right;
  	vertical-align: middle;
  }
  
  .input-upload{
	  padding: 10px 30px;
	  background-color:#eb6864;
	  border-radius: 4px;
	  color: white;
	  cursor: pointer;
	}
	
	.input-uploadPlus{
		padding: 10px 30px;
	  background-color:white;
	  border-radius: 4px;
	  color: #eb6864;
	  cursor: pointer;
	  
	}
	
	.form-switch{
		padding: 0em;
	}
	
	.ppp{
		position: relative;
	}
	
	.xxx{
		position: absolute;
		top: 100px;
		right: 80px;
		z-index: 999;
	}
	
	.file-preview-container {
    height: 100%;
    display: flex;
    flex-wrap: wrap;
 	}
  
	.file-preview-wrapper {
    padding: 10px;
    position: relative;
	}
        
  .file-close-button {
    position: absolute;
    line-height: 18px;
    z-index: 99;
    font-size: 18px;
    right: 5px;
    top: 10px;
    color: #fff;
    font-weight: bold;
    background-color: #666666;
    width: 20px;
    height: 20px;
    text-align: center;
    cursor: pointer;
	}
        
  .file-preview-wrapper-upload {
    margin: 10px;
    padding-top: 20px;
    background-color: white;
    width: 150px;
    border: 1px soild #eb6864;
    
	}
        
        
  .image-box {
    margin-top: 30px;
    padding-bottom: 30px;
    text-align: center;
	}
	
	.file-preview-wrapper>img {
     position: relative;
     width: 200px;
     height: 250px;
     z-index: 10;
 	}
 	
 	.nickname{
 		font-weight: bold;
 		font-size: large;
 		margin-left: 20px;
 	}
 	
 	.hidefile{
 		display:none;
 	}
 	
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0, 0, 0, 0.5);
	}
	
	.modal-content {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 100%;
	  max-width: 100%;
	} 	
	
	.file-preview-container {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  height: 100%;
	}

	.file-preview-wrapper {
	  width: 200px;
	  height: 100%;
	  overflow: hidden;
	  margin: 0 10px;
	}
	
	.preview-image,
	.preview-video {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	}
	
</style>


<script type="text/javascript">

$(function(){

	$(document).ready(function() {

		  $('#modalForm').css('display', 'block');

		  $('.modal-dialog').on('click', function(event) {
		    event.stopPropagation();
		  });

		  $('.close').on('click', function() {
		    $('#modalForm').css('display', 'none');
		  });
		});


	$(document).ready(function() {
	    $('#summernote').summernote({
	        toolbar: false,
	        callbacks: {
	            onInit: function() {
	 
	                var content = $('#summernote').val();
	
	                content = content.replace(/\n/g, '<br>');
	
	                $('#summernote').summernote('code', content);
	            },
	            onKeyup: function() {
	
	                var content = $('#summernote').summernote('code');
	                var characterCount = content.replace(/<[^>]+>/g, '').length;
	                $('.count').text(characterCount);
	            }
	        }
	    });
	});

		
	
	$(".form-submit").submit(function(e){
	
		if($(".content").val() == ""){
			alert("문구를 입력하세요.");
			e.preventDefault();
		}
		
		if($("#upload2").val() == ""){
			$("#upload2").attr("disabled", true);
		}
		else{
			$("#upload2").attr("disabled", false);
		}
		
		
		if ($(".content").val() == "" || $("#tagName").val() != "") {

		    $("#tagName").attr("disabled", false);

		    tagBoardDto.tagName = $("#tagName").val();
		  } else {
		    $("#tagName").attr("disabled", true);
		  }
		
		if($(".content").val() == "" || $("#memberTag").val() != ""){
			$("#memberTag").attr("disabled", false);
		}
		else{
			$("#memberTag").attr("disabled", true);
		}
		
	});
	
	//멀티 페이지
	let index = 0;
	move(index);
	
	$(".btn-next").click(function(){
		
		if($("#upload").val() == "" && $("#upload2").val() == ""){
				alert("사진을 선택하세요.");
				$(".btn-next").attr("disabled", false);
		}
		else{
			index++;
			move(index);
		}	
		
	});
	
	$(".btn-prev").click(function(){
		index--;
		move(index);
	});
	
	function move(index){
		$(".page").hide();
		$(".page").eq(index).show();
	}
	
});


</script>

<!------------------------------------------------------------------------------------->

<div id="modalForm" class="modal">


<div id="app" class="vue-container">

<form action="insert" method="post" enctype="multipart/form-data" class="form-submit">

	<div class="container-fluid" style="width: 1200px">
	
		<div class="row mt-3"></div>
		
		<!-- 1. 사진 첨부 영역 -->
		<div class="page">
		<div class="row w-70 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		  <div class="card border-primary mb-3" style="height: 600px;">
		    <div class="card-header">
		      <div class="row">
		        <div class="col-md-2">
		          <button type="button" class="btn btn-secondary cancel" style="float:left;" @click="cancelPost">취소</button>
		        </div>
		        <div class="col-md-8">
		          <h4 class="text-primary text-center" style="margin-top: 1%;">새 게시물 만들기</h4>
		        </div>
		        <div class="col-md-2">
		          <button type="button" class="btn btn-secondary btn-next" style="float:right;">다음</button>
		        </div>
		      </div>
		    </div>
		      
		      
		      <div>
		      	
		      	<!-- 1-1. 사진 첨부전, 업로드 버튼 영역 -->
			      <div :class="{'hidefile':files.length > 0}">
				      <div class="card-body text-center" style="margin-top: 12%; height: 400px;">
				        <h1 class="card-title" ><i class="fa-regular fa-images"></i></h1>
				        <p class="card-text fs-5">사진을 선택하세요.</p>
				        <label for="upload" class="input-upload">업로드</label>
				        <input type="file" name="boardAttachment" accept="image/*, video/*" id="upload" ref="files" @change="imageUpload" style="display:none;" multiple>
				        <p style="margin-top: 20px;">* 이미지는 최대 5개까지 선택 가능합니다.</p>
				      </div>
			      </div>
			      
			      <!-- 1-2. 사진 첨부했을 때, 미리보기 영역 -->
					<div :class="{'hidefile': files.length==0}">
					  <div class="file-preview-container">
					    <div v-for="(file, index) in files" :key="index" class="file-preview-wrapper">
					      <div class="file-close-button" @click="fileDeleteButton" :name="file.number">
					        X
					      </div>
					      <template v-if="file.file.type.startsWith('image/')">
					        <img :src="file.preview" class="preview-image" />
					      </template>
					      <template v-else-if="file.file.type.startsWith('video/')">
					        <video :src="file.preview" class="preview-video" controls></video>
					      </template>
					    </div>
					    <div class="file-preview-wrapper-upload">
					      <div class="image-box" v-show="files.length < 5">
					        <label for="upload2" class="input-uploadPlus">
					          <i class="fa-solid fa-plus fa-3x"></i>
					        </label>
					        <input type="file" name="boardAttachment" accept="image/*, video/*" id="upload2" ref="files2" @change="imageAddUpload" style="display:none;" multiple/>
					      </div>
					    </div>
					  </div>
					</div>

		      </div>
		      
		    </div>
		
		  </div>
		</div>
		</div>
		
		
		<!-- 2. 게시물 등록 영역 -->
		<div class="page">
		<div v-show="files.length > 0" class="row w-70 mt-5" style="float: none; margin: 0 auto;">
		  <div class="col">
		
		    <div class="card border-primary mb-3" style="height: 600px;">
		      <div class="card-header">
		        <div class="row">
		          <div class="col-md-2">
		            <button type="button" class="btn btn-secondary btn-prev" style="float:left;">이전</button>
		          </div>
		          <div class="col-md-8">
		            <h4 class="text-primary text-center" style="margin-top: 1%;">새 게시물 만들기</h4>
		          </div>
		          <div class="col-md-2">
		            <button type="submit" class="btn btn-primary" style="float:right;">공유하기</button>
		          </div>
		        </div>
		      </div>
		      
		      <div class="card-body text-center">
		      
		      	<div class="row">
		      		<div class="col-md-7">
		      			
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-interval="false">
					  <div class="carousel-indicators">
					    <button v-for="(file, index) in files" :key="index" type="button" data-bs-target="#carouselExampleIndicators" :data-bs-slide-to="index" :class="{'active':index==0}" :aria-current="index==0" :aria-label="'Slide'+(index+1)"></button>
					  </div>
					  
					  <div class="carousel-inner">
					    <div v-for="(file, index) in files" :key="index" class="carousel-item" :class="{'active':index==0}">
					      <template v-if="file.file.type.startsWith('image/')">
					        <img :src="file.preview" class="d-block w-100" style="max-height: 480px; object-fit: contain;" />
					      </template>
					      <template v-else-if="file.file.type.startsWith('video/')">
					        <video class="d-block w-100" style="max-height: 480px;" controls>
					          <source :src="file.preview" type="video/mp4">
					        </video>
					      </template>
					    </div>
					  </div>
					  
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>

		      			
		      		</div>
		      		
		      		<div class="col-md-5">
					    	<div class="row">
					    		<div class="col-md-10 left bottom">
					    			<span class="nickname">${memberNick}</span>
					    		</div>
					    	</div>
					    	
					    	<div class="row mb-2"></div>
					    	
					    <div class="row">
						    <div id="summernoteContainer">
						        <textarea id="summernote" class="form-control content" rows="6" name="boardContent" placeholder="문구를 입력하세요" required ></textarea>
						    </div>
						    <div class="right">
						        <span class="length">
						            <span class="count">0</span>
						            /
						            <span class="total">1000</span>
						        </span>
						    </div>
						</div>

					    	
					    	<div class="row mt-3">
					    		<input type="text" name="tagName" class="form-control" placeholder="#해시태그" id="tagName" autocomplete="off" value="${tag}">
					    	</div>
					    	
					    	<div class="row mt-3">
					    		<input type="text" name="memberNick" class="form-control" placeholder="@사람태그" id="memberTag" autocomplete="off">
					    	</div>
					    	
					    	
					    	<div class="row mt-3 form-check form-switch" style="display: flex;">
					    		
										<div class="col-md-9 left" style="margin-left: 0px;">
											<label class="fs-5" for="replyCheck">댓글 기능 해제</label>
										</div>
										<div class="col-md-3">
											<input type="checkbox" name="boardReplyValid" value="1" class="form-check-input fs-5" style="margin-left: 0;" id="replyCheck">
										</div>
									
					    	</div>
					    	
					    	<div class="row mt-2 form-check form-switch" style="display: flex;">
					    		
										<div class="col-md-9 left" style="margin-left: 0px;">
											<label class="fs-5" for="replyCheck">좋아요 수 숨김</label>
										</div>
										<div class="col-md-3">
											<input type="checkbox" name="boardLikeValid" value="1" class="form-check-input fs-5" style="margin-left: 0;" id="replyCheck">
										</div>
									
					    	</div>
					    	
					    	<div class="row mt-1">
									<p class="left" style="font-size: small;">게시물 상단의 메뉴에서 이 설정을 변경할 수 있습니다.</p>
					    	</div>
					    	
					    	</div>
			    	
			   			</div>
		      	</div>
		        
		      </div>
		      
		    </div>
		
		  </div>
		 </div>
		</div>
		
		<div class="row mb-5"></div>
	

</form>

</div>

</div>






<!------------------------------------------------------------------------------------->


<script src="https://unpkg.com/vue@3.2.36"></script>
<script>
  //div[id=app]을 제어할 수 있는 Vue instance를 생성
  const app = Vue.createApp({
    //data 영역 : 화면을 구현하는데 필요한 데이터를 작성해둔다.
    el: ".vue-container",
    data(){
      return {
    	  files : [],
    	  filesPreview: [],
    	  uploadImageIndex: 0,
      }
    },

    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
     methods: {
    	 
    	 cancelPost(event) {
    	      event.stopPropagation();
    	      const text = confirm("게시물을 삭제하시겠어요?\n지금 나가면 수정 내용이 저장되지 않습니다.");

    	      if (text) {
    	    	 window.history.back();
    	      }
    	    },
    	 
    	 videoUpload() {
    		  for (let i = 0; i < this.$refs.files.files.length; i++) {
    		    const file = this.$refs.files.files[i];
    		    const preview = URL.createObjectURL(file);
    		    const number = this.files.length + i;

    		    this.files = [
    		      ...this.files,
    		      {
    		        file,
    		        preview,
    		        number
    		      }
    		    ];
    		  }
    		  this.uploadImageIndex = this.files.length;
    		},

    	 
    	 imageUpload() {
    		  for (let i = 0; i < this.$refs.files.files.length; i++) {
    		    const file = this.$refs.files.files[i];
    		    const preview = URL.createObjectURL(file);
    		    const number = this.files.length + i;

    		    this.files = [
    		      ...this.files,
    		      {
    		        file,
    		        preview,
    		        number
    		      }
    		    ];
    		  }
    		  this.uploadImageIndex = this.files.length;
    		},


     	
     	imageAddUpload(){
     		
     		let num = -1;
     		for(let i = 0; i < this.$refs.files2.files.length; i++){
     			this.files = [
     				...this.files,
     				{
     					file: this.$refs.files2.files[i],
     					preview: URL.createObjectURL(this.$refs.files2.files[i]),
     					number: i + this.uploadImageIndex
     				}
     			];
     			num = i;
     		}
     		this.uploadImageIndex = this.uploadImageIndex + num + 1;
      },
      
    	fileDeleteButton(e){
    		const name = e.target.getAttribute('name');
    		this.files = this.files.filter(data => data.number != Number(name));
    	},
    },
  });
  app.mount("#app");
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>