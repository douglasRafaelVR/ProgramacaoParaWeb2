<%-- 
    Document   : form
    Created on : 13 de fev de 2020, 09:37:25
    Author     : douglas.rodrigues
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>FORM</title>
        <link type="text/css" rel="stylesheet" href="../css/estilos.css">
        <style>
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
                            <li class="subopcao"><a href="../clientes/lista">Todos os Clientes</a></li>
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
            <h1>Formulário do veículo</h1>
        </header>
        <article>
        <form class="form-div" action="${linkTo[VeiculosController].salvar}" method="POST">
            <table class="tb_form">
                <caption>Formulario</caption>
                <tr>
                    <th>ID</th>
                    <th><input type="hidden" placeholder="este campo é preenchido automaticamente..." name="veiculo.id" value="${veiculo.id}"></th>
                </tr>
                <tr>
                    <th>Placa</th>
                    <th><input type="text" placeholder="digite a placa do veículo" name="veiculo.placa" value="${veiculo.placa}"></th>
                </tr>
                <tr>
                    <th>Modelo</th>
                    <th><input type="text" placeholder="digite o modelo do veículo" name="veiculo.modelo" value="${veiculo.modelo}"/></th>
                </tr>
                <tr>
                    <th>Velor da Diária</th>
                    <th><input type="number" placeholder="digite o valor da diária do veículo" name="veiculo.valorDiaria" value="${veiculo.valorDiaria}"/></th>
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
