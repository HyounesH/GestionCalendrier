package ma.ensa.azz.younes.calendrier.metier;

import java.util.List;

import ma.ensa.azz.younes.calendrier.entities.Evenement;
import ma.ensa.azz.younes.calendrier.entities.Utilisateur;

public interface InternauteMetier {
	public Evenement addEvent(Evenement event);

	public Evenement updateEvent(Evenement event);

	public List<Evenement> listEvents(Utilisateur id_utilisateur);
	public Evenement getEventById(Long id);
	public void deleteEvent(Long idEvenement);
	public List<Utilisateur> login(String email,String password);
	
}
