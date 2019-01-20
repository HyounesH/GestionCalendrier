package ma.ensa.azz.younes.calendrier.metier;

import java.util.List;

import javax.transaction.Transactional;

import ma.ensa.azz.younes.calendrier.dao.CalendarDao;
import ma.ensa.azz.younes.calendrier.entities.Evenement;
import ma.ensa.azz.younes.calendrier.entities.Utilisateur;

@Transactional
public class CalendarMetierImpl implements AdminMetier {

	
	private CalendarDao calendarDao;

	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
	}



	public Evenement addEvent(Evenement event) {
		return calendarDao.addEvent(event);
	}

	public Evenement updateEvent(Evenement event) {
		return calendarDao.updateEvent(event);
	}

	public List<Evenement> listEvents(Utilisateur utilisateur) {
		return calendarDao.listEvents(utilisateur);
	}

	public void deleteEvent(Long idEvenement) {
		calendarDao.deleteEvent(idEvenement);
	}

	public Utilisateur addUser(Utilisateur utilisateur) {
		return calendarDao.addUser(utilisateur);
	}

	public Utilisateur updateUser(Utilisateur utilisateur) {
		return calendarDao.updateUser(utilisateur);
	}

	public List<Utilisateur> listUsers() {
		return calendarDao.listUsers();
	}

	public void deleteUser(Long idUtilisateur) {
		calendarDao.deleteUser(idUtilisateur);
	}

	@Override
	public Evenement getEventById(Long id) {
		// TODO Auto-generated method stub
		return calendarDao.getEventById(id);
	}



	@Override
	public List<Utilisateur> login(String email, String password) {
		return calendarDao.login(email, password);
	}
}
