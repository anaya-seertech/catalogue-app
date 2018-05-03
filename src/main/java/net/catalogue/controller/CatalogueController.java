package net.catalogue.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.catalogue.form.Apparel;
import net.catalogue.service.CatalogueService;

@Controller
public class CatalogueController {
	
	private CatalogueService catalogueService;
	
	@Autowired(required=true)
	@Qualifier(value="catalogueService")
	public void setCatalogueService(CatalogueService cs){
		this.catalogueService = cs;
	}
	
	@RequestMapping(value="/apparels", method = RequestMethod.GET)
	public String listApparels(Model model){
		model.addAttribute("apparel", new Apparel());
		model.addAttribute("listApparels", this.catalogueService.listApparels());
		return "apparel";
	}
}
