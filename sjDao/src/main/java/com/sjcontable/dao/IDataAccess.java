package com.sjcontable.dao;

import java.io.Serializable;
import java.util.List;

public abstract interface IDataAccess<E extends Serializable> {

    public abstract E save(E paramE);

    public abstract E update(E paramE);

    public abstract void delete(E paramE);

    public abstract void delete(String paramString);

    public abstract void delete(int paramInt);

    public abstract E getById(Serializable paramSerializable);

    public abstract E getById(int paramInt);

    public abstract E getById(String paramString);

    public abstract List<E> getListAll();

    public abstract void remove(E paramE);

    public abstract E getByStrId(String paramString);

    public abstract List<E> getListId(String paramString);

    public abstract List<E> getListId(Serializable paramSerializable);

    public abstract List<E> getListId(int paramInt);
}
