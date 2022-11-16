<?php
require_once "app/controller/UserController.php";
require_once "app/controller/HeroeController.php";
require_once "app/controller/AtributoController.php";

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . 
                        $_SERVER['SERVER_PORT'] . dirname(
                        $_SERVER['PHP_SELF']).'/');
$userController = new UserController();
$heroeController = new HeroeController();
$atributoController = new AtributoController();

$action = 'home';

if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}
$params = explode('/', $action); 
switch ($params[0]){
    case 'home':
        $userController->showHome();
        break;
    
    // Acciones de sesion, vistas de login y registro.
    case 'login';
        $userController->showLogin();
        break;

    case 'register';
        $userController->showRegister();
        break;
    
    case 'registered':
        $userController->registerAction($_POST['nombre'],
                                        $_POST['email'], 
                                        $_POST['password']);
        break;
    
    case 'verify':
        $userController->loginIn();
        break;
    
    case 'logout':
        $userController->logout();
        break;

    // Vista de heroes con el filtro.
    case 'heroes';
        if ( !empty($params[1])){
            $heroeController->showHeroes($params[1]);
        }else{
            $heroeController->showHeroes();}
        break;
    
    // Vista datos del heroe.
    case 'heroe';
        if ( !empty($params[1])){
            $heroeController->showHeroe($params[1]);
        }else{
            $heroeController->showHeroe();}
        break;
    
    // TABLA Y ABM HEROES
    case 'tabla-heroes':
        $heroeController->tablaHeroes();
        break;
        
    case 'agregarheroe':
        $heroeController->addHero();
        break;
    
    case 'eliminarheroe':
        if (isset($params[1])){
            $heroeController->deleteHero($params[1]);
        }else{
            $heroeController->showHome();}
        break;
        
    case 'editarheroe':
        if(isset($params[1])){
            $heroeController->modifyHero($params[1]);
        }else{
            $userController->showHome();}
        break;
    
    // TABLA Y ABM ATRIBUTOS
    case 'tabla-atributos':
        $atributoController->tablaAtributos();
        break;
    
    case 'agregaratributo':
        $atributoController->addAtributo();
        break;

    case 'eliminaratributo':
        if (isset($params[1])){
            $atributoController->deleteAtributo($params[1]);
        }else{
            $heroeController->showHome();}
        break;
    
    case 'editaratributo':
        if(isset($params[1])){
            $atributoController->modifyAtributo($params[1]);
        }else{
            $userController->showHome();}
        break;

    case 'error':
        $userController->missingHero();
        break;

    default:
        echo('<h1>Error 404, pagina no encontrada.</h1>');
    break;
}