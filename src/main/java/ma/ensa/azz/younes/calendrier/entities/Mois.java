package ma.ensa.azz.younes.calendrier.entities;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Mois {
	private int mois;
	private int annee;
	private String listMois[]={"Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"};
	private String weekDays[]= {"Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"};
	public Mois() {
		super();
		// TODO Auto-generated constructor stub
		Date date=new Date();
		this.mois=date.getMonth()+1;
		this.annee=Integer.parseInt(new SimpleDateFormat("yyyy").format(date));
	}
	public Mois(int mois, int annee) {
		super();
		int currentYear=new Date().getYear();
		if(mois<1 || mois>12) {
			try {
				throw new Exception("le mois dois être entre 1 et 12");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}
		if(annee<1970 || annee>currentYear) {
			try {
				throw new Exception("l'année dois être supérieur à 1970");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		this.mois = mois;
		this.annee = annee;
	}
	public int getMois() {
		return mois;
	}
	public void setMois(int mois) {
		this.mois = mois;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	public String toString() {
		return listMois[this.mois-1]+" "+this.annee;
	}
	public int  getweeks() {
		Calendar debut=new GregorianCalendar();
		debut.set(Calendar.YEAR, this.annee);
		debut.set(Calendar.MONTH, this.mois);
		debut.set(Calendar.DAY_OF_MONTH,1);
		debut.add(Calendar.MONTH, 1);
		debut.add(Calendar.DAY_OF_MONTH,-1);
		int weeks=debut.get(Calendar.WEEK_OF_MONTH);
		return weeks;
	}
	
	public int numDayOfMonth(int mois) {
		Calendar cal=new GregorianCalendar();
		cal.set(Calendar.YEAR, this.annee);
		cal.set(Calendar.MONTH, mois);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	public int getFirstDay() {
		Calendar cal=new GregorianCalendar();
		cal.set(Calendar.YEAR, this.annee);
		cal.set(Calendar.MONTH,this.mois-1);
		cal.set(Calendar.DAY_OF_MONTH,1);
		int fd=cal.get(Calendar.DAY_OF_WEEK);
		return fd;
	}
	public int getSundayNumber() {
		int previousMonth=this.mois-2;
		if(previousMonth<0) previousMonth+=12;
		int numOfDaysPM=this.numDayOfMonth(previousMonth);
		int x=0;
		if(getFirstDay()==2) x=1;
		else x=numOfDaysPM+3-getFirstDay();
		return x;
	}
	public String[] getWeekDays() {
		return weekDays;
	}
	
	
}
