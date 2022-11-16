<?php
require_once "Controller.php";
require_once './app/model/UserModel.php';
require_once './app/view/UserView.php';
require_once "./app/-helper/AuthHelper.php";

class UserController extends Controller{

    public function __construct(){
        parent::__construct(new UserView(),new UserModel());
    }

    public function showHome(){
        $this->view->showHome();
    }

    public function showLogin(){
        $this->view->showLogin();
    }

    public function showRegister(){
        $this->view->showRegister();
    }

    public function missingHero(){
        $this->view->missingHero();
    }
    
    public function registerAction($nombre, $email, $password){
        $this->model->getUser($email);
        if (!empty($user)){
            $this->redirectRoute('home');
        }else {
            $this->registerUser($nombre, $email, $password);
        }
    }

    private function registerUser($nombre, $email, $password){
        session_start();
        $_SESSION['logged'] = true;
        $_SESSION['rol'] = 'user';
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
        $this->model->register($nombre, $email, $hashedPassword);
        $this->redirectRoute('home');
    }

    function loginIn(){
        $username= $_POST['email'];
        $password= $_POST['passwd'];
        $user= $this->model->getUserByUsername($username);
         if($user && password_verify($password, $user->passwd)){
            session_start();
            $_SESSION['logged']=true;
            var_dump("login", $_SESSION);
            $this->redirectRoute('home');
            session_commit();
         }
         else {
            $this->view->showLogin("El email o contraseña son incorrectas");
         }
    }

    public function logout(){
        session_start(); 
        session_unset();
        session_destroy();
        $this->redirectRoute('home');
    }
}