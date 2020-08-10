/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.douglas_rafael_atividade_aula13.model.dao;

import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Veiculo;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author dougl
 */
@Dependent
public class VeiculoDAO {
    
    @Inject
    EntityManager em;
    
    public void salvar(Veiculo veiculo){
        //iniciar a transação
        em.getTransaction().begin();
        em.persist(veiculo);
        em.getTransaction().commit();
    }
    public boolean excluir(int id) {
        Veiculo veiculo = em.find(Veiculo.class, id);
        if (veiculo != null) {
            em.getTransaction().begin();
            em.remove(veiculo);
            em.getTransaction().commit();
            //em.close();
            return true;
        }
        return false;
    }
    public Veiculo buscarVeiculo(int id){
        Veiculo objeto = em.find(Veiculo.class,id);
        //em.close();
        return objeto;
    }
    public List<Veiculo> buscarVeiculos(){
        Query query = em.createQuery("from Veiculo");
        //em.close();
        return query.getResultList();
    }
    public void atualizar(Veiculo objeto ){
        em.getTransaction().begin();
        em.merge(objeto);
        em.getTransaction().commit();
        //em.close();
    }
}
