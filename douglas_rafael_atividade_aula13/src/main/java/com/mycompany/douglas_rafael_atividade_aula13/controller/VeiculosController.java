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
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.VeiculoDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Veiculo;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author dougl
 */
@Controller
public class VeiculosController {
    
    @Inject
    Result result;
    
    @Inject
    Validator validator;
        
    @Inject
    VeiculoDAO dao;
    
    public void form(){
        
    }
    public List<Veiculo> lista(){
        //dao = new VeiculoDAO();
        return dao.buscarVeiculos();
    }
    public void salvar(Veiculo veiculo, Result result){
        //dao = new VeiculoDAO();
        validator.validate(veiculo);
        validator.onErrorRedirectTo(this).form();
        if(veiculo.getPlaca()==null){
            dao.salvar(veiculo);
        }else{
            dao.atualizar(veiculo);
        }    
        result.redirectTo(this).lista();
    }
    public void editar(int id, Result result){
        //dao = new VeiculoDAO();
        //validator.add(new SimpleMessage("Nome", "Algum campo obrigatório não foi preenchido."));
        validator.onErrorRedirectTo(this).form();
        Veiculo veiculo = dao.buscarVeiculo(id);
        result.include(veiculo);
        result.redirectTo(this).form();
    }
    public void excluir(Integer id, Result result){
        //dao = new VeiculoDAO();
        dao.excluir(id);
        result.redirectTo(this).lista();
    }
}
