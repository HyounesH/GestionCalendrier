package ma.ensa.azz.younes.calendrier.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ma.ensa.azz.younes.calendrier.entities.Evenement;
import ma.ensa.azz.younes.calendrier.entities.Mois;
import ma.ensa.azz.younes.calendrier.entities.Utilisateur;
import ma.ensa.azz.younes.calendrier.metier.InternauteMetier;

@Controller
@Scope("session")
public class MainController {
	private static int an = 2018;
	private static int m = 5;
	@Autowired
	private InternauteMetier metier;

	@RequestMapping("/calendar")
	public String index(Model model, HttpSession session, Evenement event) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		Mois mois = new Mois(m, an);
		model.addAttribute("m", m);
		model.addAttribute("a", an);
		model.addAttribute("mois", mois.toString());
		model.addAttribute("weeks", mois.getweeks());
		model.addAttribute("weekDays", mois.getWeekDays());
		model.addAttribute("startingDay", mois.getSundayNumber());
		model.addAttribute("numDayOfMonth", mois.numDayOfMonth(mois.getMois() - 1));
		model.addAttribute("events", metier.listEvents(user));
		model.addAttribute("event", new Evenement());
		return "index";
	}

	@RequestMapping("/calendar/next")
	public String next(Model model, HttpSession session, Evenement event) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		m = m + 1;
		if (m > 12) {
			m = 1;
			an = an + 1;
		}
		Mois mois = new Mois(m, an);
		model.addAttribute("mois", mois.toString());
		model.addAttribute("weeks", mois.getweeks());
		model.addAttribute("weekDays", mois.getWeekDays());
		model.addAttribute("startingDay", mois.getSundayNumber() - 1);
		model.addAttribute("numDayOfMonth", mois.numDayOfMonth(mois.getMois() - 1));
		model.addAttribute("events", metier.listEvents(user));
		model.addAttribute("event", new Evenement());
		return "index";
	}

	@RequestMapping("/calendar/previous")
	public String previous(Model model, HttpSession session, Evenement event) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		m = m - 1;
		if (m < 1) {
			m = 12;
			an = an - 1;
		}
		Mois mois = new Mois(m, an);
		model.addAttribute("mois", mois.toString());
		model.addAttribute("weeks", mois.getweeks());
		model.addAttribute("weekDays", mois.getWeekDays());
		model.addAttribute("startingDay", mois.getSundayNumber() - 1);
		model.addAttribute("numDayOfMonth", mois.numDayOfMonth(mois.getMois() - 1));
		model.addAttribute("events", metier.listEvents(user));
		model.addAttribute("event", new Evenement());
		return "index";
	}

	@RequestMapping("/calendar/event/{id}")
	public String event(Model model, @PathVariable Long id) {
		Evenement e = metier.getEventById(id);
		model.addAttribute("event", e);
		return "eDetails";

	}

	@RequestMapping("/calendar/event/suppr/{id}")
	public String SuppEvent(Model model, @PathVariable Long id, HttpSession session) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		metier.deleteEvent(id);

		model.addAttribute("events", metier.listEvents(user));
		return "eList";
	}

	@RequestMapping("/calendar/event/updateEvent")
	public String updateEvent(Model model, @ModelAttribute("user") Evenement event, HttpSession session) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		event.setUtilisateur(user);
		metier.updateEvent(event);
		model.addAttribute("events", metier.listEvents(user));
		return "eList";
	}

	@RequestMapping("/calendar/event/list")
	public String listEvent(Model model, HttpSession session) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");

		model.addAttribute("events", metier.listEvents(user));
		return "eList";
	}

	@RequestMapping("/calendar/addEvent")
	public String addEvent(Model model, Evenement event) {
		model.addAttribute("event", new Evenement());
		return "newEvent";
	}

	@RequestMapping("/calendar/newEvent")
	public String newEvent(Model model, HttpSession session, @ModelAttribute("event") Evenement event) {
		Utilisateur user = (Utilisateur) session.getAttribute("user");
		event.setUtilisateur(user);
		metier.addEvent(event);
		Mois mois = new Mois(m, an);
		model.addAttribute("m", m);
		model.addAttribute("a", an);
		model.addAttribute("mois", mois.toString());
		model.addAttribute("weeks", mois.getweeks());
		model.addAttribute("weekDays", mois.getWeekDays());
		model.addAttribute("startingDay", mois.getSundayNumber());
		model.addAttribute("numDayOfMonth", mois.numDayOfMonth(mois.getMois() - 1));
		model.addAttribute("events", metier.listEvents(user));
		model.addAttribute("event", new Evenement());
		return "index";
	}
}
