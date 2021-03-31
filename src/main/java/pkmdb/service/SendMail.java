/**
 * 
 */
package pkmdb.service;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 * @author Admin
 *
 */
public class SendMail {
	public static void sendMail(String nguoiNhan, String verifyCode, String username) 
    {
        //Thiết lập mail server
        Properties properties = new Properties();
        
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String myEmail = "thanh.navi17@gmail.com";
        String pass = "baochiii";
        //Mail session
        Session session = Session.getInstance(properties, new Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmail,pass);
            } 
        });
        
        Message message = prepareMessage(session, myEmail,nguoiNhan,verifyCode,username);
        
        try {
            //Gửi mail
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Gửi mail thành công");
    }
    
	private static Message prepareMessage(Session session, String myEmail, String nguoiNhan, String verifyCode,
			String username) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(nguoiNhan));
			message.setSubject("Verify your account");
			message.setText(
					"Thank you for registering for PokéBase Pokémon Answers. \n Please click below to confirm your email address. \n http://localhost:8080/PokemonDatabase/pokebase/confirm/"
							+ verifyCode + "&" + username);
			return message;
		} catch (Exception e) {
			Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, e);
		}
		return null;
	}

}
