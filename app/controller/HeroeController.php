<?php
require_once "Controller.php";
require_once './app/model/HeroeModel.php';
require_once './app/view/HeroeView.php';
require_once './app/model/AtributoModel.php';
require_once "./app/-helper/AuthHelper.php";

class HeroeController extends Controller{

    protected  $atributoModel;
    public function __construct(){
        parent::__construct(new HeroeView(),new HeroeModel(), new AuthHelper());
        $this->atributoModel = new AtributoModel();
    }
    
    public function showHeroe($id_heroe){
        $heroe = $this->model->getHeroeById($id_heroe);
        $this->view->renderHeroe($heroe);
    }
    
    public function showHeroes($id_atributo = null){
        $heroes = [];
        if (!empty($id_atributo)){  
            $heroes = $this->model->getHeroesByAtribute($id_atributo);
        }else{
            $heroes = $this->model->getHeroes();
        }
        $this->view->renderHeroes(  $heroes, 
                                    $this->atributoModel->getAtributos());
    }
    
    public function tablaHeroes(){
        $this->view->renderTablaHeroes( $this->model->getHeroes(), 
                                        $this->atributoModel->getAtributos());
    }
    
    public function modifyHero($id_heroe){
        if($this->helper->checkLoggedIn()){
            $this->model->editarHeroe($_POST['nombre'], $_POST['type_atack'], $_POST['fk'], $_POST['descripcion'], $id_heroe);
            $this->view->redirectTablaHeroes();
        }else{
            $this->redirectRoute('home');}
    }

    public function deleteHero($id_heroe){
        if($this->helper->checkLoggedIn()){
            $this->model->borrarHero($id_heroe);
            $this->view->redirectTablaHeroes();
        }else{
            $this->redirectRoute('home');}
    }

    public function addHero(){
        if($this->helper->checkLoggedIn()){
            if(isset($_POST['nombre'], $_POST['type_atack'], $_POST['id_atributo_fk'], $_POST['descripcion'])){
                $this->model->agregarHeroe($_POST['nombre'], $_POST['type_atack'], $_POST['id_atributo_fk'], $_POST['descripcion']);
                $this->view->redirectTablaHeroes();
            }else{
                $this->redirectRoute('home');}
        }else{
            $this->redirectRoute('home');}
    }

}