<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/_head.jsp" %>

<body>
	<%@ include file="_navbar.jsp"%>
	<div class="container">
		<div class="row pt-4">
			<h3>table sample</h3>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Image</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td><img width="200px" src="/web-sample/sample1.jpg"></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td><img width="200px" src="/web-sample/sample2.jpg"></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry</td>
						<td>the Bird</td>
						<td><img width="200px"  src="/web-sample/${uploadFilePath}"></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="row pt-4">
			<h3>card sample</h3>
		</div>
		<div class="row pb-5">
			<div class="card-deck">
				<div class="card" style="width: 18rem;">
					<img class="bd-placeholder-img card-img-top" width="100%" height="200px" src="/web-sample/sample1.jpg">
					<div class="card-body">
						<h5 class="card-title">あざらしが住む宿</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">詳細を見る</a>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img class="bd-placeholder-img card-img-top" width="100%" height="200px" src="/web-sample/sample2.jpg">
					<div class="card-body">
						<h5 class="card-title">あざらしの鼻の宿</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">詳細を見る</a>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img class="bd-placeholder-img card-img-top" width="100%" height="200px" src="/web-sample/${uploadFilePath}">
					<div class="card-body">
						<h5 class="card-title">アップロードした画像</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">詳細を見る</a>
					</div>
				</div>
			</div>
		</div>
	</div>


<%@ include file="_script.jsp" %>
</body>
</html>