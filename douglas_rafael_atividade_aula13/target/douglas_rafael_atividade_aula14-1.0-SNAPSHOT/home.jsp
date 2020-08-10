<%-- 
    Document   : home
    Created on : 15 de abr de 2020, 10:26:23
    Author     : dougl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <header>
            <div>
                <h1>Atividade Aula 14 - Douglas Rafael</h1>
            </div>

        </header>
        <nav id="menu">
            <div class="centralizacao">
                <ul class="lista1">
                    <li class="lista2" onmouseover="abrirOpcoes(0)" onMouseOut="fecharOpcoes(0)">
                        <a class="botao" href="#">Veículos</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="veiculos/form">Cadastro</a></li>
                            <li class="subopcao"><a href="veiculos/lista">Todos os Veículos</a></li>
                        </ul>
                    </li>
                    <li class="lista2"  onmouseover="abrirOpcoes(1)" onMouseOut="fecharOpcoes(1)">
                        <a class="botao"  href="#">Clientes</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="clientes/form">Cadastro</a></li>
                            <li class="subopcao"><a href="clientes/lista">Todos os Clientes</a></li>
                        </ul>
                    </li>
                    <li class="lista2"  onmouseover="abrirOpcoes(2)" onMouseOut="fecharOpcoes(2)">
                        <a class="botao"  href="#">Locações</a>
                        <ul class="lista3">
                            <li class="subopcao"><a href="locacaos/form">Cadastro</a></li>
                            <li class="subopcao"><a href="locacaos/lista">Todos as Locações</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <article>
        
        </article>
        <footer>
        </footer>
        <script src="js/codigoPrincipal.js"></script>  
        <script src="js/codigoMenu.js"></script>
        <script>
            window.onload = iniciar;
            function iniciar(){
                desabilitarListaSubOpcoes();
            }
        </script>
    </body>
</html>

