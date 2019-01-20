package ma.ensa.azz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import ma.ensa.azz.younes.calendrier.entities.Evenement;
import ma.ensa.azz.younes.calendrier.entities.Mois;
import ma.ensa.azz.younes.calendrier.entities.Utilisateur;
import ma.ensa.azz.younes.calendrier.metier.AdminMetier;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("user")
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private AdminMetier metier;
	
	private static int an = 2018;
	private static int m = 5;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home(Model model,Utilisateur utilisateur) {
		return "home";
		
	}
	@RequestMapping("/login")
	public String login(Model model,Utilisateur utilisateur) {
     List<Utilisateur> users=metier.login(utilisateur.getEmail(), utilisateur.getPass());
     System.out.println(utilisateur.getEmail());
     if(users.size()==0) {
    	 model.addAttribute("resultat", "Login Fail !");
    	 return "home";
     }
     model.addAttribute("user", users.get(0));
        Mois mois = new Mois(m, an);
		model.addAttribute("m",m);
		model.addAttribute("a", an);
		model.addAttribute("mois", mois.toString());
		model.addAttribute("weeks", mois.getweeks());
		model.addAttribute("weekDays", mois.getWeekDays());
		model.addAttribute("startingDay", mois.getSundayNumber());
		model.addAttribute("numDayOfMonth", mois.numDayOfMonth(mois.getMois() - 1));
		model.addAttribute("events",metier.listEvents(users.get(0)));
		model.addAttribute("event",new Evenement());
	return "index";
	}
	@RequestMapping("/saveUser")
	public String saveUser(Model model ,Utilisateur utilisateur) {
		utilisateur.setDate_creation(new Date());
		metier.addUser(utilisateur);
		model.addAttribute("user", utilisateur);
		Mois mois = new Mois(m, an);
		model.addAttribute("m",m);
		model.addAttribute("a", an);
		model.addAttribute("mois", mois.toString());
		model.addAttribute("weeks", mois.getweeks());
		model.addAttribute("weekDays", mois.getWeekDays());
		model.addAttribute("startingDay", mois.getSundayNumber());
		model.addAttribute("numDayOfMonth", mois.numDayOfMonth(mois.getMois() - 1));
		model.addAttribute("events",metier.listEvents(utilisateur));
		model.addAttribute("event", new Evenement());
		return "index";
	}
	
}
