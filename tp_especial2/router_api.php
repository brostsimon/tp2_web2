<?php
    require_once('router2.php');
    require_once('api/api_controller.php');
    
    // CONSTANTES PARA RUTEO
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

    $router = new Router();

    // rutas
    $router->addRoute("/opcion", "GET", "ApiController", "getOpciones");
    $router->addRoute("/opcion/:ID", "GET", "ApiController", "getOpcion");
    $router->addRoute("/opcion/:ID", "DELETE", "ApiController", "deleteOpcion"); 
    $router->addRoute("/opcion", "POST", "ApiController", "addOpcion");
    $router->addRoute("/opcion/:ID", "PUT", "ApiController", "updateOpcion");

    //run
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 
