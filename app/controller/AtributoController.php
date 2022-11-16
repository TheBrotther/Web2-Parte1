<?php

require_once "Controller.php";
require_once "./app/model/AtributoModel.php";
require_once "./app/view/AtributoView.php";
require_once "./app/-helper/AuthHelper.php";

class AtributoController extends Controller{

    public function __construct(){
        parent::__construct(new AtributoView(),new AtributoModel(), new AuthHelper());
    }

    public function tablaAtributos(){
        $this->view->renderTablaAtributos(  $this->model->getAtributos(),
                                            $this->helper->checkLoggedIn());
    }

    public function modifyAtributo($id_atributo){
        if($this->helper->checkLoggedIn()){
            $this->model->editarAtributo($id_atributo, $_POST['nombre']);
            $this->view->redirectTablaAtributo();
        }else{
            $this->redirectRoute('home');}
    }

    public function deleteAtributo($id_atributo){
        if($this->helper->checkLoggedIn()){
            $this->model->borrarAtributo($id_atributo);
            $this->view->redirectTablaAtributo();
        }else{
            $this->redirectRoute('home');}
    }

    public function addAtributo(){
        if($this->helper->checkLoggedIn()){
            if(isset($_POST['nombre'])){
                $this->model->agregarAtributo($_POST['nombre']);
                $this->view->redirectTablaAtributo();
            }else{
                $this->redirectRoute('home');}
        }else{
            $this->redirectRoute('home');}
    }

}