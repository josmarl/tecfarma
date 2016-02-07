package com.sjcontable.dao;

import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil
{
  public static SessionFactory sessionFactory;
  public static String syscenter_pakage = "";
  
  public static void lecturaProperties()
  {
    try
    {
      Properties pros = new Properties();
      pros.load(HibernateUtil.class.getResource("/syscenterlife.properties").openStream());
      syscenter_pakage = pros.getProperty("syscenter.pakage");
    }
    catch (Exception e)
    {
      System.out.println(e.getMessage());
    }
  }
  
  public SessionFactory getSessionFactory()
  {
    
    if (sessionFactory == null)
    {
      try
      {
        sessionFactory = new AnnotationConfiguration().configure().addPackage(syscenter_pakage).buildSessionFactory();
      }
      catch (Throwable ex)
      {
        System.err.println("Initial SessionFactory creation failed." + ex);
        throw new ExceptionInInitializerError(ex);
      }
      return sessionFactory;
    }
    return sessionFactory;
  }
}
