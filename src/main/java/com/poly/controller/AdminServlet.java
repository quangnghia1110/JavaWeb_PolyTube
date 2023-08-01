package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.*;
import com.poly.entity.*;
import com.poly.util.UploadUtils;

@MultipartConfig
@WebServlet({ "/admin/index", "/admin/index/report1", "/admin/index/report2", "/admin/user-ctr", "/admin/video-ctr",
		"/admin/user-update", "/admin/video-update/*", "/admin/video-update/edit/*", "/admin/user-update/edit/*",
		"/admin/user-update/create", "/admin/user-update/update", "/admin/user-update/delete",
		"/admin/video-update/create", "/admin/video-update/update/*", "/admin/video-update/delete" })
public class AdminServlet extends BaseServlet {

	String id;
	String VideoId;
	int countUpdate = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		setAccountHeader(request, response);
		switch (path) {
			case "/admin/index": {
				doGetIndex(request, response);
				break;
			}
			case "/admin/user-ctr": {
				doGetUserCtr(request, response);
				break;
			}
			case "/admin/user-update": {
				doGetUserUpdate(request, response);
				break;
			}
			case "/admin/video-ctr": {
				doGetVideoCtr(request, response);
				break;
			}
			case "/admin/video-update": {
				doGetVideoUpdate(request, response);
				break;
			}
			case "/admin/user-update/edit": {
				doGetUserUpdateEdit(request, response);
				break;
			}
			case "/admin/video-update/edit": {
				doGetVideoUpdateEdit(request, response);
				break;
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		setAccountHeader(req, resp);
		switch (path) {
			case "/admin/index": {
				doGetIndex(req, resp);
				break;
			}
			case "/admin/index/report1":{
				req.setAttribute("message1", "show active");
				req.setAttribute("ms2", "active");
				doGetIndex(req, resp);
				break;
			}
			case "/admin/index/report2":{
				req.setAttribute("message2", "show active");
				req.setAttribute("ms3", "active");
				doGetIndex(req, resp);
				break;
			}
			case "/admin/user-update/create": {
				insertUser(req, resp);
				break;
			}
			case "/admin/user-update/update": {
				updateUser(req, resp);
				break;
			}
			case "/admin/user-update/delete": {
				removeUser(req, resp);
				break;
			}
			case "/admin/video-update/create": {
				insertVideo(req, resp);
				break;
			}
			case "/admin/video-update": {
				getPosterVideo(req, resp);
				break;
			}
			case "/admin/video-update/update": {
				updateVideo(req, resp);
				break;
			}
			case "/admin/video-update/delete": {
				deleteVideo(req, resp);
				break;
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void doGetIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		favoriteReport(request, response);
		getTitleVideo(request, response);
		favoriteUserReport(request, response);
		shareReport(request, response);
		request.getRequestDispatcher("/views/admin/index.jsp").forward(request, response);
	}
	private void doGetUserCtr(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		List<USERS> user = dao.findAll();
		request.setAttribute("users", user);
		request.getRequestDispatcher("/views/admin/user-ctr.jsp").forward(request, response);
	}
	private void doGetUserUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("buttonlog", "hidden");
		request.setAttribute("buttonlog1", "hidden");
		request.getRequestDispatcher("/views/admin/user-update.jsp").forward(request, response);
	}
	private void doGetUserUpdateEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		USERS user = new USERS();
		String uri = request.getRequestURI();
		id = uri.substring(uri.lastIndexOf("/") + 1);
		user = dao.findById(id);
		request.setAttribute("u", user);
		request.setAttribute("loguser", "disabled=\"disabled\"");
		request.setAttribute("buttonnolog", "hidden");
		request.getRequestDispatcher("/views/admin/user-update.jsp").forward(request, response);
	}
	private void doGetVideoCtr(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		List<VIDEO> list = dao.findAll();
		request.setAttribute("videos", list);
		request.getRequestDispatcher("/views/admin/video-ctr.jsp").forward(request, response);
	}
	private void doGetVideoUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("log_btn", "hidden");
		request.getRequestDispatcher("/views/admin/video-update.jsp").forward(request, response);
	}
	private void doGetVideoUpdateEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		VIDEO video = new VIDEO();
		String uri = request.getRequestURI();
		String idVideo = uri.substring(uri.lastIndexOf("/") + 1);
		VideoId = idVideo;
		video = dao.findById(idVideo);
		request.setAttribute("videoid", "disabled=\"disabled\"");
		request.setAttribute("videoid2", "readonly=\"readonly\"");
		request.setAttribute("log_btnThem", "hidden");
		request.setAttribute("img", video);
		request.setAttribute("video", video);
		request.getRequestDispatcher("/views/admin/video-update.jsp").forward(request, response);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	


	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (checkFormUserAdminServlet(request, response)) {
			try {
				USERS entity = new USERS();
				UserDAO dao = new UserDAO();
				BeanUtils.populate(entity, request.getParameterMap());
				dao.create(entity);
				request.setAttribute("message", "Thêm thành công!");
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi Thêm!");
			}
		}
		request.setAttribute("loguser", "");
		request.setAttribute("buttonlog", "hidden");
		request.setAttribute("buttonlog1", "hidden");
		request.getRequestDispatcher("/views/admin/user-update.jsp").forward(request, response);
	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		USERS user = dao.findById(id);
		try {
			BeanUtils.populate(user, request.getParameterMap());
			dao.update(user);
			request.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			request.setAttribute("message", "Lỗi cập nhật!");
		}
		request.setAttribute("u", user);
		request.setAttribute("loguser", "disabled=\"disabled\"");
		request.setAttribute("buttonnolog", "hidden");
		request.getRequestDispatcher("/views/admin/user-update.jsp").forward(request, response);
	}
	private void removeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		if (id != null) {
			try {
				dao.remove(id);
				request.setAttribute("message", "Xóa thành công!");
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi xóa!");
			}
		}
		request.setAttribute("buttonnolog", "hidden");
		request.getRequestDispatcher("/views/admin/user-update.jsp").forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void insertVideo(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    VIDEO entity = new VIDEO();
	    if (checkFormVideoUpdate(request, response)) {
	        try {
	            BeanUtils.populate(entity, request.getParameterMap());
	            entity.setPoster("/templates/user/img2/" + UploadUtils.processUploadFiled("photo_file", request,
	                    "/templates/user/img2/", entity.getId()));

	            VideoDAO dao = new VideoDAO();
	            dao.create(entity);

	            // Tìm video vừa tạo theo ID để có được video2
	            VIDEO video2 = dao.findById(entity.getId());

	            request.setAttribute("img", video2);
	            request.setAttribute("video", video2); 
	            request.setAttribute("message", "Thêm video " + entity.getId() + " thành công!");
	        } catch (Exception e) {
	            System.out.println(e);
	            request.setAttribute("message", "Lỗi Thêm!");
	        }
	    }
	    request.setAttribute("log_btn", "hidden");
	    request.getRequestDispatcher("/views/admin/video-update.jsp").forward(request, response);
	}

	private void updateVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			VideoDAO dao = new VideoDAO();
			VIDEO video = dao.findById(VideoId);
			VIDEO video2 = dao.findById(VideoId);
			BeanUtils.populate(video2, request.getParameterMap());
			if (request.getPart("photo_file").getSize() == 0) {
				video2.setPoster(video.getPoster());
			} else {
				video2.setPoster("/templates/user/img2/" + UploadUtils.processUploadFiled("photo_file", request,"/templates/user/img2/", video.getId()));
			}
			dao.update(video2);
			request.setAttribute("img", video2);
			request.setAttribute("video", video2);
			request.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			request.setAttribute("message", "Lỗi cập nhật!");
		}
		request.setAttribute("videoid", "disabled=\"disabled\"");
		request.setAttribute("videoid2", "readonly=\"readonly\"");
		request.setAttribute("log_btnThem", "hidden");
		request.getRequestDispatcher("/views/admin/video-update.jsp").forward(request, response);
	}
	private void deleteVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		if (VideoId != null) {
			try {
				dao.remove(VideoId);
				request.setAttribute("message", "Xóa thành công!");
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi xóa!");
			}
		}
		request.setAttribute("log_btnThem", "hidden");
		request.getRequestDispatcher("/views/admin/video-update.jsp").forward(request, response);
	}
	//Upload ảnh
	private void getPosterVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("log_btn", "hidden");
		File dir = new File(request.getServletContext().getRealPath("/files"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Part photo = request.getPart("photo_file");
		File photoFile = new File(dir, photo.getSubmittedFileName());
		photo.write(photoFile.getAbsolutePath());
		if (photo.getSize() > 0) {
			request.setAttribute("log_poster", "hidden");
			request.setAttribute("log2img", "hidden");
			request.setAttribute("img", photoFile);
			request.getRequestDispatcher("/views/admin/video-update.jsp").forward(request, response);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void favoriteReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 ReportDAO dao = new ReportDAO();
		 List<REPORT> list = dao.favoriteReport();
		 List<Long> countUser = dao.getCountUser();
		 List<Long> countVideo = dao.getCountVideo();
		 List<Long> countViews = dao.getCountViews();
		 List<Long> countLike = dao.getLikeCount();
		 if (list != null && !list.isEmpty()) {
		     request.setAttribute("countUser", countUser.get(0));
		     request.setAttribute("countVideo", countVideo.get(0));
		     request.setAttribute("countViews", countViews.get(0));
		     request.setAttribute("countLike", countLike.get(0));
		     request.setAttribute("videos", list);
		    }
		 else {
		     request.setAttribute("countUser", countUser.get(0));
			 request.setAttribute("countVideo", "0");
		     request.setAttribute("countViews", "0");
		     request.setAttribute("countLike", "0");
		 }
	}
	private void getTitleVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteDAO dao = new FavoriteDAO();
		List<String> fav = dao.findAllLike();
		if (fav != null) {
			request.setAttribute("sel1", fav);
		}
	}
	private void favoriteUserReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportDAO dao = new ReportDAO();
		List<FAVORITE> list = dao.favoritesUserReport(request);
		if (list != null) {
			request.setAttribute("user", list);
		}
	}
	private void shareReport(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ReportDAO dao = new ReportDAO();
		List<SHARES> list = dao.shareReport(request);
		if (list != null) {
			request.setAttribute("share", list);
		}
	}
}
