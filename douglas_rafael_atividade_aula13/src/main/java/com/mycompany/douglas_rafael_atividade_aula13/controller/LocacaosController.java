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
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.LocacaoDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.VeiculoDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Cliente;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Locacao;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Veiculo;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author dougl
 */
@Controller
public class LocacaosController {
    
    @Inject
    Result result;
    
    @Inject
    Validator validator;
    
    @Inject
    LocacaoDAO dao;
    @Inject
    VeiculoDAO daoVeiculo;
    @Inject
    ClienteDAO daoCliente;
    
    
    public void form(){
        result.include("clienteList",daoCliente.buscarClientes());
        result.include("veiculoList",daoVeiculo.buscarVeiculos());
    }
    public List<Locacao> lista(){
        //dao = new LocacaoDAO();
        return dao.buscarLocacaos();
    }
    //public void salvar(int id,String dtInicio,String dtFim,int qtdDiarias,int idVeiculo,int idCliente, Result result){
    public void salvar(Locacao locacao,int idVeiculo,int idCliente, Result result){
        
        //dao = new LocacaoDAO();
        locacao.setVeiculo(daoVeiculo.buscarVeiculo(idVeiculo));
        locacao.setCliente(daoCliente.buscarCliente(idCliente));
        // atualizando lista de clientes
        Cliente cliente = daoCliente.buscarCliente(idCliente);
        cliente.setLocacaoList(locacao);
        daoCliente.atualizar(cliente);
        // fechamento da lista de clientes
        validator.validate(locacao);
        validator.onErrorRedirectTo(this).form();
        if(locacao.getId()==null){
            dao.salvar(locacao);
        }else{
            dao.atualizar(locacao);
        }    
        result.redirectTo(this).lista();
    }
    public void editar(int id, Result result){
        //dao = new LocacaoDAO();
        //validator.add(new SimpleMessage("Nome", "Algum campo obrigatório não foi preenchido."));
        validator.onErrorRedirectTo(this).form();
        Locacao locacao = dao.buscarLocacao(id);
        result.include(locacao);
        result.redirectTo(this).form();
    }
    public void excluir(Integer id, Result result){
        //dao = new LocacaoDAO();
        dao.excluir(id);
        result.redirectTo(this).lista();
    }
}
