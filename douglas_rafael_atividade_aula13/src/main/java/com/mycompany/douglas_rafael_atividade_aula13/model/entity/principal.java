/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.douglas_rafael_atividade_aula13.model.entity;

import com.mycompany.douglas_rafael_atividade_aula13.model.dao.ClienteDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.LocacaoDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.VeiculoDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dougl
 */
public class principal {
    public static void main(String[] args) {
        
        //ESTE CÓDIGO DEU CERTO !!!!
        
        Veiculo v = new Veiculo();
        v.setPlaca("a");
        v.setModelo("a");
        v.setValorDiaria(5);
        new VeiculoDAO().salvar(v);
        
        List<Locacao> locList = new ArrayList();

        Cliente c = new Cliente();
        c.setNome("a");
        c.setTelefone("a");
        //c.setLocacaoList(locList);
        new ClienteDAO().salvar(c);
        
        locList.add(new Locacao(v));
        locList.get(0).setDtInicio("a");
        locList.get(0).setDtFim("a");
        locList.get(0).setQtdDiarias(1);
        locList.get(0).setCliente(c);
        new LocacaoDAO().salvar(locList.get(0));
        
        locList.add(new Locacao(v));
        locList.get(1).setDtInicio("b");
        locList.get(1).setDtFim("b");
        locList.get(1).setQtdDiarias(1);
        locList.get(1).setCliente(c);
        new LocacaoDAO().salvar(locList.get(1));
        
        
        /*
        
        */
        
    }
}
