/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.douglas_rafael_atividade_aula13.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.ClienteDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Cliente;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author dougl
 */
@Controller
public class ClientesController {
    
    @Inject
    Result result;
    
    @Inject
    Validator validator;
    
    @Inject
    ClienteDAO dao;
    
    public void form(){
        
    }
    public List<Cliente> lista(){
        //dao = new ClienteDAO();
        return dao.buscarClientes();
    }
    public void salvar(Cliente cliente, Result result){
        validator.validate(cliente);
        validator.onErrorRedirectTo(this).form();
        //dao = new ClienteDAO();
        if(cliente.getId()==null)
            dao.salvar(cliente);
        else
            dao.atualizar(cliente);
        result.redirectTo(this).lista();
    }
    public void editar(int id, Result result){
        //dao = new ClienteDAO();
        validator.onErrorRedirectTo(this).form();
        Cliente cliente = dao.buscarCliente(id);
        result.include(cliente);
        result.redirectTo(this).form();
    }
    public void excluir(Integer id, Result result){
        //dao = new ClienteDAO();
        dao.excluir(id);
        result.redirectTo(this).lista();
    }
}
