package com.poly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.controller.BaseServlet.EmailUtil;
import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.entity.USERS;
import com.poly.entity.VIDEO;

@WebServlet({ "/index", "/about", "/contact","/contact/send" })
public class HomeServlet extends BaseServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		setAccountHeader(req, resp);
		switch (path) {
			case "/index": {
				doGetIndex(req, resp);
				break;
			}
			case "/about": {
				doGetAbout(req, resp);
				break;
			}
			case "/contact": {
				doGetContact(req, resp);
				break;
			}
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		setAccountHeader(req, resp);
		if (path.contains("contact")) {
			sendContact(req, resp);
		}
	}
	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		USERS user = (USERS) req.getSession().getAttribute("user");
		VideoDAO dao = new VideoDAO();
		List<VIDEO> video2 = dao.findVideoTop5();
		List<VIDEO> video1 = dao.findVideoTop();
		if (user != null) {
			req.setAttribute("hidden", "");
			List<VIDEO> video3 = dao.findVideoLike(user.getId());
			List<VIDEO> video4 = dao.findVideoShare(user.getId());
			if (!video3.isEmpty()) {
				req.setAttribute("video3", video3);
			}
			if (!video4.isEmpty()) {
				req.setAttribute("video4", video4);
			}
		} else {
			req.setAttribute("hidden", "hidden");
		}
		if (!video2.isEmpty()) {
			req.setAttribute("video2", video2);
		}
		if (!video1.isEmpty()) {
			req.setAttribute("video1", video1);
		}
		req.getRequestDispatcher("/views/user/index/index.jsp").forward(req, resp);
	}
	private void doGetAbout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/index/about.jsp").forward(req, resp);
	}
	private void doGetContact(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/user/index/contact.jsp").forward(req, resp);
	}	
	private void sendContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (checkFormUserAndEmail(request, response) == true) {
			sendMail(request, response);
		} else {
			doGetContact(request, response);
		}	
	}
	protected void sendMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("id");
		String toEmail = request.getParameter("email");
		String message = request.getParameter("message");
		UserDAO dao = new UserDAO();
		USERS user = dao.findById(name);
		String subject = "PolyTube - Thông báo - Người dùng " + user.getId() + " vừa mới gửi góp ý đến bạn";
		String body = "Phản hồi, góp ý của người dùng: " + message;
        boolean emailSent = EmailUtil.sendMail(toEmail, subject, body);
        if(emailSent) {
            request.setAttribute("message", "Gửi email thành công !!!");
    		request.getRequestDispatcher("/views/user/index/contact.jsp").forward(request, response);
        }
        else {
        	request.setAttribute("message", "Gửi email thất bại !!!");
    		request.getRequestDispatcher("/views/user/index/contact.jsp").forward(request, response);
        }
	}
}
