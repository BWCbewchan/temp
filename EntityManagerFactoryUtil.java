package iuh.fit.se.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityManagerFactoryUtil {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	public EntityManagerFactoryUtil() {
		entityManagerFactory = Persistence.createEntityManagerFactory("qldt");
		entityManager = entityManagerFactory.createEntityManager();
		// TODO Auto-generated constructor stub
	}
	public void close() {
		// TODO Auto-generated method stub
		entityManagerFactory.close();
		entityManager.close();
	}
	public EntityManager getEntityManager() {
		return entityManager;
	}
}
