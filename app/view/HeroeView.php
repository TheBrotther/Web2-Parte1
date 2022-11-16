<?php
require_once "View.php";

class HeroeView extends View{

    public function __construct(){
        parent::__construct();
    }

    public function showHeroes(){
        //Aqui se borro algo que lucas no quiere reconocer,
        //insertar una ruta a un assign.
        
        $this->smarty->display('./templates/heroes.tpl');
    }

    public function renderHeroes($heroes, $atributos){
        $this->smarty->assign('atributos', $atributos);
        $this->smarty->assign('heroes', $heroes);
        $this->smarty->display('./templates/heroes.tpl');
    }

    public function renderHeroe($heroe){
        $this->smarty->assign('heroe', $heroe);
        $this->smarty->display('./templates/heroe.tpl');
    }

    public function renderTablaHeroes($tablaHeroes, $atributos){
        $this->smarty->assign('atributos', $atributos);
        $this->smarty->assign('tablaHeroes', $tablaHeroes);
        $this->smarty->display('./templates/tabla-heroes.tpl');
    }

    public function redirectTablaHeroes(){
        header("Location: ".BASE_URL."tabla-heroes");
    }
}