<?php
require_once("api_modelo.php");
require_once("api_view.php");

class ApiController {

    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new apimodelo();
        $this->view = new JSONView();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function  getOpciones($params = null) {
       

        if (isset($_REQUEST)&&!empty($_REQUEST['campo'])&& !empty($_REQUEST['orden'])){
           
            $campo=$_REQUEST['campo'];
            $orden=$_REQUEST['orden'];

            $opciones = $this->model->getFilter($campo,$orden);
        $this->view->response($opciones, 200);

        }else{
            $opciones = $this->model->getAll();
        $this->view->response($opciones, 200);
        }
        
    }

    public function getOpcion($params = null) {
        $id = $params[':ID'];
        
        $opcion = $this->model->get($id);        
        if ($opcion)
            $this->view->response($opcion, 200);
        else
            $this->view->response("La opcion con el id={$id} no existe", 404);
    } 

   
    public function addOpcion($params = null) {
        $data = $this->getData();

        $id = $this->model->save($data->nombre, $data->descripcion, $data->img_opcion, $data->precio, $data->id_carta);
        
        $opcion = $this->model->get($id);
        if ($opcion)
            $this->view->response($opcion, 201);
        else
            $this->view->response("La opcion no fue creada", 500);

    }

 public function deleteOpcion($params = null) {
        $id = $params[':ID'];
        $opcion = $this->model->get($id);
        if ($opcion) {
            $this->model->delete($id);
            $this->view->response("La opcion fue borrada con exito.", 200);
        } else
            $this->view->response("La opcion con el id={$id} no existe", 404);
    }

    public function updateOpcion($params = null) {
        $idOpcion = $params[':ID'];
        $data = $this->getData();
        
        $opcion = $this->model->get($idOpcion);
        if ($opcion) {
            $this->model->update($data->nombre, $data->descripcion, $data->img_opcion, $data->precio, $data->id_carta, $idOpcion);
            $this->view->response("La opcion fue modificada con exito.", 201);
        } else
            $this->view->response("La opcion con el id={$idOpcion} no existe", 404);
    }

}
