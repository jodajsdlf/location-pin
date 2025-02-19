<%@ page pageEncoding="utf-8"%>
<style>
.page-sidebar {
   min-width: 100%; /* 최소 가로 폭 */
   margin: 0 auto; /* 중앙 정렬 */
}

.nav-menu {
   display: flex;
   justify-content: center; /* 수평 정렬을 중앙으로 설정 */
   align-items: center; /* 수직 정렬을 중앙으로 설정 */
}

.nav-menu li {
   padding: 0 0px; /* li 요소의 위아래 패딩을 줄입니다. 좌우 패딩을 조절하고 싶다면 값을 변경하세요. */
}
</style>
</head>
<body>
   <aside class="page-sidebar" style="argin: 0 auto;">
      <!-- BEGIN PRIMARY NAVIGATION -->
      <nav id="js-primary-nav" class="primary-nav" role="navigation">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <!-- BEGIN PRIMARY NAVIGATION -->
         <ul id="js-nav-menu" class="nav-menu"> 
            <li>
               <a href="location.do" title="Car_Data_List" style="padding: 20px 20px;"> 
                  <span class="nav-link-text">오송 가게 목록</span>
               </a>
            </li>    
            <li>
               <a href="location.do"> 
                  <img src="ci.png" width="50">
               </a>
            </li>     
   			<li>
               <a href="locationMap.do" title="Car_Data_In" style="padding: 20px 20px;"> 
                  <span class="nav-link-text">현집</span>
               </a>
            </li>    
            <li>
               <a href="locationMapKke.do" title="Car_Data_In" style="padding: 20px 20px;"> 
                  <span class="nav-link-text">갱집</span>
               </a>
            </li>  
            <!-- <li>   
               <a href="location.do" title="API" style="padding: 20px 20px;"> 
                  <span class="nav-link-text">광주 가게 List</span>
               </a>
            </li>
            <li>   
               <a href="location.do" title="API" style="padding: 20px 20px;"> 
                  <span class="nav-link-text">광주 지도</span>
               </a>
            </li> -->
         </ul>

      </nav>
      <!-- END PRIMARY NAVIGATION -->
   </aside>
</body>