package trip.two.reap.member.mail;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	// JavaMailSender : Java Mail API의 MimeMessage를 이용하여 메일 발송 
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	// 생성자
	public MailHandler() { }
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException { 
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		
		// mimeMessage, multipart, encoding
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	
	// 제목
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}
	
	
	// 메일 내용
	public void setText(String htmlContent) throws MessagingException {
		// html 형식 : true
		messageHelper.setText(htmlContent, true);
	}
	
	
	// 보내는 사람
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email,name);
	}
	
	
	// 받는 사람
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}
	
	
	// 이미지 삽입
	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}
	
	
	// 발송
	public void send() {
		mailSender.send(message);
	}

} // 클래스 종료
