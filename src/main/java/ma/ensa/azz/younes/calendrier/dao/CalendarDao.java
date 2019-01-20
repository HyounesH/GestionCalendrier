package ma.ensa.azz.younes.calendrier.dao;

import java.util.List;

import ma.ensa.azz.younes.calendrier.entities.Evenement;
import ma.ensa.azz.younes.calendrier.entities.Utilisateur;


public interface CalendarDao {
	
		public Evenement addEvent(Evenement event);
		public Evenement updateEvent(Evenement event);
		public Evenement getEventById(Long id);
		public List<Evenement> listEvents();
		public void deleteEvent(Long idEvenement);
		
		public Utilisateur addUser(Utilisateur utilisateur);
		public Utilisateur updateUser(Utilisateur utilisateur);
		public List<Utilisateur> listUsers();
		public void deleteUser(Long idUtilisateur);
		
		public List<Utilisateur> login(String email,String password);
		
		public List<Evenement> listEvents(Utilisateur id_utilisateur);

}
