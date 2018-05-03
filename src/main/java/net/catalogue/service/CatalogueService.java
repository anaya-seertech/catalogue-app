package net.catalogue.service;

import java.util.List;

import net.catalogue.form.Apparel;

public interface CatalogueService {

	public List<Apparel> listApparels();
	public Apparel getApparelById(int id);
}