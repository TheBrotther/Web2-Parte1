<?php

require_once './app/model/Model.php';
require_once './app/view/View.php';

class Controller{

    protected $view;
    protected $model;
    protected $helper;
    
    //El constructor construye la instancia/genera el objeto.
    function __construct($view = null, $model = null, $helper = null){
        $this->model = $model;
        $this->view = $view;
        $this->helper = $helper;
    }

    public static function redirectRoute($route)
    {
        header("Location: ".BASE_URL.$route);
        die;
    }
}