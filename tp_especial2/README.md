API de opciones

Descripción:

La API de opciones proporciona acceso a los recursos relacionados con el manejo  ABM de la tabla de opciones de un restaurante.

URL base():
https://www.ejemplo.com(lugar donde va a estar alojado del sitio).


Funciopnalidades segun endpoints:

1- GET /api/opcion
Devuelve todas las opciones disponibles en la tabla.

2- GET /api/opcion/:id
Devuelve una opcion especifica que requerimos mediante el parametro :id(int).

3- GET /api/opcion?campo=value1&orden=value2
Devuelve la lista de opciones ordenadas por un campo especifico que pasamos por parametro GET "value1",
y en un orden especifico, indicado tambien por parametros GET en "value2" , que puede tomar el valor de "ASC",para ordenarse de forma ascendente, y "DESC",para ordenarse de forma descendente.

4- POST /api/opcion
Permite crear una nueva opcion.
para esto en el body del request es necesario incluir la siguiente informacion en formato json:

{
    "nombre": "nombre de la opcion"(string),
    "descripcion": "descripcion de la opcion"(string),
    "img_opcion": "link de la imagen"(string),
    "precio": numero(float),
    "id_carta": numero(int)
}

5- PUT api/opcion/:id
Permite modificar una opcion especifica, la cual se indica con el parametro :id(int).
El formato es muy similar al de crear una opcion, se debe enviar en el body del request la informacion completa que se quiere modificar 

{
    "nombre": "nombre de la opcion"(string),
    "descripcion": "descripcion de la opcion"(string),
    "img_opcion": "link de la imagen"(string),
    "precio": numero(float),
    "id_carta": numero(int)
}

6- DELETE api/opcion/:id
Permite borrar una opcion de la BBDD, pasandole el :id(int) de la opcion especifica que se desea borrar.


Errores
La API utiliza los siguientes códigos de error en las respuestas:

200 OK: La solicitud se completó exitosamente.
201 created: Se creo correctamente un nuevo recurso.
400 Bad Request: La solicitud es inválida o no se proporcionaron todos los parámetros requeridos.
404 Not Found: El recurso solicitado no existe.
500 Internal Server Error: Error interno del servidor.
