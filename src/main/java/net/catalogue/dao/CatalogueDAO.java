package net.catalogue.dao;

import java.util.List;

import net.catalogue.form.Apparel;

public interface CatalogueDAO {
	
	public List<Apparel> listApparels();
	public Apparel getApparelById(int id);
	
}
