<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"   crossorigin="anonymous"></script>
<link href="/resources/css/header.css" rel="stylesheet">
<link href="/resources/css/noticeqa.css" rel="stylesheet">
</head>
<style>
.noticeqa {
   backgroudn: #FDF5E6;
}

.col {
   background-color: #8282FF;
}
.hidden{
   display: none;
}

</style>
<body>
   <jsp:include page="../common/header.jsp" />
   <div class="jumbotron">
      <h1 class="text-center">QNA게시판</h1>
   </div>

   <form action="/qa/read" method="post">
      <table width="100%" class="table02">
         <colgroup>
            <col width="20%">
            <col width="*">
         </colgroup>
         <tbody id="tbody">
            <tr>
               <th>제목</th>
               <td><input readonly class="form-control" id="qtitle" value="${nQdto.qtitle}"></td>
               <th>조회수</th>
               <td><input readonly class="form-control" id="qreadcnt" value="${nQdto.qreadcnt}"></td>
            </tr>
            <tr>
               <th>작성자</th>
               <td><input readonly class="form-control form-control-lg" id="mid" value="${nQdto.mid}"></td>
               <th>작성일</th>
               <td>
                  <input readonly class="form-control form-control-lg" id="qupdateday" value="${nQdto.qupdateday}">
               </td>
            </tr>
            <tr>
            
               <th>내용</th>
               <td colspan='8'>
                  <textarea readonly class="form-control"   id="qcontent" rows="5" style="height:300px; resize: none;">${nQdto.qcontent}</textarea>
               </td>
            </tr>

         </tbody>
      </table>
   </form>
   <br>
   <br>
   <br>

   <div class="text-right">
      <c:if test="${login.mid == nQdto.mid || (not empty alogin)}">
         <a class="btn btn-warning" href="/qa/update/${nQdto.qno}">수정</a>

         <a class="btn btn-danger delete" href="/qa/delete/${nQdto.qno}">삭제</a>
      </c:if>
      <a class="btn btn-info" href="/qa/list">목록</a>
      <a class="btn btn-success reply">댓글</a>
   </div>

   <br>
   <br>
   <div class="collapse">
      <div class="card card-body">
         <div class="form-group row">
            <label for="replyer" class="col-sm-2 col-form-label col-form-label-lg">댓글 작성자</label>
            <div class="col-sm-10">
               <input class="form-control form-control-lg" id="replyer" placeholder="댓글 작성자 입력" value="${empty login.mid ?alogin.aid:login.mid}" readonly="readonly">
            </div>
         </div>

         <div class="form-group row">
            <label for="replyText" class="col-sm-2 col-form-label col-form-label-lg">댓글</label>
            <div class="col-sm-10">
               <textarea class="form-control form-control-lg" id="replyText" placeholder="댓글 입력" rows="3"></textarea>
            </div>
         </div>

         <div class="form-group row">
            <input id="reply_btn_submit" class="form-control btn btn-primary col-sm-2 offset-sm-5" type="submit" value="댓글 작성 완료">
         </div>


         <form action=""></form>

         </div>
         </div>

<div id="replies"></div>

         <!-- Modal -->
         <div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="staticBackdropLabel">
                        rno: <span id="modal_rno">5</span>
                     </h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <div class="form-group">
                        <input id="item_input_update_replyer" class="form-control" readonly="readonly">
                     </div>
                     <div class="form-group">
                        <textarea id="item_input_update_replyText" class="form-control" rows="3"></textarea>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                     <button type="button" class="btn btn-primary" data-dismiss="modal" id="item_btn_update_submit">댓글 수정 완료</button>
                  </div>
               </div>
            </div>
         </div>
         <input type="hidden" id = "mid" value = "${login.mid}">
         <input type="hidden" id = "aid" value = "${alogin.aid}">
         
         <script type="text/javascript" src="/resources/js/reply.js"></script>

         <script type="text/javascript">
            let qno = ${nQdto.qno};
            let mid = $("#mid").val();
            let aid = $("#aid").val();
            /* tl.js에 있는 함수
            업로드한 파일들의 파일명을 DB에서 가져와서 이미지파일이면 해당 썸네일을 호마녀 표기,
             *일반파일이면 우리가 만들어 놓은 일반팡리.png를 썸네일로 표기하도록 한 함수
             */

            $(function() {
               /*  getAllUploadqa(qno,$("#uploadedItems"));//댓글 수정하는 코드 */
               getAllReplyqa(qno, $("#replies"),mid,aid);
               /*댓글 수정 완료 버튼을 눌렀을 때 실행되는 코드*/

               $(".goback").click(function() {
                  history.go(-1);
               });

               $("#item_btn_update_submit")
                     .click(
                           function() {
                              /*아이디가 item_input_update_replyer인 input태그의 value값을 가져와서 replyer라는 변수에 대입*/
                              let replyer = $(
                                    "#item_input_update_replyer")
                                    .val();

                              let replyText = $(
                                    "#item_input_update_replyText")
                                    .val();

                              let rno = $("#modal_rno").text();

                              $
                                    .ajax({
                                       type : "put",
                                       url : "/replies",
                                       headers : {
                                          "Content-Type" : "application/json; charset=UTF-8",
                                          "X-HTTP-Method-Override" : "PUT"
                                       },
                                       data : JSON.stringify({
                                          replyer : replyer,//문자열:변수
                                          replyText : replyText,
                                          rno : rno
                                       }),
                                       dataType : "text",
                                       success : function(result) {
                                          getAllReplyqa(qno,
                                                $("#replies"),mid,aid);
                                       }
                                    });

                           });

               $("#replies").on("click", ".item_btn_update", function() {
                  $("#myModal").modal("show");//modal 띄우는 

                  let replyer = $(this).prev().prev().prev().val();
                  let replyText = $(this).prev().prev().text();
                  let rno = $(this).attr("data-rno");//사용자 특성 값 rno

                  $("#modal_rno").text(rno);//model값에 rno
                  $("#item_input_update_replyer").val(replyer);//modal replyer 설정
                  $("#item_input_update_replyText").val(replyText);//modal에 reply 하는것 

               });

               $("#replies").on("click", ".item_btn_delete", function() {
                  let rno = $(this).attr("data-rno");
                  $.ajax({
                     type : 'delete',
                     url : '/replies',
                     headers : {
                        "Content-Type" : "application/json",
                        "X-HTTP-Method-Override" : "DELETE"
                     },
                     data : JSON.stringify({//mvc handler에서 rno 값 가져와야 한다.
                        rno : rno
                     }),
                     dataType : 'text',
                     success : function(result) {

                        getAllReplyqa(qno, $("#replies"),mid,aid);
                     }

                  });
               });

               $("#reply_btn_submit").on("click", function() {
                  let replyer = $("#replyer").val();
                  let replyText = $("#replyText").val();

                  $.ajax({
                     type : 'post',
                     url : '/replies',
                     headers : {
                        "Content-Type" : "application/json",
                        "X-HTTP-Method-Override" : "POST"
                     },
                     data : JSON.stringify({
                        replyer : replyer,
                        replyText : replyText,
                        qno : qno
                     }),
                     dataType : 'text',
                     success : function(result) {
                     
                        getAllReplyqa(qno, $("#replies"),mid,aid);
                        
                  
                        $("#replyText").val("");
                     }

                  });

               });

               $(".reply").on("click", function() {
                  $(".collapse").collapse("toggle");
               });

               $(".delete").on(
                     "click",
                     function() {
                        $("form").attr("action",
                              "/qa/delete/${nQdto.qno}").attr(
                              "method", "post").submit();
                     });

               

            });
            
         </script>


      </div>
   </div>



</body>
</html>