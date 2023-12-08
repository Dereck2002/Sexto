<?php
require_once('../Models/cls_lavadoras.model.php');
$lavadoras = new Clase_Lavadoras;
switch ($_GET["op"]) {
    case 'todos':
        $datos = array(); //defino un arreglo
        $datos = $lavadoras->todos(); //llamo al modelo de usuarios e invoco al procedimiento todos y almaceno en una variable
        while ($fila = mysqli_fetch_assoc($datos)) { //recorro el arreglo de datos
            $todos[] = $fila; 
        }
        echo json_encode($todos); //devuelvo el arreglo en formato json
        break;
    case "uno":
        $lavadoraId = $_POST["lavadoraId"]; //defino una variable para almacenar el id del usuario, la variable se obtiene mediante POST
        $datos = array(); //defino un arreglo
        $datos = $lavadoras->uno($lavadoraId); //llamo al modelo de usuarios e invoco al procedimiento uno y almaceno en una variable
        $uno = mysqli_fetch_assoc($datos); //recorro el arreglo de datos
        echo json_encode($uno); //devuelvo el arreglo en formato json
        break;
    case 'insertar':
        $modelo = $_POST["modelo"];
        $numserie = $_POST["numserie"];
        $tipolavadora = $_POST["tipolavadora"];
        $precio= $_POST["precio"];
        $fabrica = $_POST["fabrica"];
        $datos = array(); //defino un arreglo
        $datos = $lavadoras->insertar($modelo, $numserie ,$tipolavadora, $precio, $fabrica); //llamo al modelo de usuarios e invoco al procedimiento insertar
        echo json_encode($datos); //devuelvo el arreglo en formato json
        break;
    case 'actualizar':
        $lavadoraId = $_POST["lavadoraId"];
        $modelo = $_POST["modelo"];
        $numserie = $_POST["numserie"];
        $tipolavadora = $_POST["tipolavadora"];
        $precio= $_POST["precio"];
        $fabrica = $_POST["fabrica"];
        $datos = array(); //defino un arreglo
        $datos = $lavadoras->actualizar($lavadoraId, $modelo, $numserie,$tipolavadora, $precio, $fabrica); //llamo al modelo de usuarios e invoco al procedimiento actual
        echo json_encode($datos); //devuelvo el arreglo en formato json
        break;
    case 'eliminar':
        $lavadoraId = $_POST["lavadoraId"]; //defino una variable para almacenar el id del usuario, la variable se obtiene mediante POST
        $datos = array(); //defino un arreglo
        $datos = $lavadoras->eliminar($lavadoraId); //llamo al modelo de usuarios e invoco al procedimiento uno y almaceno en una variable
        echo json_encode($datos); //devuelvo el arreglo en formato json
        break;
}
