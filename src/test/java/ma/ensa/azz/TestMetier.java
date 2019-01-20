package ma.ensa.azz;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import ma.ensa.azz.younes.calendrier.entities.Utilisateur;
import ma.ensa.azz.younes.calendrier.metier.AdminMetier;

public class TestMetier {

	@Test
	public void test() {
		try {
			ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"calendarContext.xml"});
			AdminMetier metier=(AdminMetier) context.getBean("metier");
			List<Utilisateur> users=metier.listUsers();
			int n1=users.size();
			Utilisateur user=new Utilisateur("0712321452","younes.hamdane11@gmail.com", "123456", "hamdane", "younes","YoAZ", new Date());
			metier.addUser(user);
			int n2=metier.listUsers().size();
			assertEquals(n1+1, n2);
		}catch(Exception e) {
			assertTrue(e.getMessage(), false);
		}
	}
	
	@Test
	public void test2() {
		try {
			ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"calendarContext.xml"});
			AdminMetier metier=(AdminMetier) context.getBean("metier");
			List<Utilisateur> users=metier.listUsers();
			int n1=users.size();
			Long id_utilisateur=(long) 4;
			metier.deleteUser(id_utilisateur);
			int n2=metier.listUsers().size();
			assertEquals(n1-1, n2);
		}catch(Exception e) {
			assertTrue(e.getMessage(), false);
		}
	}
	

}
