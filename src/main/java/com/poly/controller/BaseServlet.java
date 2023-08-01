package com.poly.controller;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.UserDAO;
import com.poly.dao.VideoDAO;
import com.poly.entity.USERS;
import com.poly.entity.VIDEO;
public abstract class BaseServlet extends HttpServlet {
    protected void setAccountHeader(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        USERS username = (USERS) req.getSession().getAttribute("user");
        if (username != null) {
            req.setAttribute("account", username.getId());
            req.setAttribute("login_pass", "hidden");
            req.setAttribute("login_no", "");
            if (username.getAdmin()) {
                req.setAttribute("login_admin", "");
            } else {
                req.setAttribute("login_admin", "hidden");
            }
        } else {
            req.setAttribute("account", "Tài khoản");
            req.setAttribute("login_pass", "");
            req.setAttribute("login_no", "hidden");
            req.setAttribute("login_admin", "hidden");
        }
    }
    
    protected boolean checkFormUserAdminServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass = request.getParameter("password");
		String confirmPass = request.getParameter("confirmPass");
		String username = request.getParameter("id");
		String email = request.getParameter("email");
		System.out.println(email);
		 String dinhdangGmail = "^[_A-Za-z0-9-]+@gmail\\.[A-Za-z]{2,}$";
		 String dinhdangHcmute = "^[_A-Za-z0-9-]+@student\\.[A-Za-z]{2,}\\.[A-Za-z]{2,}\\.[A-Za-z]{2,}$";		UserDAO dao = new UserDAO();
		USERS u = dao.findById(username);
		 if (username == null) {
            request.setAttribute("message", "Tên tài khoản không tồn tại!");
            return false;
        }
		if (u != null) {
			request.setAttribute("message1", "Tên tài khoản đã tồn tại!");
			return false;
		}
		if (username.contains(" ") && username.length() < 10) {
			request.setAttribute("message2",
					"Username có độ tài từ 6 đến 10 ký tự, không có khoảng trắng và không dấu!");
			return false;
		}
		if (pass.length() < 6) {
			request.setAttribute("message4", "Vui lòng nhập mật khẩu ít nhất 6 kí tự!");
			return false;
		}

		if (!confirmPass.equals(pass)) {
			request.setAttribute("message3", "Mật khẩu không trùng khớp!");
			return false;
		}
		if (!email.matches(dinhdangGmail)&&!email.matches(dinhdangHcmute)) {
			request.setAttribute("message5", "Định dạng email không hợp lệ!");
			return false;
		}
		return true;

	}
    protected boolean checkFormShareVideoServlet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String method = request.getMethod();
		 String dinhdangGmail = "^[_A-Za-z0-9-]+@gmail\\.[A-Za-z]{2,}$";
		    String dinhdangHcmute = "^[_A-Za-z0-9-]+@student\\.[A-Za-z]{2,}\\.[A-Za-z]{2,}\\.[A-Za-z]{2,}$";

		int count = 0;
		if (method.equalsIgnoreCase("POST")) {
			if (email != null) {
				if (!email.matches(dinhdangGmail) && !email.matches(dinhdangHcmute)) {
					System.out.println(email);
					request.setAttribute("message5", "*Định dạng email không hợp lệ!");
					count = 2;
				} else {
					count = 0;
				}
			} else {
				count = 2;
			}
		}
		if (count == 0) {
			return true;
		} else {
			return false;
		}
	}
    protected boolean checkFormUserAndEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String dinhdangGmail = "^[_A-Za-z0-9-]+@gmail\\.[A-Za-z]{2,}$";
	    String dinhdangHcmute = "^[_A-Za-z0-9-]+@student\\.[A-Za-z]{2,}\\.[A-Za-z]{2,}\\.[A-Za-z]{2,}$";
	    String username = request.getParameter("id");
	    UserDAO dao = new UserDAO();
	    USERS user = dao.findById(username);
	    if (user == null) {
	        request.setAttribute("message", "Username không tồn tại !!");
	        return false;
	    } else if (!email.matches(dinhdangGmail)&&!email.matches(dinhdangHcmute)) {
			request.setAttribute("message5", "Định dạng email không hợp lệ!");
			return false;
		}
	     return true;
	}
    protected boolean checkFormVideoUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String videoId = request.getParameter("id");
		VideoDAO dao = new VideoDAO();
		VIDEO video = dao.findById(videoId);
		if (video != null) {
			request.setAttribute("message6", "Video đã tồn tại!");
			return false;
		}
		return true;

	}

    public static class EmailUtil {
    	public static boolean sendMail( String toEmail, String subject, String body)  {
    		//Thông tin người gửi
    		final String username = "ngoquangnghia111003@gmail.com";
    		final String password = "uwsdszpkyrmgrnbd";
    		//Cấu hình thông tin đăng nhập email gửi
    		Properties props = new Properties();
    		props.put("mail.smtp.auth", "true");
    		props.put("mail.smtp.host", "smtp.gmail.com");
    		props.put("mail.smtp.starttls.enable", "true");
    		props.put("mail.smtp.port", "587");
    		//Tạo phiên làm việc
    		Session session = Session.getInstance(props, new Authenticator() {
    			protected PasswordAuthentication getPasswordAuthentication() {
    				return new PasswordAuthentication(username, password);
    			}
    		});
    		try {
    			// Tạo đối tượng MimeMessage
    			MimeMessage mime = new MimeMessage(session);
    			// Tạo đối tượng Multipart để gửi nội dung email dạng HTML
    			Multipart mailmultipart = new MimeMultipart();
    			// Nội dung text của mail
    			MimeBodyPart bodytext = new MimeBodyPart();
    			bodytext.setText(body, "utf-8", "html");
    			mailmultipart.addBodyPart(bodytext);
    			mime.setContent(mailmultipart);
    			// Thiết lập thông tin người gửi
    			mime.setFrom(new InternetAddress(username));
            	// Thiết lập thông tin người nhận
    			mime.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
    			// Thiết lập tiêu đề email
    			mime.setSubject(subject, "utf-8");
    			// Gửi email
    			Transport.send(mime);
    			return true;
    		} catch (MessagingException e) {
    			e.printStackTrace();
    			return false;
    		}
    	}

    }
    
}
