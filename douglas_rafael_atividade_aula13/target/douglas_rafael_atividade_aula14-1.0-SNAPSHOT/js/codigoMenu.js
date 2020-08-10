function desabilitarListaSubOpcoes(){ // coloca todas as opções escondidas como display = none
        //alert("começou");
        var listaSubopcoes = document.getElementsByClassName("lista3");
        //alert(listaSubopcoes.length);
        for(let i = 0; i<listaSubopcoes.length ; i++){
                var subopcoes = listaSubopcoes[i].getElementsByClassName("subopcao");
                //alert(subopcoes.length);
                for(let j = 0; j<subopcoes.length ; j++){
                        var subopcao = subopcoes[j];
                        //alert(subopcao.firstChild.nodeValue);
                        subopcao.style.display = "none";
                }
        }
}
function abrirOpcoes(id){
        //alert("passou por cima");
        mundial = 0;
        var subopcoes = document.getElementsByClassName("lista3")[id].getElementsByClassName("subopcao");
        for(let j = 0; j<subopcoes.length ; j++){
                //alert(subopcao.firstChild.nodeValue);
                //setTimeout(function(){subopcao.style.display = "none";},0.5*1000);
                setTimeout(alterarDisplay(subopcoes[j],true),2*1000);
        }
}
function fecharOpcoes(id){
        //alert("deixou de passar por cima");
        var subopcoes = document.getElementsByClassName("lista3")[id].getElementsByClassName("subopcao");

        for(let j = 0; j<subopcoes.length ; j++){
                //alert(subopcao.firstChild.nodeValue);
                //setTimeout(function(){subopcao.style.display = "none";},0.5*1000);
            setTimeout(alterarDisplay(subopcoes[j],false),2*1000);
        }
}
function alterarDisplay(object,bool){
        if(bool){
            object.style.display = "flex";
        }
        else{
            object.style.display = "none";

        }
}     