package ma.ensa.azz.younes.calendrier.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ma.ensa.azz.younes.calendrier.entities.Evenement;
import ma.ensa.azz.younes.calendrier.entities.Utilisateur;

public  class CalendarDaoImpl implements CalendarDao {
	
	@PersistenceContext
	private EntityManager em;



	@Override
	public Evenement addEvent(Evenement event) {
		em.persist(event);
		return event;
	}

	@Override
	public Evenement updateEvent(Evenement event) {
		return em.merge(event);
	}

	@Override
	public List<Evenement> listEvents() {
		Query query=em.createQuery("SELECT e FROM Evenement e");
		return query.getResultList();
	}

	@Override
	public void deleteEvent(Long idEvenement) {
		Evenement e=em.find(Evenement.class, idEvenement);
		em.remove(e);
		
	}

	@Override
	public Utilisateur addUser(Utilisateur utilisateur) {
		em.persist(utilisateur);
		return utilisateur;
	}

	@Override
	public Utilisateur updateUser(Utilisateur utilisateur) {
		// TODO Auto-generated method stub
		return em.merge(utilisateur);
	}

	@Override
	public List<Utilisateur> listUsers() {
	    Query q=em.createQuery("SELECT u FROM Utilisateur u");
		return q.getResultList();
	}

	@Override
	public void deleteUser(Long idUtilisateur) {
		Utilisateur u=em.find(Utilisateur.class, idUtilisateur);
		em.remove(u);
		
	}

	@Override
	public Evenement getEventById(Long id) {
		return em.find(Evenement.class, id);
		
	}

	@Override
	public List<Utilisateur> login(String email, String pass) {
		Query q=em.createQuery("SELECT u FROM Utilisateur u WHERE u.email=:email AND u.pass=:pass");
		q.setParameter("email", email);
		q.setParameter("pass", pass);
		return q.getResultList();
	}

	@Override
	public List<Evenement> listEvents(Utilisateur utilisateur) {
		Query q=em.createQuery("SELECT e FROM Evenement e WHERE e.utilisateur.id_utilisateur =:id");
		q.setParameter("id", utilisateur.getId_utilisateur());
		return q.getResultList();
	}

}
