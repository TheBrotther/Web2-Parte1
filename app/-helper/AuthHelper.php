<?php

class AuthHelper{

    public function __construct(){}

    public function checkLoggedIn(){
        $logged = isset($_SESSION['logged']);
        return $logged;
    }

    
}