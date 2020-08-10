package com.mycompany.douglas_rafael_atividade_aula13.controller;

import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Message;
import br.com.caelum.vraptor.validator.Validator;
import com.mycompany.douglas_rafael_atividade_aula13.model.dao.UsuarioDAO;
import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Usuario;
import javax.annotation.Resource;
import javax.servlet.jsp.tagext.ValidationMessage;

@Resource
public class UsuariosController {
    
    public void novo() {}
    
    private final UsuarioDAO dao;
    private final Result result;
    private final Validator validator;
    
    public UsuariosController(UsuarioDAO dao, Result result,Validator validator) {
        this.dao = dao;
        this.result = result;
        this.validator = validator;
    }
    @Post("/usuarios")
    public void adiciona(Usuario usuario) {
        if (dao.existeUsuario(usuario)) {
            validator.add((Message) new ValidationMessage("Login já existe","usuario.login"));
        }
        validator.onErrorUsePageOf(UsuariosController.class).novo();
        dao.adiciona(usuario);
        result.redirectTo(ClientesController.class).lista();
    }
    //...

        
}

}
