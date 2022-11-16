<?php

require_once "Model.php";

class HeroeModel extends Model{

    public function __construct(){
        parent::__construct();
    }

    function getHeroeById($id_heroe){
        $sentencia = $this->db->prepare("SELECT * FROM heroe WHERE id_heroe = ?");
        $sentencia->execute(array($id_heroe));
        $objeto = $sentencia->fetch(PDO::FETCH_OBJ);
        if (!$objeto) Controller::redirectRoute('error');
        return $objeto;
    }

    function getHeroes(){
        $sentencia = $this->db->prepare("SELECT * FROM heroe ORDER BY id_heroe DESC");
        $sentencia->execute(array());
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
     }

    public function getHeroesByAtribute($id_atributo){
        $sentencia = $this->db->prepare("SELECT * FROM heroe WHERE id_atributo_fk = ?");
        $sentencia->execute(array($id_atributo));
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    public function editarHeroe($id_heroe, $nombre, $type_atack, $fk, $descripcion){
        $sentencia = $this->db->prepare("   UPDATE 
                                                `heroe` 
                                            SET 
                                                `nombre`=?,
                                                `type_atack`=?,
                                                `id_atributo_fk`=?,
                                                `descripcion`=? 
                                            WHERE 
                                                `id_heroe`=?");
        $sentencia->execute(array($id_heroe, $nombre, $type_atack, $fk, $descripcion));
    }

    public function borrarHero($id_heroe){
        $sentencia = $this->db->prepare("DELETE FROM heroe WHERE id_heroe=?");
        $sentencia->execute(array($id_heroe));
    }

    public function agregarHeroe($nombre, $type_atack, $id_atributo_fk, $descripcion){
        $sentencia= $this->db->prepare("INSERT INTO heroe(nombre, type_atack, id_atributo_fk, descripcion) VALUE(?,?,?,?)");
        $sentencia->execute(array($nombre, $type_atack, $id_atributo_fk, $descripcion));
    }
}