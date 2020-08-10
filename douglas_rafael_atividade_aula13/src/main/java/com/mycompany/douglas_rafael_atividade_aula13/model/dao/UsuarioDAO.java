package com.mycompany.douglas_rafael_atividade_aula13.model.dao;

import com.mycompany.douglas_rafael_atividade_aula13.model.entity.Usuario;
import javax.websocket.Session;
import org.graalvm.compiler.lir.CompositeValue.Component;
import org.hibernate.Transaction;


@Component
public class UsuarioDAO {
    private final Session session;
    public UsuarioDAO(Session session) {
    this.session = session;
}
public boolean existeUsuario(Usuario usuario) {
    Usuario encontrado = (Usuario) session.createCriteria(Usuario.class).add(Restrictions.eq("login", usuario.getLogin())).uniqueResult();
    return encontrado != null;
}
public void adiciona(Usuario usuario) {
    Transaction tx = this.session.beginTransaction();   
    this.session.save(usuario);
    tx.commit();
}
}
