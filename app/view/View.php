<?php
require_once './libs/Smarty.class.php';

class View{
    protected $smarty;

    public function __construct() {
        $this->smarty = new Smarty();
        if (!session_id())
            session_start();
    }
    
    public function renderForHeroe($atributos){
        $this->smarty->assign('atributos', $atributos);
        $this->smarty->display('./templates/ingresaHeroe.tpl');
    }
}   