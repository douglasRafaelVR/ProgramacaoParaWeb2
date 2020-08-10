<%-- 
    Document   : form
    Created on : 13 de fev de 2020, 09:37:25
    Author     : douglas.rodrigues
--%>
<%@page import="com.mycompany.douglas_rafael_atividade_aula13.model.entity.Cliente"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>FORM</title>
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
        <style>
            select{
                background-color: rgba(0,0,0,0);
                width: 30vw;
                height: 5vh;
                
                padding-left: 10vw;
                
                font-size: 20px;
                text-align: center;
            }  
            .div_erros{
                display: flex;
                flex-flow: row wrap;
                justify-content: center;
            }
            .erros{
                width: 60vw;
                border: 2px solid red;
                padding: 10px;
                
                color: red;
                text-align: center;
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
            <h1>Formulário das Locacões</h1>
        </header>
        <article>
        <form class="form-div" action="${linkTo[LocacaosController].salvar}" method="POST">
            <table class="tb_form">
                <caption>Formulario</caption>
                <tr>
                    <th>Id</th>
                    <th><input type="hidden" placeholder="este campo é preenchido automaticamente..." name="locacao.id" value="${locacao.id}"></th>
                </tr>
                <tr>
                    <th>Data da locação </th>
                    <th><input onmouseout="ajustarQtdDiarias()" type="text" placeholder="dia/mês/ano" name="locacao.dtInicio" value="${locacao.dtInicio}"/></th>
                </tr>
                <tr>
                    <th>Data de devolução</th>
                    <th><input onmouseout="ajustarQtdDiarias()" type="text" placeholder="dia/mês/ano" name="locacao.dtFim" value="${locacao.dtFim}"/></th>
                </tr>
                <tr>
                    <th>Quantidade de Diárias</th>
                    <th><input type="number" placeholder="digite o nº de diárias da locação" name="locacao.qtdDiarias" value="${locacao.qtdDiarias}"/></th>
                </tr>
                <tr>
                    <th>veiculo escolhido</th>
                    <th>
                        <select required name="idVeiculo">
                            <c:forEach items="${veiculoList}" var="v">
                                <option value="${v.id}">${v.placa}</option>
                            </c:forEach>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th>Cliente escolhido</th>
                    <th>
                        <select required name="idCliente">
                            <c:forEach items="${clienteList}" var="c">
                                <option value="${c.id}">${c.nome}</option>
                            </c:forEach>
                        </select>
                    </th>
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
        function ajustarQtdDiarias(){
            
            var dtInicio = (document.getElementsByName("locacao.dtInicio")[0].value).split("/");
            var dtFim = (document.getElementsByName("locacao.dtFim")[0].value).split("/");
            var DeltaDias = (parseInt(dtFim[0]) - parseInt(dtInicio[0]));
            var DeltaMes = 30*(parseInt(dtFim[1]) - parseInt(dtInicio[1]));
            var DeltaAno = 366*(parseInt(dtFim[2]) - parseInt(dtInicio[2]));
            var qtdDiarias = DeltaDias + DeltaMes + DeltaAno;
            document.getElementsByName("locacao.qtdDiarias")[0].value = qtdDiarias;
            
        }
        /*
        function salvar(){
            window.location.href="${linkTo[LocacaosController].salvar}?"+
                    "id="+document.getElementsByName("locacao.qtdDiarias")[0].value+
                    "dtInicio="+document.getElementsByName("locacao.dtInicio")[0].value+
                    "dtFim="+document.getElementsByName("locacao.dtFim")[0].value+
                    "qtdDiarias="+document.getElementsByName("locacao.qtdDiarias")[0].value+
                    "idVeiculo="+document.getElementsByName("locacao.idVeiculo")[0].value+
                    "idCliente="+document.getElementsByName("locacao.idCliente")[0].value;
                    
        }*/
    
    
        </script>
    </body>
</html>
