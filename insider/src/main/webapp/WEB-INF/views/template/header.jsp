<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insider</title>
	<script>
		<!-- 전역변수 contextPath 설정 -->
		const contextPath = "${pageContext.request.contextPath}";
		<!-- MemberNo -->
		const memberNo = "${sessionScope.memberNo}";
	</script>
	<!-- BootStrap CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<!-- commons.css -->
	<link rel="stylesheet" type="text/css" href="/static/css/commons.css" />
	<!-- font-awesome cdn -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
	<!-- vue, axios, lodash cdn -->
	<script src="https://unpkg.com/vue@3.2.36"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- SockJS라이브러리 의존성 추가  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>

</head>
<style>
	.logo{
		font-size: 50px;
	}
     html, body{
          width: 100%;
          height: 100%;
          margin: 0;
          padding: 0;
      }
      .wrap{
      
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
      }
      body[data-darkmode=on] {
          background-color: #1e1f21;
          color: #e8e8e8 !important;
      }
      /* Darkmode Toggle */
      body[data-darkmode=on] .darkmode > .inner{
          background-color: rgba(255,255,255,0.25);
      }
      .darkmode > .inner{
          position: relative;
          display: inline-flex;
          padding: 5px;
          border-radius: 1.5em;
          background-color: rgba(0,0,0,0.1);
      }
      .darkmode label {
          cursor: pointer;
      }
      .darkmode label:first-of-type{
          padding: 5px 5px 5px 10px;
          border-radius: 50% 0 0 50%;
      }
      .darkmode label:last-of-type{
          padding: 5px 10px 5px 5px;
          border-radius: 0 50% 50% 0;
      }
      .darkmode i{
          font-size: 1.5em;
          
      }
      .darkmode input[type=radio]{
          display: none;
      }
      .darkmode input[type=radio]:checked + label > i {
          color: #fff;
          transition: all 0.35s ease-in-out;
      }
      .darkmode .darkmode-bg{
          width: 39px;
          height: 34px;
          position: absolute;
          left: 5px;
          border-radius: 50px 15px 15px 50px;
          z-index: -1;
          transition: all 0.35s ease-in-out;
          background-color: #03a9f4;
      }
      #toggle-radio-dark:checked ~ .darkmode-bg{
          border-radius: 15px 50px 50px 15px;
          top: 5px;
          left: 44px;
      }
      
 	 .modal-window { 
 		  position: absolute; 
 		  top: calc(100% + 10px); 
 		  left: 50%; 
 		  transform: translateX(-50%); 
 		  border-radius: 1.5em; 
 		  border: 1px solid #000; 
 		  width: 500px; 
 		  background-color: #fff; 
 		  z-index: 999; 
 		  padding: 10px; 
 		  overflow-y: auto; 
 		  overflow-x: hidden;  
 	  } 

 	  .modal-content { 
 	  	margin: 10px; 
 	  } 
	
 	  .modal-header { 
 		  text-align: center; 
 		  margin-bottom: 10px; 
 	  } 
	
 	.modal-body { 
 	  max-height: 300px;  
 	  overflow-x: hidden;  
 	  overflow-y: auto;  
 	} 

 	.modal-footer { 
 	  -align: center; 
 	  margin-top: 10px; 
 	} 
	
 	.notification-list { 
 	  list-style-type: none; 
 	  padding: 0; 
 	  margin: 0; 
 	} 
	
 	.notification-list li { 
 	  margin-bottom: 10px; 
 	} 
	.header-menu-option{
		font-size: 45px;
		color:inherit;
		cursor:pointer
	}
</style>

 <script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {

    const darkModeEnabled = localStorage.getItem('darkmode') === 'on';

    document.body.dataset.darkmode = darkModeEnabled ? 'on' : 'off';

    const toggleRadioDark = document.querySelector('#toggle-radio-dark');

    toggleRadioDark.checked = darkModeEnabled;

    document.querySelector('.darkmode').addEventListener('click', function(e) {
      if (e.target.classList.contains('todark')) {

        document.body.dataset.darkmode = 'on';
        localStorage.setItem('darkmode', 'on');
      } else if (e.target.classList.contains('tolight')) {

        document.body.dataset.darkmode = 'off';
        localStorage.setItem('darkmode', 'off');
      }
    });
  });
</script>


<body>
	<main>
		<header id="aside">	
			<nav class="mt-3">
				<div class="container-fluid" style="width:60%; max-width:900px; min-width:700px">
					<div class="row ps-5 pe-5" style="max-width:1200px">
						<div class="col-3">
							<a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center" style="color:inherit;">
								<img class="me-2" src="${pageContext.request.contextPath}/static/image/logo.png" width="50" height="50">
								insider
							</a>
						</div>
						<div class="col d-flex align-items-center justify-content-end">
							<div class="row">
							<!-- 관리자 -->
								<div class="col p-0 m-2">
									<a class="" href="${pageContext.request.contextPath}/admin/?adminMenu=1" style="color:inherit"><i class="fa-regular fa-id-card header-menu-option" style="font-size:43px;margin-top:2px"></i></a>
								</div>
							<!-- 검색 -->
								<div class="col p-0 m-2">
									<a class="" href="${pageContext.request.contextPath}/search" style="color:inherit"><i class="fa-regular fa-solid fa-magnifying-glass header-menu-option" style="font-size:40px;margin-top:2px"></i></a>
								</div>
								<!-- 알림 -->
								<div class="col p-0 m-2" style="position:relative;">
								  <div>
									  <a class="notice" @click="toggleModal" style="color:inherit">
									    <i class="fa-regular fa-heart header-menu-option"></i>
									    <i class="fa-solid fa-circle" v-show="hasNewNotification" style="display:none;position: absolute;font-size: 0.3em;color: #eb6864;right:15%;bottom: 17%;"></i>
									  </a>
								  </div>
								  <div class="modal-window" v-if="showModal">
								    <div class="modal-content">
								      <div class="modal-header"></div>
								      <div class="modal-body">
								        <ul class="notification-list">
								        <div v-if="notifications.length >0">
								        	<span><i class="fa-sharp fa-regular fa-bell fa-shake"></i>새로운 알림</span>
								        	<hr>
								          <li v-for="notification in notifications"   >
								          	<div>
									          	<a class="nav-link" :href="'${pageContext.request.contextPath}/member/'+ notification.memberNick">
									          	<img class="rounded-circle" width="50" height="50" :src="'${pageContext.request.contextPath}'+notification.imageURL">
									          	{{ notification.memberNick }} 님이
									          	</a>
									          	<a class="nav-link" :href="'${pageContext.request.contextPath}/board/'+ notification.boardNo">
									          	<p v-if="notification.type == 1">게시글을 좋아요 하였습니다.</p>
									          	<p v-if="notification.type == 2">게시글에 댓글을 달았습니다.</p>
									          	<p v-if="notification.type == 3">회원님의 댓글을 좋아합니다.</p>
									          	<p v-if="notification.type == 4">회원님의 댓글에 댓글을 달았습니다.</p>
									          	</a>
									          	<span v-if="notification.type == 5">팔로우하였습니다.</span>
									          	<b>· {{dateCount(notification.boardTimeAuto)}}</b>
								          	</div>
								          </li>
								          <hr>
								          </div>
								          <span><i class="fa-regular fa-eye"></i>읽은 알림</span>
								          <a @click="deleteAllNotifications" class="btn btn-secondary" style="position: fixed; top:6%; left:75%;transform: transform(-50%,-50%);">전체삭제</a>
								          <hr>
								          <li v-for="notification in storedNotifications" :key="notification.id">
											  <div :class="{ 'read': notification.status === 'read' }">
											    <a class="nav-link" :href="'${pageContext.request.contextPath}/member/'+ notification.memberNick">
											      <img class="rounded-circle" width="50" height="50" :src="'${pageContext.request.contextPath}'+notification.imageURL">
											      {{ notification.memberNick }} 님이
											    </a>
										        <a class="nav-link" :href="'${pageContext.request.contextPath}/board/'+ notification.boardNo">
									          	<span v-if="notification.type == 1">게시글을 좋아요 하였습니다.</span>
									          	<span v-if="notification.type == 2">게시글에 댓글을 달았습니다.</span>
									          	<span v-if="notification.type == 3">회원님의 댓글을 좋아합니다.</span>
									          	<span v-if="notification.type == 4">회원님의 댓글에 댓글을 달았습니다.</span>
									          	</a>
									          	<span v-if="notification.type == 5">팔로우하였습니다.</span>
											    <b>· {{dateCount(notification.boardTimeAuto)}}</b>
	<!-- 										    <a @click="deleteNotification(notification)" class="btn btn-secondary">알림삭제</a> -->
											  </div>
											</li>
								          
								        </ul>
								      </div>
								      <div class="modal-footer"></div>
								    </div>
								  </div>
								</div>
							<!-- dm -->
								<div class="col p-0 m-2">
									<a class="" href="${pageContext.request.contextPath}/dm/channel" style="color:inherit"><i class="fa-regular fa-message header-menu-option" style="font-size:40px; margin-top:3px"></i></a>
								</div>
							<!-- 게시물작성 -->
								<div class="col p-0 m-2">
									<a class="" href="${pageContext.request.contextPath}/board/insert" style="color:inherit"><i class="fa-regular fa-square-plus header-menu-option"></i></a>
								</div>
							<!-- 프로필 -->
								<div class="col p-0 m-2">
									<a class="" style="cursor:pointer; color:inherit" @click="moveToMyPage()" ><i class="fa-regular fa-circle-user header-menu-option" style="font-size:43px;margin-top:2px"></i></a>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</nav>
			<aside style="position:absolute; right:5em; top:5em" >
	        	<div class="darkmode">
	            	<div class="inner">
	                	<input type="radio" name="toggle" id="toggle-radio-light" checked><label for="toggle-radio-light" class="tolight"><i class="fas fa-sun tolight"></i></label>
	                	<input type="radio" name="toggle" id="toggle-radio-dark"><label for="toggle-radio-dark" class="todark"><i class="fas fa-moon todark"></i></label>
	                	<div class="darkmode-bg"></div>
	            	</div>
	        	</div>
				<div class="dropdown" :class="{'show':sideMenu}">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" @click="showSideMenu()">
						<i class="fa-solid fa-bars"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" v-show="sideMenu" :class="{'show' : sideMenu}">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/member/setting?page=1">환경설정</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/?adminMenu=1">관리자 메뉴</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">로그인</a>
						<c:if test="${socialUser != null}">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
						</c:if>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
					</div>
				</div>
			</aside>
		</header>
<section>	



<script>
	  Vue.createApp({
	    data() {
	      return {
	        sideMenu: false,
	        showModal: false,
	        notifications: [],
	        hasNewNotification: false,
	        intervalId: null,
	        storedNotifications: [],
	        memberNick : "${socialUser.memberNick}",
	      };
	    },
	    computed: {
	      // 계산영역
	    },
	    methods: {
	      // 메소드영역
	      showSideMenu() {
	        this.sideMenu = !this.sideMenu;
	      },
	      loadNotifications() {
	    	  axios
	    	    .get("${pageContext.request.contextPath}/rest/notice/")
	    	    .then((response) => {
	    	      const result = response.data;
	    	      console.log("result", result);
	    	      if (result.length > 0) {
	    	        // 알림이 있을 경우 처리 로직
	    	        this.notifications = result;
	    	        this.hasNewNotification = true;

	    	        if (!this.showModal) {
	    	          this.storedNotifications = JSON.parse(localStorage.getItem("storedNotifications")) || [];
	    	          this.notifications = [];
	    	          localStorage.setItem("storedNotifications", JSON.stringify(this.storedNotifications));
	    	        }
	    	      } else {
	    	        // 알림이 없을 경우 처리 로직
	    	        this.notifications = [];
	    	        this.hasNewNotification = false;
	    	        this.storedNotifications = JSON.parse(localStorage.getItem("storedNotifications")) || [];
	    	      }
	    	    })
	    	    .catch((error) => {
	    	      console.log(error);
	    	    });
	    	},

	         
	      toggleModal() {
    		if (!this.showModal) {
    	        this.loadNotifications();
    	      }
    	      this.showModal = !this.showModal;

    	      if (!this.showModal) {
    	    	this.cleanupLocalStorage();
    	        this.check();
    	      }
    	    },
	      check() {
		  //알림확인
		       axios
			       .put("${pageContext.request.contextPath}/rest/notice/check/")
			       .then((response) => {
		    	      this.notifications.forEach((notification) => {
		    	        notification.status = "read";
		    	        this.storedNotifications.unshift(notification);
		    	      });
		    	      this.notifications = [];
		    	      localStorage.setItem("storedNotifications", JSON.stringify(this.storedNotifications));
		    	    })
		    	    .catch((error) => {
		    	      console.log(error);
		    	    });
	      },
	      
	      //알림 삭제
// 	      deleteNotification(notification) {
// 	    	    const index = this.storedNotifications.findIndex((n) => n.id === notification.id);
// 	    	    if (index !== -1) {
// 	    	      this.storedNotifications.splice(index, 1);
// 	    	      localStorage.setItem("storedNotifications", JSON.stringify(this.storedNotifications));
// 	    	    }
// 	    	  },
	    
		  //알림 전체 삭제
    	  deleteAllNotifications() {
    		  this.storedNotifications = [];
    		  localStorage.removeItem("storedNotifications");
   		  },
	    	  
	    	 //게시글 날짜 계산 함수
	        dateCount(date) {
	        	const curTime = new Date();
	        	const postTime = new Date(date);
	        	const duration = Math.floor((curTime - postTime) / (1000 * 60));
	        	
	        	if(duration < 1){
	        		return "방금 전";
	        	}
	        	else if(duration < 60){
	        		return duration + "분 전";
	        	}
	        	else if(duration < 1440) {
	        		const hours = Math.floor(duration / 60);
	        		return hours + "시간 전"
	        	} 
	        	else {
	        		const days = Math.floor(duration / 1440);
	        		return days + "일 전";
	        	}
	        },
	        //이동버튼 클릭 시
	        async moveToMyPage(){
	        	const resp = await axios.get(contextPath+"/rest/member/nickname");
        		window.location.href=contextPath+'/member/'+resp.data;
	        },
	        
	        //7일 뒤 알림 자동 삭제
// 			cleanupLocalStorage() {
// 			 	const storedNotifications = JSON.parse(localStorage.getItem("storedNotifications")) || [];
			
// 			  	const expirationDate = new Date();
// 			  	expirationDate.setDate(expirationDate.getDate() - 7); // Subtract 7 days from the current date
			
// 			  	const updatedStoredNotifications = storedNotifications.filter((notification) => {
// 			    const notificationDate = new Date(notification.date);
// 			    	return notificationDate >= expirationDate;
// 			  	});
		
// 		  		localStorage.setItem("storedNotifications", JSON.stringify(updatedStoredNotifications));
// 			},


			//7초 뒤 알림 자동 삭제
	        cleanupLocalStorage() {
	        	  const storedNotifications = JSON.parse(localStorage.getItem("storedNotifications")) || [];

	        	  const expirationDate = new Date();
	        	  expirationDate.setTime(expirationDate.getTime() + 7 * 1000);

	        	  setTimeout(() => {
	        	    const updatedStoredNotifications = storedNotifications.filter((notification) => {
	        	      const notificationDate = new Date(notification.date);
	        	      return notificationDate >= expirationDate;
	        	    });

	        	    localStorage.setItem("storedNotifications", JSON.stringify(updatedStoredNotifications));
	        	  }, 7000);
	        	},

	    },
	
	    created() {
	      // 데이터 불러오는 영역
	    	this.cleanupLocalStorage();
	    },
	    watch: {
	      // 감시영역
	    },

	    mounted() {
	      this.loadNotifications(); // 컴포넌트가 마운트될 때 알림 데이터를 로드
	      this.intervalId = setInterval(this.loadNotifications, 10000); // 5초마다 알림 데이터를 갱신
	    },
	    beforeUnmount() {
	      clearInterval(this.intervalId); //메모리 누수방지
	   	}
	  }).mount("#aside");
</script>
