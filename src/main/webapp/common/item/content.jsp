<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<div class="dtn-video bg-white">
					<figure class="effect-ming tm-video-item">
						<img src="<c:url value='${item.poster}'/>" alt="Image"
							class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Play Video</h2>
							<a href="/ASM_Java4/video-detail/id/${item.id}">View
								more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between pl-2">
						<h3 class="fs-6" style="font-size: 100%;">
							<a href="/ASM_Java4/video-detail/id/${item.id}"
								class="text-dark"> <span>${item.title}</span>
							</a>
						</h3>
					</div>
					<div class="d-flex justify-content-between text-gray pl-2">
						<span>${item.discriptions}</span>
					</div>
					<div
						class="mt-5 d-flex justify-content-between tm-text-gray pl-2 pb-2">
				</div>
			</div>
			</div>