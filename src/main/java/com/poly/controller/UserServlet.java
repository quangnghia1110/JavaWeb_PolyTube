package com.poly.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import com.poly.dao.UserDAO;
import com.poly.entity.USERS;
@WebServlet({ "/login", "/logout", "/register", "/forgotPassword", "/changePassword", "/editAccount", "/verifi-code" })
public class UserServlet extends BaseServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
			case "/login": {
				doGetLogin(request, response);
				break;
			}
			case "/logout": {
				doGetLogout(request, response);
				break;
			}
			case "/register": {
				doGetRegister(request, response);
				break;
			}
			case "/forgotPassword": {
				doGetForgotPass(request, response);
				break;
			}
			case "/changePassword": {
				doGetChangePass(request, response);
				break;
			}
			case "/editAccount": {
				doGetEditAccount(request, response);
				break;
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRequestURI();
		String method = request.getMethod();

		if (path.contains("login")) {
			if (method.equalsIgnoreCase("POST")) {
				login(request, response);
			}
		} else if (path.contains("editAccount")) {
				editAccount(request, response);
		} else if (path.contains("register")) {
			if (method.equalsIgnoreCase("POST")) {
				register(request, response);
			}
		} else if (path.contains("changePassword")) {
				changePassword(request, response);
		} else if (path.contains("forgotPassword")) {
			forgotPass(request, response);
		}
	}
	
	
	
	
	
	
	
	
	
	
	private void doGetLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/user/login/login.jsp").forward(request, response);
	}
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("username");
		String pass = request.getParameter("password");
		int count = 0;
		try {
			UserDAO dao = new UserDAO();
			USERS user = dao.findById(id);
			if (id.isEmpty() || pass.isEmpty()) {
				request.getSession().setAttribute("user", null);
			}
			if (!user.getPassword().equals(pass)) {
				request.setAttribute("message_pass", "Sai mật khẩu!");
			} else {
				request.setAttribute("message_username", "Đăng nhập thành công!");
				request.getSession().setAttribute("user", user);
				count = 1;
			}
		} catch (Exception e) {
			request.setAttribute("message_username", "Sai tên đăng nhập!");
		}
		if (count == 1) {
			response.sendRedirect("index");
		} else {
			request.getRequestDispatcher("/views/user/login/login.jsp").forward(request, response);
		}
	}
	
	
	


	
	
	
	
	
	private void doGetLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("like");
		response.sendRedirect("index");
	}
	
	
	
	
	
	
	
	
	
	
	private void doGetRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/user/login/register.jsp").forward(request, response);
	}
	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		int count = 0;
		if (checkFormUserAdminServlet(request, response)) {
			try {
				USERS entity = new USERS();
				BeanUtils.populate(entity, request.getParameterMap());
				dao.create(entity);
				request.setAttribute("message", "Đăng ký thành công!");
				count = 1;
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi đăng ký!");
			}
		}
		if (count == 0) {
			request.getRequestDispatcher("/views/user/login/register.jsp").forward(request, response);
		} else {
			response.sendRedirect("login");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void doGetForgotPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/user/login/forgotPassword.jsp").forward(request, response);
	}
	private void forgotPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (checkFormUserAndEmail(request, response) == true) {
			sendMail(request, response);
		} else {
			doGetForgotPass(request, response);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	private void doGetChangePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		changePassword(request, response);
	}
	private void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		String pass_old = request.getParameter("old_pass");
		String new_pass = request.getParameter("password");
		String confirmPass = request.getParameter("pass_confirm");
		int count = 0;
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			if (user != null && !user.getPassword().equals(pass_old)) {
				System.out.println("Mat khau cu sai");
				request.setAttribute("messsage1", "Mật khẩu cũ ko trùng khớp!");
			}else if (new_pass.length() < 6) {
				request.setAttribute("messsage2", "Mật khẩu phải có tối thỉu 6 ký tự !");
			}  else if (!new_pass.equals(confirmPass)) {
				System.out.println("Mat khau ko trung khop");
				request.setAttribute("messsage3", "Mật khẩu không trùng khớp !");
			} else {
				try {
					BeanUtils.populate(user, request.getParameterMap());
					UserDAO dao = new UserDAO();
					dao.update(user);
					request.setAttribute("message", "Đổi mật khẩu thành công!");
					count = 1;
				} catch (Exception e) {
					request.setAttribute("message", "Lỗi!");
				}
			}
		}
		if (count == 0) {
			request.getRequestDispatcher("/views/user/login/changePassword.jsp").forward(request, response);
		} else {
			response.sendRedirect("index");
		}
	}
	
	
	
	
	
	
	
	
	
	private void doGetEditAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		editAccount(request, response);
	}
	private void editAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		USERS user = (USERS) request.getSession().getAttribute("user");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {	
			try {
				BeanUtils.populate(user, request.getParameterMap());
				UserDAO dao = new UserDAO();
				dao.update(user);
				request.setAttribute("message", "Cập nhật tài khoản thành công!");
			} catch (Exception e) {
				request.setAttribute("message", "Lỗi cập nhật tài khoản!");
			}
		}
		request.getRequestDispatcher("/views/user/login/editAccount.jsp").forward(request, response);
	}
	
	
	
	
	
	
	
	
	protected void sendMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Thông tin người nhận lấy từ jsp
		String toEmail = request.getParameter("email");
		String name = request.getParameter("id");
		UserDAO dao = new UserDAO();
		USERS user = dao.findById(name);
		String subject = "PolyTube - Thông báo lấy lại mật khẩu ";
		String body = "Người dùng có mã: " + user.getId()+". Vừa yêu cầu lấy lại mật khẩu tại website Poytube. Mật khẩu hiện tại của bạn là: "  + user.getPassword();
        boolean emailSent = EmailUtil.sendMail(toEmail, subject, body);
        if(emailSent) {
            request.setAttribute("message", "Gửi email thành công !!!");
    		request.getRequestDispatcher("/views/user/login/forgotPassword.jsp").forward(request, response);
        }
        else {
        	request.setAttribute("message", "Gửi email thất bại !!!");
    		request.getRequestDispatcher("/views/user/login/forgotPassword.jsp").forward(request, response);
        }
	}
	


	
}
