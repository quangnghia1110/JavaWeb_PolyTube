package com.poly.controller;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.poly.dao.FavoriteDAO;
import com.poly.dao.ShareDAO;
import com.poly.dao.VideoDAO;
import com.poly.entity.FAVORITE;
import com.poly.entity.SHARES;
import com.poly.entity.USERS;
import com.poly.entity.VIDEO;

@WebServlet({ "/videos", "/video-detail/id/*", "/like-video", "/video-detail/like/*", "/video-share","/video-share/share","/share-video" })
public class VideoServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private String id = "", urlVideo = "";
	private int count = 0;
	private static final int VIDEO_MAX_PAGE_SIZE = 8;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		setAccountHeader(request, response);
		switch (path) {
			case "/videos": {
				doGetVideos(request, response);
				break;
			}
			case "/video-detail/id": {
				doGetVideoDetail(request, response);
				break;
			}
			case "/like-video": {
				doGetLikeVideo(request, response);
				break;
			}
			case "/video-share": {
				doGetVideoShare(request, response);
				break;
			}
			case "/share-video": {
				doGetShareVideo(request, response);
				break;
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		count = 0;
		USERS user = (USERS) request.getSession().getAttribute("user");
		setAccountHeader(request, response);
		switch (path) {
			case "/video-detail/like": {
				FavoriteDAO fav = new FavoriteDAO();
				if (user != null) {
					List<FAVORITE> list = fav.findLike(id, user.getId());
					if (list != null && !list.isEmpty()) {
						unLike(request, response);
					} else {
						likeVideo(request, response);
					}
				} else {
					response.sendRedirect("/ASM_Java4/login");
				}
				count = 1;
				break;
			}
			case "/video-share/share": {
				if (user != null) {
					if (checkFormShareVideoServlet(request, response) == true) {
						VideoDAO dao = new VideoDAO();
						VIDEO vid = dao.findById(id);
						sendMail(request, response, user.getFullname(), vid.getTitle(), urlVideo);
						insertShares(request, response);
						doGetVideoShare(request, response);
					} else {
						doGetVideoShare(request, response);
					}
				} else {
					response.sendRedirect("/ASM_Java4/login");
				}
				count = 1;
				break;
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
//	private void doGetVideos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		VideoDAO dao = new VideoDAO();
//		List<VIDEO> countVideo = dao.findAll();
//		int maxPage = (int) Math.ceil(countVideo.size()/(double) VIDEO_MAX_PAGE_SIZE);
//		req.setAttribute("maxPage", maxPage);
//		String pageNumber = req.getParameter("page");
//		List<VIDEO> videos;
//		if(pageNumber == null||maxPage<Integer.valueOf(maxPage)) {
//			videos = dao.findAll(1, VIDEO_MAX_PAGE_SIZE);
//			req.setAttribute("currentPage", 1);
//		}else {
//			videos = dao.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
//			req.setAttribute("currentPage",Integer.valueOf (pageNumber));
//		}
//		
//		
//		
//		
//		//Lấy list video, ban đầu chỉ có 1 video nên dùng vòng for
//		req.setAttribute("videos", videos);
//		req.getRequestDispatcher("/views/user/index/video/videos.jsp").forward(req, resp);
//	}
	
	private void doGetVideos(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		List<VIDEO> video = dao.findAll();
		if(video!=null) {
			req.setAttribute("videos", video);
		}
		USERS user = (USERS) req.getSession().getAttribute("user");
		if(user!=null) {
			req.getRequestDispatcher("/views/user/index/video/videos.jsp").forward(req, resp);
		}
		else{
			req.getRequestDispatcher("/views/user/index/401.jsp").forward(req, resp);
		}
	}
	
	
	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	private void doGetVideoDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		VIDEO video = new VIDEO();
		List<VIDEO> video2 = dao.findVideoTop5();
		USERS user = (USERS) request.getSession().getAttribute("user");
		FavoriteDAO fav = new FavoriteDAO();
		String uri = request.getRequestURI();
		id = uri.substring(uri.lastIndexOf("/") + 1);
		if(user!=null) {
			List<FAVORITE> list = fav.findLike(id, user.getId());
			if (list != null && !list.isEmpty()) {
				request.setAttribute("likelog", "Unlike");
				request.setAttribute("btnlike", "bg-dark");
			} else {
				request.setAttribute("likelog", "Like");
				request.setAttribute("btnlike", "bg-danger");
			}
			video = dao.findById(id);
			if (count == 0) {
				int views = video.getViews();
				video.setViews(views + 1);
				dao.update(video);
			} else {
				count = 0;
			}
			urlVideo = request.getRequestURL().toString();
			request.setAttribute("videos", video);
			request.setAttribute("video", video2);
			request.getRequestDispatcher("/views/user/index/video/video-detail.jsp").forward(request, response);response.setStatus(401);
		}
		else {
			request.getRequestDispatcher("/views/user/index/401.jsp").forward(request, response);
		}
	}
	
	
	
	
	
	
	
	
	
	
	private void doGetLikeVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		if (user != null) {
			FavoriteDAO dao = new FavoriteDAO();
			List<VIDEO> list = dao.findLikeVideo(user.getId());
			request.setAttribute("videos", list);
		}
		request.getRequestDispatcher("/views/user/index/video/like-video.jsp").forward(request, response);
	}
	private void likeVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		VideoDAO daoVideo = new VideoDAO();
		VIDEO video = daoVideo.findById(id);
		if (user != null) {
			FavoriteDAO dao = new FavoriteDAO();
			FAVORITE fav = new FAVORITE();
			VIDEO vi = new VIDEO();
			vi.setId(id);
			fav.setVideo(vi);

			USERS u = new USERS();
			u.setId(user.getId());
			fav.setUser(u);
			fav.setLikeDate(new Date());

			dao.create(fav);
			request.getSession().setAttribute("like", fav);
			List<FAVORITE> list = dao.findLike(id, user.getId());
			if (list != null && !list.isEmpty()) {
				request.setAttribute("likelog", "Unlike");
				System.out.println(list.toString());
			} else {
				request.setAttribute("likelog", "Like");
			}
			request.setAttribute("videos", video);
			response.sendRedirect("/ASM_Java4/video-detail/id/" + id);
		}
		count = 1;
	}
	private void unLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		VideoDAO daoVideo = new VideoDAO();
		VIDEO video = daoVideo.findById(id);
		if (user != null) {
			FavoriteDAO dao = new FavoriteDAO();
			List<FAVORITE> list = dao.findLike(id, user.getId());
			dao.remove(list.get(0).getId().toString());
			if (list != null && !list.isEmpty()) {
				request.setAttribute("likelog", "Like");
			} else {
				request.setAttribute("likelog", "Unlike");
			}
			request.setAttribute("videos", video);
			response.sendRedirect("/ASM_Java4/video-detail/id/" + id);
		} else {
			response.sendRedirect("/ASM_Java4/login");
		}
		count = 1;
	}
	
	
	
	
	
	
	
	
	
	private void doGetShareVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		if (user != null) {
			ShareDAO dao = new ShareDAO();
			List<VIDEO> list = dao.findShareUser(user.getId());
			request.setAttribute("shares", list);
		}
		request.getRequestDispatcher("/views/user/index/video/share-video.jsp").forward(request, response);
	}
	private void doGetVideoShare(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/user/index/video/video-share.jsp").forward(request, response);
	}
	private void insertShares(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		VideoDAO daoVideo = new VideoDAO();

		String email = request.getParameter("email");

		ShareDAO dao = new ShareDAO();
		SHARES share = new SHARES();

		USERS u = new USERS();
		u.setId(user.getId());
		share.setUser(u);

		VIDEO vid = daoVideo.findById(id);
		vid.setId(id);
		share.setVideo(vid);

		share.setEmail(email);
		share.setShareDate(new Date());
		dao.create(share);
	}
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	protected void sendMail(HttpServletRequest request, HttpServletResponse response, String username, String video, String url) throws ServletException, IOException {
		//Thông tin người nhận lấy từ jsp
		String toEmail = request.getParameter("email");
		String subject = "PolyTube - Thông báo - Người dùng " + username +" vừa mới chia sẻ video cho bạn";
		String body =  "Tiêu đề video: " + video + ". Xem video chi tiết tại: " + "  " + url;
        boolean emailSent = EmailUtil.sendMail(toEmail, subject, body);
        if(emailSent) {
            request.setAttribute("message", "Gửi email thành công !!!");
    		request.getRequestDispatcher("/views/user/index/video/video-share.jsp").forward(request, response);
        }
        else {
        	request.setAttribute("message", "Gửi email thất bại !!!");
    		request.getRequestDispatcher("/views/user/index/video/video-share.jsp").forward(request, response);
        }
	}
	
	
	
	
	
	
	
	
}