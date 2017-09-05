package com.bohechina.iotsystem.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.LoginUser;
import com.bohechina.iotsystem.model.StudentInfo;
import com.bohechina.iotsystem.model.TeacherInfo;
import com.bohechina.iotsystem.service.StudentService;
import com.bohechina.iotsystem.service.TeacherInfoService;
/**
 * 通用Controller
 * @author jeffddjt
 *
 */
@Controller
public class Common {

	@Resource(name="teacherInfoService")
	private TeacherInfoService teacherInfoService;
	@Resource(name="studentService")
	private StudentService studentService;
	
	@RequestMapping("/LoginCheck")
	@ResponseBody
	public String loginCheck(HttpServletRequest request){
		StringBuffer sb=new StringBuffer();
		sb.append("<script>");
		sb.append("top.location.href='"+request.getContextPath()+"/Login'");
		sb.append("</script>");
		return sb.toString();
		
	}
	
	/**
	 * 生成验证码Controller
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping("/VerifyCode")
	public void VerifyCode(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		String verifyCode = CreateCode(4);
		HttpSession session = req.getSession(); 
		session.setAttribute("code", verifyCode);
		resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);
		resp.setContentType("image/jpeg");
		ServletOutputStream sos = resp.getOutputStream();
		ImageIO.write(getImage(verifyCode), "jpeg", sos);
		sos.close();
	}

	/**
	 * 登陆验证Controller
	 * @param loginUser
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/LoginVerify", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String LoginVerify(LoginUser loginUser,HttpServletRequest request) {
		HttpSession session=request.getSession();
		String code=(String) session.getAttribute("code");
		if(!loginUser.getVerifycode().toLowerCase().equals(code.toLowerCase()))
			return "0|验证码不正确!";
		
		session.setAttribute("loginUser", loginUser);
		
		switch (loginUser.getRole()){
			case "Teacher":
				TeacherInfo teacherInfo=teacherInfoService.verify(loginUser);
				if(teacherInfo!=null){
					session.setAttribute("user", teacherInfo);
					//session.setMaxInactiveInterval(-1);
					return "1|Teacher";
				}
				else 
					return "0|用户名密码错误!";
			case "Student":
				StudentInfo student=studentService.verify(loginUser);
				if(student!=null){
					session.setAttribute("user", student);
					//session.setMaxInactiveInterval(-1);
					return "1|Student";
				}
				else
					return "0|用户名或密码错误!";
		}
		
		return "0|用户名或密码错误！";
	}

	/**
	 * 登陆页面Controller
	 * @return
	 */
	@RequestMapping("/Login")
	public String Login(){
		return "login";		
	}
	
	/**
	 * 首页页面Controller
	 * @return
	 */
	@RequestMapping("/")
	public String Index(){
		return "login";
	}
	
	/**
	 * 教师登陆后首页页面Controller
	 * @return
	 */
	@RequestMapping("/Teacher")
	public String Teacher() {
		return "Teacher/index";
	}
	
	/**
	 * 教师登陆后首页右侧页面Controller
	 * @return
	 */
	@RequestMapping("/Teacher/Main")
	public String teacherMain(){
		return "Teacher/Main";
	}

	/**
	 * 学生登陆后主页Controller
	 * @return
	 */
	@RequestMapping("/Student")
	public String student(){
		return "Student/index";
	}
	
	/**
	 * 学生登陆后首页右侧页面Controller
	 * @return
	 */
	@RequestMapping("/Student/Main")
	public String studentMain(){
		return "Student/Main";
	}
	
	/**
	 * 用户注销登陆Controller
	 * @param request
	 * @return
	 */
	@RequestMapping("/Logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	/**
	 * 验证码图片生成方法
	 * @param code
	 * @return
	 */
	private BufferedImage getImage(String code) {
		int width = 70;
		int height = 40;
		BufferedImage buffImg = new BufferedImage(width, 40,
				BufferedImage.TYPE_INT_RGB);
		Graphics gd = buffImg.getGraphics();
		Random random = new Random();
		gd.setColor(Color.WHITE);
		gd.fillRect(0, 0, width, height);
		Font font = new Font("微软雅黑", Font.BOLD, 20);
		gd.setFont(font);
		gd.setColor(new Color(250, 226, 100));
		gd.drawRect(0, 0, width - 1, height - 1);

		for (int i = 0; i < 12; i++) {
			int x1 = random.nextInt(width);
			int y1 = random.nextInt(height);
			int x2 = random.nextInt(width);
			int y2 = random.nextInt(height);
			gd.setColor(new Color(random.nextInt(255), random.nextInt(255),
					random.nextInt(255)));
			gd.drawLine(x1, y1, x2, y2);
		}

		for (int i = 0; i < code.length(); i++) {
			int red = random.nextInt(192);
			int green = random.nextInt(192);
			int blue = random.nextInt(192);
			gd.setColor(new Color(red, green, blue));

			gd.drawString(String.valueOf(code.charAt(i)), i  * 15+5 , 25);
		}

		return buffImg;
	}

	/**
	 * 随机验证码生成方法
	 * @param count
	 * @return
	 */
	private String CreateCode(int count) {
		char[] codeSequence = {'0','1', '2', '3', '4','5', '6', '7', '8', '9' };
		Random random = new Random();
		String code = "";
		for (int i = 0; i < count; i++) {
			code += String.valueOf(codeSequence[random
					.nextInt(codeSequence.length)]);
		}
		return code;
	}
	

}
