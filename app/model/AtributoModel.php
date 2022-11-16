<?php

require_once "Model.php";

class AtributoModel extends model{

    public function __construct(){
        parent::__construct();
    }

    function getAtributos(){
        $sentencia = $this->db->prepare("SELECT * FROM atributo ORDER BY id_atributo DESC");
        $sentencia->execute(array());
        $atributos = $sentencia->fetchAll(PDO::FETCH_OBJ);
        return $atributos;
    }

    public function editarAtributo($id_atributo, $nombre){
        $sentencia = $this->db->prepare("   UPDATE 
                                                `atributo` 
                                            SET 
                                                `nombre`=?
                                            WHERE 
                                                `id_atributo`=?");
        $sentencia->execute(array($nombre, $id_atributo));
    }

    public function borrarAtributo($id_atributo){
        $sentencia = $this->db->prepare("DELETE FROM atributo WHERE id_atributo=?");
        $sentencia->execute(array($id_atributo));
    }

    public function agregarAtributo($nombre){
        $sentencia= $this->db->prepare("INSERT INTO atributo(nombre) VALUE(?)");
        $sentencia->execute(array($nombre));
        return $this->db->lastInsertId();
    }
}