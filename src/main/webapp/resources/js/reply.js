/** 
 *
 */
 
 
  // 리뷰 불러오는 코드
 function getAllReply3(iId, el){
   el.html("");
   
   $.getJSON("/review/"+iId+"/all", function(result){
         console.log(result);
      for(let i = 0 ; i <result.length; i++){
         let tagstr = "";
         let item = result[i];
         let rfilename = item.rfilenamelist;
         for(let j = 0 ; j < rfilename.length;j++){
            let rfile = rfilename[j];
            let itemstr = makeItemTag3(rfile);
            tagstr += itemstr;
            
         }
         let str = makeItemTag2(item,tagstr);
         el.append(str);
      }
      
   })
};


//이미지 크기 조절
function makeItemTag3(rfile){
   
   
   let str = `
   
<span class="modalimg"><img src="/displayfile?filename=${rfile}"alt="..." width="300px" height="250px"></span>

   
   `;
   return str;

}

// 리뷰 수정삭제 버튼
function makeItemTag2(item,tagstr){
   
   
   
   let str = `
   
<div class="card item my-5">
  <div class="card-header">
    <span>댓글 번호 : ${item.rno}</span>  &nbsp; &nbsp; <span> ID : ${item.mid} </span> &nbsp;&nbsp;&nbsp;
   <span class = "float-right">최종 수정일 : ${item.updateDay}</span>
  </div>
  <div class="card-body">
    <h5 class="card-title">${item.rtitle}</h5>
    <p  class="card-text">${item.rcontent}<div>${tagstr}</div></p>
   
    <a data-rno ="${item.rno}" class="btn btn-primary item_btn_update">수정</a>
    <a data-rno ="${item.rno}" class="btn btn-primary item_btn_delete">삭제</a>
  </div>
</div>

   
   `;
   return str;

}
 
 
 

function test2(result, filename, filekey){
   
   if(!isImg(filename)){
      result = "/resources/img/일반파일.png";   
   }
   
   let str = `
<div class="col mb-4">
   <div class="card filename border-primary text-center">
      <div>
      <img src="${result}" alt="업로드한 파일의 썸네일" width="100px" height="100px">
      </div>
      <div class="card-body">
          <p class="card-text">${filename}</p>
          <a href="#" data-filekey = "${filekey}" data-filename = "new" class="btn btn-danger btn_del_item" >삭제</a>
      </div>
   </div>
</div>
   `;
   
   return str;
} 


function test(result, filename,filekey){
   
   if(!isImg(filename)){
      result = "/resources/img/일반파일.png";   
   }
   
   let str = `
<div class="col mb-4">
   <div class="card filename border-primary text-center">
      <div>
      <img src="${result}" alt="업로드한 파일의 썸네일" width="100px" height="100px">
      </div>
      <div class="card-body">
          <p class="card-text">${filename}</p>
          <a href="#" data-filekey = "${filekey}" data-filename = "new" class="btn btn-danger btn_del_item" >삭제</a>
      </div>
   </div>
</div>
   `;
   
   return str;
} 

function getAllUploadForUpdateUI(bno, uploadedItems){
   $.getJSON("/board/"+bno+"/uploadall", function(data){
      for(let i = 0 ; i < data.length ; i++){
         let filename = data[i];
         let str = makeUploadItemTag2(filename);
         uploadedItems.append(str);
      }
   });
}


function getAllUpload(bno, uploadedItems){
   $.getJSON("/board/"+bno+"/uploadall", function(data){
      console.log(data);
      for(let i = 0 ; i < data.length ; i++){
         let filename = data[i];
         let str = makeUploadItemTagForRead(filename);
         uploadedItems.append(str);
      }
   });
}
function getAllUploadqa(qno, uploadedItems){
   $.getJSON("/qa/"+qno+"/uploadall", function(data){
      console.log(data);
      for(let i = 0 ; i < data.length ; i++){
         let filename = data[i];
         let str = makeUploadItemTagForRead(filename);
         uploadedItems.append(str);
      }
   });
}
 
function makeUploadItemTagForRead(filename){
   let imgSrc = "";
            if(isImg(filename)){
               imgSrc = "/displayfile?filename="+filename;
            }else{
               imgSrc = "/resources/img/일반파일.png";
            }
            let aHref = "";
            if(isImg(filename)){
               aHref = "/displayfile?filename="+getImgFilePath(filename);
            }else{
               aHref = "/displayfile?filename="+filename;
            }
            let pText = getOrgName(filename);
            let btnDataFilename = filename;
   
   
   let str = `
   <div class = "col mb-4">
<div class="card filename border-primary text-center"  style="width: 18rem;">
  <a href = "${aHref}" target="_blank"><img src="${imgSrc}" class="" alt="업로드한 파일의 썸네일"></a>
  <div class="card-body">
    <p class="card-text">${pText}</p>
  </div>
</div>
</div>
   `;
   return str;
}  
 
function makeUploadItemTag2(filename){
   let imgSrc = "";
            if(isImg(filename)){
               imgSrc = "/displayfile?filename="+filename;
            }else{
               imgSrc = "/resources/img/일반파일.png";
            }
            let aHref = "";
            if(isImg(filename)){
               aHref = "/displayfile?filename="+getImgFilePath(filename);
            }else{
               aHref = "/displayfile?filename="+filename;
            }
            let pText = getOrgName(filename);
            let btnDataFilename = filename;
   
   
   let str = `
   <div class = "col mb-4">
<div class="card filename border-primary text-center"  style="width: 18rem;">
  <a href = "${aHref}" target="_blank"><img src="${imgSrc}" class="" alt="업로드한 파일의 썸네일"></a>
  <div class="card-body">
    <p class="card-text">${pText}</p>
    <a href="#" data-filename = "${btnDataFilename}" class="btn btn-danger btn_del_item" >삭제</a>
  </div>
</div>
</div>
   `;
   return str;
} 
 
 
function makeUploadItemTag(imgSrc,aHref,pText,btnDataFilename){
   let str = `
   <div class = "col mb-4">
<div class="card filename border-primary text-center"  style="width: 18rem;">
  <a href = "${aHref}" target="_blank"><img src="${imgSrc}" class="" alt="업로드한 파일의 썸네일"></a>
  <div class="card-body">
    <p class="card-text">${pText}</p>
    <a href="#" data-filename = "${btnDataFilename}" class="btn btn-danger btn_del_item" >삭제</a>
  </div>
</div>
</div>
   `;
   return str;
}
 
function getOrgName(filename) {
            let orgName = "";
            let idx = -1;
            if(isImg(filename)){
               idx = filename.indexOf("_",14) + 1;
            }else{
               idx = filename.indexOf("_") + 1;
            }
            orgName = filename.substring(idx);
            
          return orgName;
       }
         
         
         function getImgFilePath(filename) {
         let prefix = filename.substring(0,12);
         let suffix = filename.substring(14);
         
         return prefix + suffix;
      }
         
         function isImg(filename) {
            let idx = filename.lastIndexOf(".") + 1;
            let formatName = filename.substring(idx).toLowerCase();
            if (formatName == "png"|| formatName == "gif" || formatName == "jpg" || formatName == "jpeg") {
               
               return true;
               
            }else{
               
               return false;
            }
         }





function getAllReply2(bno, el){
   let tagStr = "";
   
   $.getJSON("/review/"+bno+"/all", function(result){
      for(let i = 0 ; i <result.length; i++){
         let item = result[i];
         let str = makeItemTag(item);
         tagStr += str;      
      }
      el.html(tagStr);
   })
};

function getAllReplyqa(qno, el,mid,aid){
   el.html("");
   
   $.getJSON("/replies/"+qno+"/all", function(result){
      for(let i = 0 ; i <result.length; i++){
         let item = result[i];
         let str = makeItemTag(item,mid,aid);
         el.append(str);
      }
   })
};

function getAllReply(bno, el){
   el.html("");
   
   $.getJSON("/review/"+bno+"/all", function(result){
   
      for(let i = 0 ; i <result.length; i++){
         let item = result[i];
         let str = makeItemTag(item);
         el.append(str);
      }
   })
};


function getAllReply(bno, el){
   el.html("");
   
   $.getJSON("/review/"+bno+"/all", function(result){
   
      for(let i = 0 ; i <result.length; i++){
         let item = result[i];
         let str = makeItemTag(item);
         el.append(str);
      }
   })
};


function makeItemTag(item,mid,aid){
   
   
   let str = `
   
<div class="card item my-5">
  <div class="card-header">
    <span>작성자 :${item.replyer}</span> <span class = "float-right">최종 수정일 : ${item.updateDay}</span>
  </div>
  <div class="card-body">
     <input type = "hidden" value = "${item.replyer}" ></input>
    <p class="card-text">${item.replyText}</p>
   <br>
    <a data-rno ="${item.rno}" href="#" class="${item.replyer==mid||aid !=''?'btn btn-warning item_btn_update':'hidden'}">수정</a>
    <a data-rno ="${item.rno}" href="#" class="${item.replyer==mid||aid !=''?'btn btn-danger delete item_btn_delete':'hidden'}">삭제</a>
  </div>
</div>

   
   
   
   `;
   return str;
   
   
}


function getPagingReply(nno, el, curPage) {
   el.html("");

   $.getJSON("/replies/" + nno + "/"+curPage, function(result) {
      for (let i = 0; i < result.length; i++) {
         let item = result[i];
         let str = makeItemTag(item);
         el.append(str);
      }
   });
}