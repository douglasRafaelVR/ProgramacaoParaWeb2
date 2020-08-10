/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.douglas_rafael_atividade_aula13.model.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author dougl
 */
@Entity
@Table(name="tb_cliente")
public class Cliente implements Serializable {
    @Id
    @GeneratedValue
    private int id;
    @NotNull(message = "{obrigatorio}")
    private String nome;
    @NotNull(message = "{obrigatorio}")
    private String telefone;
    
    @OneToMany(mappedBy = "cliente")
    private List<Locacao> locacaoList;
    
    public Integer getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public List<Locacao> getLocacaoList() {
        return locacaoList;
    }

    public void setLocacaoList(Locacao locacaoList) {
        this.locacaoList.add(locacaoList);
    }
    
    
}
