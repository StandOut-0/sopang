<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
	<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
				<c:set var="contextPath" value="${pageContext.request.contextPath}" />


					<div class="container">
						<div class="row ms-5 ps-5">
							<div class="mt-5 p-0 ps-5 align-items-center">
								<div class="ps-4">

									<p class="fs-5 fw-bold mb-2">회원관리</p>
									<form name="frm_mod_member">

										<input type="radio" name="simple" checked class="d-none" /> <select
											name="curYear" class="d-none">
											<c:forEach var="i" begin="0" end="5">
												<c:choose>
													<c:when test="${endYear==endYear-i }">
														<option value="${endYear}" selected>${endYear}</option>
													</c:when>
													<c:otherwise>
														<option value="${endYear-i }">${endYear-i }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> <select name="curMonth" class="d-none">
											<c:forEach var="i" begin="1" end="12">
												<c:choose>
													<c:when test="${endMonth==i }">
														<option value="${i }" selected>${i }</option>
													</c:when>
													<c:otherwise>
														<option value="${i }">${i }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> <select name="curDay" class="d-none">
											<c:forEach var="i" begin="1" end="31">
												<c:choose>
													<c:when test="${endDay==i }">
														<option value="${i }" selected>${i }</option>
													</c:when>
													<c:otherwise>
														<option value="${i }">${i }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>

										<div class="d-flex align-items-center gap-1 justify-content-between">
											<div>
												<a href="javascript:search_order_history('today')"
													class="badge rounded-pill btn mb-2 rounded-0 border-main samll active">오늘</a>
												<a href="javascript:search_goods_list('six_month')" name="six_month"
													class="badge rounded-pill btn mb-2 rounded-0 border-main samll">최근
													6개월</a> <a href="javascript:search_goods_list('one_year')"
													class="badge rounded-pill btn mb-2 rounded-0 border-main samll before_1year">before_1year</a>
												<a href="javascript:search_goods_list('two_year')"
													class="badge rounded-pill btn mb-2 rounded-0 border-main samll before_2year">before_2year</a>
												<a href="javascript:search_goods_list('three_year')"
													class="badge rounded-pill btn mb-2 rounded-0 border-main samll before_3year">before_3year</a>
											</div>
											<div>
												<button type="button"
													class="btn btn-main rounded-0 fw-bold p-2 ms-3 flex-fill fs-08"
													style="width: 300px;">추가하기</button>
											</div>
										</div>


										<div class="">
											<input type="text" size="4" value="${beginYear}" />년 <input type="text"
												size="4" value="${beginMonth}" />월 <input type="text" size="4"
												value="${beginDay}" />일 &nbsp; ~ <input type="text" size="4"
												value="${endYear}" />년 <input type="text" size="4"
												value="${endMonth}" />월 <input type="text" size="4"
												value="${endDay}" />일
										</div>

										<div class="border-top border-main border-2 mt-2"></div>

										<div class="table-responsive mt-4">
											<table class="table border-top mb-0 small fw-light border-bottom">
												<tbody>
													<tr>
														<td class="table-light p-2 align-middle fw-bold border-end text-center" style="width: 100px;">회원ID</td>
														<td class="table-light ps-4 align-middle fw-bold text-center border-end">회원정보</td>
														<td class="table-light ps-4 align-middle fw-bold text-center border-end">배송정보</td>
														<td class="table-light align-middle fw-bold text-center border-end">가입일</td>
														<td class="table-light text-center px-4 align-middle" style="width: 114px;">-</td>
													</tr>
													<c:choose>
														<c:when test="${empty member_list}">
															<tr>
																<td colspan="5">
																<div
																	class="shadow-sm p-4 mt-3 rounded border border-light">
																	<p class="my-5 text-center">조회된 회원이 없습니다.</p>
																</div>
																</td>
															</tr>

														</c:when>


														<c:otherwise>
																<c:forEach var="item" items="${member_list}"
																	varStatus="item_num">

																	<tr>
																		<td class="align-middle border-end text-center">
																			${item.member_id}
																		</td>
																		<td class="border-end align-middle">
																			<div class="d-flex mb-1 align-items-center">
																				<span style="width: 100px;" class="">이름</span>
																				<input class="form-control rounded-0" type="text" placeholder="이름" value="${item.member_name}">
																			</div>
																			<div class="d-flex mb-1 align-items-center">
																				<span style="width: 100px;" class="">아이디</span>
																				<input class="form-control rounded-0" type="text" name="member_id" placeholder="아이디" value="${item.member_id}">
																			</div>
																			<div class="d-flex mb-1 align-items-center">
																				<span style="width: 100px;" class="">비밀번호</span>
																				<input class="form-control rounded-0" type="text" placeholder="비밀번호" value="${item.member_pw}">
																			</div>
																			<div class="d-flex mb-0 align-items-center">
																				<span style="width: 100px;" class="">휴대전화</span>
																				<input class="form-control rounded-0" type="text" placeholder="010-0000-0000" value="${item.hp1}">
																			</div>
																		</td>
																		<td class="border-end align-middle">
																			<div class="d-flex mb-1 align-items-center">
																				<span style="width: 97.5px;" class="">우편번호</span>
																				<div class="input-group mb-0">
																					<input type="text" class="form-control rounded-0" placeholder="우편번호" id="zipcode" name="zipcode" size=5
														value="${item.zipcode}" aria-describedby="button-addon2">
														<a class="btn border-main small rounded-0 samll"
														href="javascript:execDaumPostcode()" id="button-addon2">우편번호검색</a>
																				</div>
																				
																				
																			</div><div class="d-flex mb-1 align-items-center">
																				<span style="width: 100px;" class="">주소</span>
																				<input class="form-control rounded-0" type="text" placeholder="주소" value="${item.member_address}">
																			</div><div class="d-flex mb-1 align-items-center">
																				<span style="width: 100px;" class="">상세주소</span>
																				<input class="form-control rounded-0" type="text" placeholder="상세주소" value="${item.subaddress}">
																			</div>     
																		</td>
																		<td class="border-end align-middle text-center">
																			${item.joinDate}
																			<c:out value="${arr[0]}" /><br>
																			<c:choose>
																			<c:when test="${item.del_yn=='N' }">
																				<strong> 활동중</strong>
																			</c:when>
																			<c:otherwise>
																			</c:otherwise>
																		</c:choose>
																		
																		</td>
																	
																			<td class="align-middle">
																				<button class="w-100 btn border-main small rounded-0 samll mb-2" type="button">수정</button>
																				<button class="w-100 btn border-main small rounded-0 samll mb-0" type="button" onClick="fn_delete_member('${item.member_id }','Y')">삭제</button>
																			</td>
																	
														</tr>
																</c:forEach>
														</c:otherwise>
													</c:choose>

												</tbody>
											</table>
										</div>



									</form>

								</div>
							</div>
						</div>
					</div>


					<script>
					
					function fn_delete_member(member_id ,del_yn){
						var member_id=member_id;
						var del_yn=del_yn;
					alert(member_id+", "+del_yn); 
					    
						var answer=confirm("해당회원을 삭제하시겠습니까?");
						if(answer==true){
							$.ajax({
								type : "post",
								async : false, //false인 경우 동기식으로 처리한다.
								url : "${contextPath}/mypage/deleteMember.do",
								data : {
									member_id:member_id,
									del_yn:del_yn
								},
								success : function(data, textStatus) {
									if(data.trim()=='delete_success'){
										alert("삭제되었습니다.");
										location.href="${contextPath}/admin/member/adminMemberMain.do";
									}else if(data.trim()=='failed'){
										alert("다시 시도해 주세요.");	
									}
									
								},
								error : function(data, textStatus) {
									alert("에러가 발생했습니다."+data);
								},
								complete : function(data, textStatus) {
									//alert("작업을완료 했습니다");
									
								}
							}); //end ajax
						}
				
					}
					

						let date = new Date();
						let before_1year = date.getFullYear() - 1;
						let before_2year = date.getFullYear() - 2;
						let before_3year = date.getFullYear() - 3;
						document.querySelector('.before_1year').innerHTML = before_1year;
						document.querySelector('.before_2year').innerHTML = before_2year;
						document.querySelector('.before_3year').innerHTML = before_3year;


						function search_member(fixedSearchPeriod) {
							var formObj = document.createElement("form");
							var i_fixedSearch_period = document.createElement("input");
							i_fixedSearch_period.name = "fixedSearchPeriod";
							i_fixedSearch_period.value = fixedSearchPeriod;
							formObj.appendChild(i_fixedSearch_period);
							document.body.appendChild(formObj);
							formObj.method = "get";
							formObj.action = "/bookshop01/admin/member/adminMemberMain.do";
							formObj.submit();
						}

						if (window.location.href.includes("fixedSearchPeriod")) {
							const badges = document.querySelectorAll(".badge");
							for (b of badges) {
								b.classList.remove("active");
							}

							if (window.location.href.includes("today")) {
								badges[0].classList.add("active");
							} else if (window.location.href.includes("six_month")) {
								badges[1].classList.add("active");
							} else if (window.location.href.includes("one_year")) {
								badges[2].classList.add("active");
							} else if (window.location.href.includes("two_year")) {
								badges[3].classList.add("active");
							} else if (window.location.href.includes("three_year")) {
								badges[4].classList.add("active");
							}

						}


					</script>