package com.mycompany.douglas_rafael_atividade_aula13.model.dao;

import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Locacao;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Veiculo;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Dependent
public class LocacaoDAO {
    
    @Inject
    EntityManager em;
    
    
    public void salvar(Locacao objeto){
        //iniciar a transação
        em.getTransaction().begin();
        em.persist(objeto);
        em.getTransaction().commit();
    }
    public void excluir(Integer id) {
        em.getTransaction().begin();
        Locacao objeto = em.find(Locacao.class, id);
        em.remove(objeto);
        em.getTransaction().commit();
    }
    public Locacao buscarLocacao(int id){
        Locacao locacao = em.find(Locacao.class,id);
        return locacao;
    }
    public List<Locacao> buscarLocacaos(){
        Query query = em.createQuery("from Locacao");
        return query.getResultList();
    }
    public void atualizar(Locacao objeto){
        em.getTransaction().begin();
        em.merge(objeto);
        em.getTransaction().commit();
    }
}
