package ma.ensa.azz.younes.calendrier.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Evenement  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id_evenemet;
	private String designation;
	private String description;
	private String date_debut;
	private String heure_debut;
	private String heure_fin;
	private String date_fin;
	private boolean notifier;
	private String importance;
	private String type;
	
	@ManyToOne
	@JoinColumn(name="id_utilisateur")
	private Utilisateur utilisateur;
	
	public Evenement() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Evenement(String designation, String description, String date_debut, String heure_debut, String heure_fin,
			String date_fin, boolean notifier, String importance, String type) {
		super();
		this.designation = designation;
		this.description = description;
		this.date_debut = date_debut;
		this.heure_debut = heure_debut;
		this.heure_fin = heure_fin;
		this.date_fin = date_fin;
		this.notifier = notifier;
		this.importance = importance;
		this.type = type;
	}

	public Long getId_evenemet() {
		return id_evenemet;
	}

	public void setId_evenemet(Long id_evenemet) {
		this.id_evenemet = id_evenemet;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate_debut() {
		return date_debut;
	}

	public void setDate_debut(String date_debut) {
		this.date_debut = date_debut;
	}

	public String getHeure_debut() {
		return heure_debut;
	}

	public void setHeure_debut(String heure_debut) {
		this.heure_debut = heure_debut;
	}

	public String getHeure_fin() {
		return heure_fin;
	}

	public void setHeure_fin(String heure_fin) {
		this.heure_fin = heure_fin;
	}

	public String getDate_fin() {
		return date_fin;
	}

	public void setDate_fin(String date_fin) {
		this.date_fin = date_fin;
	}

	public boolean isNotifier() {
		return notifier;
	}

	public void setNotifier(boolean notifier) {
		this.notifier = notifier;
	}

	public String getImportance() {
		return importance;
	}

	public void setImportance(String importance) {
		this.importance = importance;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public Utilisateur getUtilisateur() {
		return utilisateur;
	}


	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
 
	
	

	
	
	
	

}
