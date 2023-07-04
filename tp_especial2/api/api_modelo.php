<?php


class apimodelo
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=restaurante;charset=utf8', 'root', '');
    }

    public function getAll()
    {
        $query = $this->db->prepare('SELECT * FROM opcion');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    
    public function getFilter($campo,$orden)
    { 

        $consulta="SELECT * FROM opcion ORDER BY $campo $orden";
        $query = $this->db->prepare($consulta);
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
     // Retorna una clase de la opcion según el id pasado.
     
    public function get($idopcion)
    {
        $query = $this->db->prepare('SELECT * FROM opcion WHERE id_opcion = ?');
        $query->execute(array($idopcion));

        return $query->fetch(PDO::FETCH_OBJ);
    }
   
   // Guarda una tarea en la base de datos.
    public function save($nombre, $desc, $img_op, $precio, $id_carta)
    {
  
      $sentencia = $this->db->prepare("INSERT INTO opcion (nombre, descripcion, img_opcion, precio, id_carta) VALUES (?,?,?,?,?)");
  
      $sentencia->execute(array($nombre, $desc, $img_op, $precio, $id_carta));
  
      return $this->db->lastInsertId();
    }
    
  
    
     // Elimina una opcion de la BBDD según el id pasado.
     
    public function delete($idopcion) {
        $query = $this->db->prepare('DELETE FROM opcion WHERE id_opcion = ?');
        $query->execute([$idopcion]); 
    }

  
     // Permite modificar una opcion.
    
    public function update($nombre, $desc, $img_op, $precio, $id_carta, $id_opcion)
  {

    $sentencia = $this->db->prepare("UPDATE opcion SET nombre=?, descripcion=?, img_opcion=?, precio=?, id_carta=? WHERE id_opcion=?");

    $sentencia->execute(array($nombre, $desc, $img_op, $precio, $id_carta, $id_opcion));

      
  }
    
}
