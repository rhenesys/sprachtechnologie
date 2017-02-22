package start;

import java.util.LinkedList;
import java.util.List;

public class Kategorie {

	private String traeger;
	private String strasse;
	private String nummer;
	private int plz;
	private String ansprechpartner;
	private String tel_ansprechpartner;
	private String website;
	private String kommentar;
	private String tags;
	private List<String> tagsZerlegung;

	public Kategorie(String traeger, String strasse, String nummer, int plz, String ansprechpartner,
			String tel_ansprechpartner, String website, String kommentar, String tags) {
		this.setTraeger(traeger);
		this.setStrasse(strasse);
		this.setNummer(nummer);
		this.setPlz(plz);
		this.setAnsprechpartner(ansprechpartner);
		this.setTel_ansprechpartner(tel_ansprechpartner);
		this.setWebsite(website);
		this.setKommentar(kommentar);
		this.setTags(tags);
		tagsZerlegung = new LinkedList<String>();
		
	}

	public String getTags()
	{
		return tags;
	}
	
	public void setTags(String tags)
	{
		this.tags = tags;
	}
	
	public String getTraeger() {
		return traeger;
	}

	public void setTraeger(String traeger) {
		this.traeger = traeger;
	}

	public String getStrasse() {
		return strasse;
	}

	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}

	public String getNummer() {
		return nummer;
	}

	public void setNummer(String nummer) {
		this.nummer = nummer;
	}

	public int getPlz() {
		return plz;
	}

	public void setPlz(int plz) {
		this.plz = plz;
	}

	public String getAnsprechpartner() {
		return ansprechpartner;
	}

	public void setAnsprechpartner(String ansprechpartner) {
		this.ansprechpartner = ansprechpartner;
	}

	public String getTel_ansprechpartner() {
		return tel_ansprechpartner;
	}

	public void setTel_ansprechpartner(String tel_ansprechpartner) {
		this.tel_ansprechpartner = tel_ansprechpartner;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getKommentar() {
		return kommentar;
	}

	public void setKommentar(String kommentar) {
		this.kommentar = kommentar;
	}

	public List<String> getTagsZerlegung() {
		zerlegeTagsInListe(getTags());
		return tagsZerlegung;
	}

	public void setTagsZerlegung(List<String> tagsZerlegung) {
		this.tagsZerlegung = tagsZerlegung;
	}
	
	public void zerlegeTagsInListe(String tags)
	{
		String[] aryStr = tags.split(",");
		for(String elem: aryStr)
		{
			tagsZerlegung.add(elem);
		}
	}

}
