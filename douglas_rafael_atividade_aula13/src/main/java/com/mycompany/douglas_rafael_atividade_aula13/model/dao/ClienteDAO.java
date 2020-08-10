package com.mycompany.douglas_rafael_atividade_aula13.model.dao;

import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Cliente;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Dependent
public class ClienteDAO {
    
    @Inject
    EntityManager em;
    
    
    public void salvar(Cliente objeto){
        //iniciar a transação
        em.getTransaction().begin();
        em.persist(objeto);
        em.getTransaction().commit();
    }
    public void excluir(Integer id) {
        em.getTransaction().begin();
        Cliente objeto = em.find(Cliente.class, id);
        em.remove(objeto);
        em.getTransaction().commit();
    }
    public Cliente buscarCliente(int id){
        Cliente cliente = em.find(Cliente.class,id);
        return cliente;
    }
    public List<Cliente> buscarClientes(){
        Query query = em.createQuery("from Cliente");
        return query.getResultList();
    }
    public void atualizar(Cliente objeto){
        em.getTransaction().begin();
        em.merge(objeto);
        em.getTransaction().commit();
    }
}
