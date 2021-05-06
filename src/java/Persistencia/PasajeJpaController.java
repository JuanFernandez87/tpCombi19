/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import Logica.Pasaje;
import Persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author juanf
 */
public class PasajeJpaController implements Serializable {

    public PasajeJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;
    
    public PasajeJpaController(){
        emf = Persistence.createEntityManagerFactory("combi19web_PU");
    }     

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Pasaje pasaje) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(pasaje);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Pasaje pasaje) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            pasaje = em.merge(pasaje);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = pasaje.getIdPasaje();
                if (findPasaje(id) == null) {
                    throw new NonexistentEntityException("The pasaje with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Pasaje pasaje;
            try {
                pasaje = em.getReference(Pasaje.class, id);
                pasaje.getIdPasaje();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The pasaje with id " + id + " no longer exists.", enfe);
            }
            em.remove(pasaje);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Pasaje> findPasajeEntities() {
        return findPasajeEntities(true, -1, -1);
    }

    public List<Pasaje> findPasajeEntities(int maxResults, int firstResult) {
        return findPasajeEntities(false, maxResults, firstResult);
    }

    private List<Pasaje> findPasajeEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Pasaje.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Pasaje findPasaje(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Pasaje.class, id);
        } finally {
            em.close();
        }
    }

    public int getPasajeCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Pasaje> rt = cq.from(Pasaje.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
