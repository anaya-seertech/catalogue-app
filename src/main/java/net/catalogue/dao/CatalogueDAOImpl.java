package net.catalogue.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import net.catalogue.dao.CatalogueDAO;

import net.catalogue.form.Apparel;

@Repository
public class CatalogueDAOImpl implements CatalogueDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CatalogueDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Apparel> listApparels() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Apparel> apparelsList = session.createQuery("from Apparel").list();
		for(Apparel a : apparelsList){
			logger.info("Apparel List::"+a);
		}
		return apparelsList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Apparel> getApparelByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Apparel.class);
		c.add(Restrictions.ilike("name", "%" + name +"%"));
		List<Apparel> apparelsList = c.list();
		for(Apparel a : apparelsList){
			logger.info("Apparel List Search::"+a);
		}
		return apparelsList;
	}

	@Override
	public Apparel getApparelById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Apparel a = (Apparel) session.load(Apparel.class, new Integer(id));
		logger.info("Apparel loaded successfully, Apparel details="+a);
		return a;
	}

}