package ma.ensa.azz.younes.calendrier.metier;

import java.util.List;

import ma.ensa.azz.younes.calendrier.entities.Utilisateur;

public interface AdminMetier extends InternauteMetier {
	public Utilisateur addUser(Utilisateur utilisateur);

	public Utilisateur updateUser(Utilisateur utilisateur);

	public List<Utilisateur> listUsers();

	public void deleteUser(Long idUtilisateur);
}
