<?php
require_once "View.php";

class AtributoView extends View{

    public function __construct(){
        parent::__construct();
    }

    public function renderTablaAtributos($tablaAtributos){
        $this->smarty->assign('tablaAtributos', $tablaAtributos);
        $this->smarty->display('./templates/tabla-atributos.tpl');
    }

    public function redirectTablaAtributo(){
        header("Location: ".BASE_URL."tabla-atributos");
    }
}