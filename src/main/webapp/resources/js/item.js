/**
 * 
 */
 
 
  function paging(data){
	
	let sstr = `
	
	<div><input class = "curPage"  value ="${data.curPage}"></div>
	<div><input class = "beginPageNum" value ="${data.beginPageNum}"></div>
	<div><input class = "finishPageNum" value ="${data.finishPageNum}"></div>
	<div><input class = "totalPage" value ="${data.totalPage}"></div>
	
	
	`;
	return sstr;
}

 function updateitem(adminlistiId,adminlistiName,adminlistiPrice,adminlistiDc,adminlistiCount,adminlistifilename,adminlistii_CATEGORY){
	
	let str = `
			
				<td class = "adminlistiId"><input type = "hidden" id = "updateiId" value = "${adminlistiId}" size = "6">${adminlistiId}</td>
				<td class = "adminlistiName"><input id = "updateiName" value = "${adminlistiName}" size = "6"></td>
				<td class = "adminlistiPrice"><input id = "updateiPrice" value = "${adminlistiPrice}" size = "6"></td>
				<td class = "adminlistiDc"><input id = "updateiDc" value = "${adminlistiDc}" size = "6"></td>
				<td class = "adminlistiCount"><input id = "updateiCount" value = "${adminlistiCount}" size = "6"></td>
				<td class = "adminlistifilename"><img alt="" src="/displayfile?filename=${adminlistifilename}" height = 100px width = 100px></td>
				<td class = "adminlistii_CATEGORY">
				${adminlistii_CATEGORY}
				<input class = "updatei_CATEGORY" id = "cateogoryname" value = "옷" type = "hidden" size = "6">
				<select id = "category" onchange = "changecategory()">
				<option value = "옷">옷</option>
				<option value = "신발">신발</option>
				<option value = "가방">가방</option>
				<option value = "모자">모자</option>
				<option value = "원피스">원피스</option>
</select>
				</td>
				<td><button id = "item_updatefinish_btn">수정완료</button><a href = "/item/adminlist"><button id = "item_deletefinish_btn">취소</button></a></td>
			
		
	`;
	return str;
}
 
 
 function insertsubphotoname(subphotoname){
	
	let str = `
	 <span>
  <img src="/displayfile?filename=${subphotoname}" alt="..." width="100px" height="100px">
  </span>
	
	`;
	return str;
	
}
 
 function getitemfilelist(iId,subphoto){
	
	$.getJSON("/item/getitemfilelist/"+iId, function(subphotonamelist){
		
		for(let i = 0 ; i < subphotonamelist.length;i++){
			let subphotoname = subphotonamelist[i];
			
			let str = insertsubphotoname(subphotoname);
			subphoto.append(str);
		};
	
		
		
	})
	
}
 
 
 function itemlistlist(iteminfo){

	let str = `
	<div class = "box">
	<div class="card " style="width: 18rem;">
 <a href = "/item/read/${iteminfo.iId}">
 <div>
  <img src="/displayfile?filename=${iteminfo.ifilename}"class="card-img-top" alt="..." width="100px" height="200px">
  </div>
  </a>
  <div class="card-body">
    <p class="card-text">상품이름:${iteminfo.iName}</p>
    <p class="card-price">상품가격:${iteminfo.iPrice}</p>
  </div>
</div>
	</div>
	`;
	return str;
}

function gocategoryitem(category,itemlist,showhowitemlist,curPage,pagingaa, prefixPage) {
	tagstr = "";
		
			$.getJSON("/item/category/"+category+"/"+showhowitemlist+"/"+curPage+"/all", function(data) {
				
				for(let i = 0 ; i < data.list.length;i++){
					let iteminfo = data.list[i];
					let str = itemlistlist(iteminfo);
					tagstr += str;
				}
				let sstr = paging(data);
				itemlist.html(tagstr);
				pagingaa.append(sstr);
				
				let curPage = $(".curPage").attr("value");
				let beginPageNum = $(".beginPageNum").attr("value");
				let finishPageNuM = $(".finishPageNum").attr("value");
				let totalPage = $(".totalPage").attr("value");
				alert(beginPageNum);
					
			
					if(curPage > 1){
						prefixPage.attr("href","/item/list?curPage="+curPage-1);
					}else{
						$("#prefixPage").attr("href","/item/list?curPage="+1);
					}
					
					$("c:forEach").attr("begin",beginPageNum);
					
					$("c:forEach").attr("end",finishPageNuM);
					
					if(curPage < totalPage){
						$("#suffixPage").attr("href","/item/list?curPage="+curPage+1);
					}else{
						$("#suffixPage").attr("href","/item/list?curPage="+totalPage);
					}
				
					
				
					$("#category").text(localStorage.getItem("category"));
					
					if(localStorage.getItem("showhowitemlist") == "itemsequence"){
						$("#itemsequence").css({"font-weight":"bold","color":"red"});
					}else if(localStorage.getItem("showhowitemlist") == "iPricedesc"){
						$("#iPricedesc").css({"font-weight":"bold","color":"red"});
					}else{
						$("#iPriceasc").css({"font-weight":"bold","color":"red"});
					}

			});
}

function changecategory() {
		let category = document.getElementById("category");
		let selectcategory = category.options[category.selectedIndex].value;
		$("#cateogoryname").val(selectcategory);
	}

function insertitemsubimgfile(result, itemimgfilename,itemimgfilekey){
   let str = `
<div class="col mb-4" width="500px" height="250px">
   <div class="card itemimgfilename border-primary text-center" >
		<div>
      <img src="${result}" alt="" width="100px" height="100px">
		</div>
      <div class="card-body">
          <p class="card-text">${itemimgfilename}</p>
          <a href="#" data-itemimgfilekey = "${itemimgfilekey}" data-itemimgfilename = "new" class="btn btn-danger btn_del_subitem" >삭제</a>
      </div>
   </div>
</div>
   `;
   
   return str;
} 

function insertitemimgfile(result, itemimgfilename,itemimgfilekey){
   let str = `
<div class="col mb-4" width="500px" height="250px">
   <div class="card itemimgfilename border-primary text-center" >
		<div>
      <img src="${result}" alt="" width="100px" height="100px">
		</div>
      <div class="card-body">
          <p class="card-text">${itemimgfilename}</p>
          <a href="#" data-itemimgfilekey = "${itemimgfilekey}" data-itemimgfilename = "new" class="btn btn-danger btn_del_item" >삭제</a>
      </div>
   </div>
</div>
   `;
   
   return str;
} 