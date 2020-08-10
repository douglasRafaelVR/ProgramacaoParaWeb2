<%-- 

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>FORM</title>
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
        <style>
            
        </style>
    </head>
    <body>
        <nav id="menu">
            <div class="centralizacao">
                <ul class="lista1">
                    <li class="lista2" onmouseover="abrirOpcoes(0)" onMouseOut="fecharOpcoes(0)">
                        <a class="botao" href="../home.jsp">HOME</a>
                        <ul class="lista3">
                            
                        </ul>
                    </li>
                    <li class="lista2"  onmouseover="abrirOpcoes(1)" onMouseOut="fecharOpcoes(1)">
                        <a class="botao"  href="#">Veiculos</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="../veiculos/form">Cadastro</a></li>
                            <li class="subopcao"><a href="../veiculos/lista">Todos os Veículos</a></li>
                        </ul>
                    </li>
                    <li class="lista2"  onmouseover="abrirOpcoes(2)" onMouseOut="fecharOpcoes(2)">
                        <a class="botao"  href="#">Clientes</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="../clientes/form">Cadastro</a></li>
                            <li class="subopcao"><a href="../clientes/lista">todos dos Clientes</a></li>
                        </ul>
                    </li>
                    <li class="lista2"  onmouseover="abrirOpcoes(3)" onMouseOut="fecharOpcoes(3)">
                        <a class="botao"  href="#">Locações</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="../locacaos/form">Cadastro</a></li>
                            <li class="subopcao"><a href="../locacaos/lista">Todos as Locações</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <header>
            <h1>Formulário do Usuario</h1>
        </header>
        <article>
        <form class="form-div" action="${linkTo[UsuariosController].salvar}" method="POST">
            <table class="tb_form">
                <caption>Formulario</caption>
                <tr>
                    <th>Nome</th>
                    <th><input type="text" placeholder="nome" name="usuario.nome" value="${usuario.nome}"></th>
                </tr>
                <tr>
                    <th>Login</th>
                    <th><input type="text" placeholder="login" name="usuario.login" value="${usuario.login}"/></th>
                </tr>
                <tr>
                    <th>Senha</th>
                    <th><input type="password" placeholder="senha" name="usuario.senha" value="${usuario.senha}"/></th>
                </tr>
                <tr>
                    <th colspan="2">
                       <input id="btn_salvar" type="submit" value="Salvar" />
                    </th>
                </tr>
            </table>
            
        </form> 
            <div style="display: flex;flex-flow: row wrap;justify-content: center;" class="div-horizontal-erros">
                <div style="display: flex;flex-flow: column wrap;justify-content: space-between;width: 60vw;" class="div-vertical-erros">
                    <c:forEach var="error" items="${errors}">
                        <div style="color: white;font-weight: bold;text-align: center; padding: 1vh;margin: 0.5vh;font-size: 20px;background-color: #F99;" class="erros">
                            ${error.category} - ${error.message}
                        </div>
                    </c:forEach>
                </div>
            </div>
        </article>
        <footer>
            
        </footer>
        <script src="../js/codigoPrincipal.js"></script>        
        <script src="../js/codigoMenu.js"></script>
        <script>
        window.onload = iniciar;
        function iniciar(){
            zebrarTabela();
            desabilitarListaSubOpcoes();
        }
        function zebrarTabela(){
            var tabela = document.getElementsByClassName("tb_form")[0];
            for(let i=0 ; i<(tabela.getElementsByTagName("tr").length-1) ; i=i+2){
                tabela.getElementsByTagName("tr")[i].style.backgroundColor = "#DDD";
            }
        }
        
        </script>
    </body>
</html>
