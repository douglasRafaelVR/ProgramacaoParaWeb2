<%-- 
    Document   : lista
    Created on : 20 de fev de 2020, 10:25:27
    Author     : douglas.rodrigues
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
        <title>Lista</title>
        <style>
            ul.padrim{
                list-style-type: circle;
            }
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
                            <li class="subopcao"><a href="../veiculos/form">Formulario</a></li>
                            <li class="subopcao"><a href="../veiculos/lista">Listagem</a></li>
                        </ul>
                    </li>
                    <li class="lista2"  onmouseover="abrirOpcoes(2)" onMouseOut="fecharOpcoes(2)">
                        <a class="botao"  href="#">Clientes</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="../clientes/form">Formulario</a></li>
                            <li class="subopcao"><a href="../clientes/lista">Listagem</a></li>
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
            <h1>Listagem do veículo</h1>
        </header>
        <article>
            <div  class="form-div">
                <table class="tb_lista">
                    <caption>Lista de Clientes</caption>
                    <tr>
                        <th>ID</th>
                        <th>NOME</th>
                        <th>TELEFONE</th>
                        <th>LOCAÇÕES</th>
                        <th>Editar</th>
                        <th>Excluir</th>
                    </tr>
                     <c:forEach items="${clienteList}" var="v">
                        <tr>
                            <td>${v.getId()}</td>
                            <td>${v.getNome()}</td>
                            <td>${v.getTelefone()}</td>
                            <td>
                                <ul style="list-style: circle;" class="padrim">
                                    <c:forEach items="${v.getLocacaoList()}" var="l">
                                        <li>${l.getId()}</li>
                                    </c:forEach>    
                                </ul>
                            </td>
                            <td><a href="${linkTo[ClientesController].editar}?id=${v.getId()}">Editar</a></td>
                            <td onclick="verificarExclusao(${v.getId()})"><a id="link" href="">Excluir</a></td>
                        </tr>
                     </c:forEach>
                </table>
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
        function verificarExclusao(id){
            var a = document.getElementById("link");
            var resposta=confirm("tem certeza que deseja excluir ?");
            if(resposta===false){//respondeu que não
                //a.setAttribute("href","../../");
            }else{//respondeu que sim
                window.location.href = "${linkTo[ClientesController].excluir}?id="+id;
                //alert("placa = "+placa);
            }    
        }
        function zebrarTabela(){
            var tabela = document.getElementsByClassName("tb_lista")[0];
            for(let i=2 ; i<(tabela.getElementsByTagName("tr").length) ; i=i+2){
                tabela.getElementsByTagName("tr")[i].style.backgroundColor = "#DDD";
            }
        }
    </script>
    </body>
</html>
