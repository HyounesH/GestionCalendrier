package ma.ensa.azz.younes.calendrier.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.context.annotation.Scope;

@Entity
@Scope("session")
public class Utilisateur implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id_utilisateur;
	private String telephone;
	private String email;
	private String pass;
	private String nom;
	private String prenom;
	private String calendrier;
	private Date date_creation;
	
	@OneToMany(mappedBy="utilisateur")
	private List<Evenement> evenemets=new ArrayList<Evenement>();
	
	public Utilisateur() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Utilisateur(String telephone, String email, String pass, String nom, String prenom, String calendrier,
			Date date_creation) {
		super();
		this.telephone = telephone;
		this.email = email;
		this.pass = pass;
		this.nom = nom;
		this.prenom = prenom;
		this.calendrier = calendrier;
		this.date_creation = new Date();
	}


	public String getCalendrier() {
		return calendrier;
	}


	public void setCalendrier(String calendrier) {
		this.calendrier = calendrier;
	}


	public Date getDate_creation() {
		return date_creation;
	}


	public void setDate_creation(Date date_creation) {
		this.date_creation = date_creation;
	}


	public Long getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(Long id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}


	public List<Evenement> getEvenemets() {
		return evenemets;
	}


	public void setEvenemets(List<Evenement> evenemets) {
		this.evenemets = evenemets;
	}
    

    
	
	
	
	
	
	
	

}
