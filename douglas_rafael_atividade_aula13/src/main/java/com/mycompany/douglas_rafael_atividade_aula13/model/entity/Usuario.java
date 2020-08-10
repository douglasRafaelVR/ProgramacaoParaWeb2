package com.mycompany.douglas_rafael_atividade_aula13.model.entity;
    
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="tb_usuario")
public class Usuario {
        @Id
        @NotNull(message = "{obrigatorio}")
        private String login;
        @NotNull(message = "{obrigatorio}")
        private String senha;
        @NotNull(message = "{obrigatorio}")
        private String nome;

        public String getLogin() {
            return login;
        }

        public void setLogin(String login) {
            this.login = login;
        }

        public String getSenha() {
            return senha;
        }

        public void setSenha(String senha) {
            this.senha = senha;
        }

        public String getNome() {
            return nome;
        }

        public void setNome(String nome) {
            this.nome = nome;
        }
        
        
}
