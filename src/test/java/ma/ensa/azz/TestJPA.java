package ma.ensa.azz;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestJPA {

	@Test
	public void test() {
		try {
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext(new String[]{"calendarContext.xml"});
		assertTrue(true);
	}catch(Exception e) {
		assertTrue(e.getMessage(), false);
	}
		
	}

}
