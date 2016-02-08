package com.sjcontable.dao;

import com.sjcontable.dao.constants.DaoConstants;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public abstract class DataAccess<E extends Serializable>
        extends HibernateUtil
        implements IDataAccess<E> {

    protected Class<E> entityClass;
    protected final Log logger;

    public DataAccess() {
        ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
        this.entityClass = ((Class) genericSuperclass.getActualTypeArguments()[0]);
        this.logger = LogFactory.getLog(this.entityClass);
    }

    @Override
    public E save(E entity) {
        Session session = getSessionFactory().openSession();
        try {
            session.beginTransaction().begin();
            session.save(entity);
            session.beginTransaction().commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_SAVE + e.getMessage());
        } finally {
            session.close();
        }
        return entity;
    }

    @Override
    public E update(E entity) {
        Session session = getSessionFactory().openSession();
        try {
            session.beginTransaction().begin();
            session.update(entity);
            session.beginTransaction().commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_UPDATE + e.getMessage());
        } finally {
            session.close();
        }
        return entity;
    }

    @Override
    public void delete(String id) {
        Session session = getSessionFactory().openSession();
        try {
            session.beginTransaction().begin();
            session.delete(session.get(this.entityClass, id));
            session.beginTransaction().commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_DELETE + e.getMessage());
        } finally {
            session.close();
        }
    }

    @Override
    public void delete(Serializable id) {
        Session session = getSessionFactory().openSession();
        try {
            session.beginTransaction().begin();
            session.delete(session.get(this.entityClass, id));
            session.beginTransaction().commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_DELETE + e.getMessage());
        } finally {
            session.close();
        }
    }

    @Override
    public void delete(int id) {
        Session session = getSessionFactory().openSession();
        try {
            session.beginTransaction().begin();
            session.delete(session.get(this.entityClass, id));
            session.beginTransaction().commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_DELETE + e.getMessage());
        } finally {
            session.close();
        }
    }

    @Override
    public void remove(E entity) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction t = session.beginTransaction();
            session.delete(entity);
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_DELETE + e.getMessage());
        } finally {
            session.close();
        }
    }

    @Override
    public E getById(Serializable id) {
        Session session = getSessionFactory().openSession();
        E entidad = null;
        try {
            Transaction t = session.beginTransaction();
            entidad = (E) (Serializable) session.createCriteria(this.entityClass).add(Restrictions.idEq(id)).uniqueResult();
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET + e.getMessage());
        } finally {
            session.close();
        }
        return entidad;
    }

    @Override
    public E getById(int id) {
        Session session = getSessionFactory().openSession();
        E entidad = null;
        try {
            Transaction t = session.beginTransaction();
            entidad = (E) (Serializable) session.get(this.entityClass, id);
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET + e.getMessage());
        } finally {
            session.close();
        }
        return entidad;
    }

    @Override
    public E getByStrId(String id) {
        Session session = getSessionFactory().openSession();
        E entidad = null;
        try {
            Transaction t = session.beginTransaction();
            entidad = (E) (Serializable) session.get(this.entityClass, id);
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET + e.getMessage());
        } finally {
            session.close();
        }
        return entidad;
    }

    @Override
    public E getById(String id) {
        Session session = getSessionFactory().openSession();
        E entidad = null;
        try {
            Transaction t = session.beginTransaction();
            entidad = (E) (Serializable) session.get(this.entityClass, id);
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET + e.getMessage());
        } finally {
            session.close();
        }
        return entidad;
    }

    @Override
    public List<E> getListAll() {
        Session session = getSessionFactory().openSession();
        List<E> lista = null;
        try {
            Transaction t = session.beginTransaction();
            lista = session.createCriteria(this.entityClass).list();
            if (lista == null) {
                lista = new ArrayList();
            }
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET_ALL + e.getMessage());
        } finally {
            session.close();
        }
        return lista;
    }

    @Override
    public List<E> getListId(String id) {
        Session session = getSessionFactory().openSession();
        List<E> lista = null;
        try {
            Transaction t = session.beginTransaction();
            lista = session.createCriteria(this.entityClass).add(Restrictions.idEq(id)).list();
            if (lista == null) {
                lista = new ArrayList();
            }
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET_ALL + e.getMessage());
        } finally {
            session.close();
        }
        return lista;
    }

    @Override
    public List<E> getListId(Serializable id) {
        Session session = getSessionFactory().openSession();
        List<E> lista = null;
        try {
            Transaction t = session.beginTransaction();
            lista = session.createCriteria(this.entityClass).add(Restrictions.idEq(id)).list();
            if (lista == null) {
                lista = new ArrayList();
            }
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET_ALL + e.getMessage());
        } finally {
            session.close();
        }
        return lista;
    }

    @Override
    public List<E> getListId(int id) {
        Session session = getSessionFactory().openSession();
        List<E> lista = null;
        try {
            Transaction t = session.beginTransaction();
            lista = session.createCriteria(this.entityClass).add(Restrictions.idEq(id)).list();
            if (lista == null) {
                lista = new ArrayList();
            }
            t.commit();
        } catch (Exception e) {
            this.logger.info(DaoConstants.MSG_ERROR_GET_ALL + e.getMessage());
        } finally {
            session.close();
        }
        return lista;
    }
}
