//aqui va a estar el codigo de usuarios.model.js

function init() {
  $("#frm_lavadoras").on("submit", function (e) {
    guardaryeditar(e);
  });
}

$().ready(() => {
  todos();
});

var todos = () => {
  var html = "";
  $.get("../../Controllers/lavadoras.controller.php?op=todos", (res) => {
    console.log(res);
    res = JSON.parse(res);
    $.each(res, (index, valor) => {
      html += `<tr>
                <td>${index + 1}</td>
                <td>${valor.modelo}</td>
                <td>${valor.numserie}</td>
                <td>${valor.tipolavadora}</td>
                <td>${valor.precio}</td>
                <td>${valor.fabrica}</td>
            <td>
            <button class='btn btn-success' onclick='editar(${
              valor.lavadoraId
            })'>Editar</button>
            <button class='btn btn-danger' onclick='eliminar(${
              valor.lavadoraId
            })'>Eliminar</button>
            <button class='btn btn-info' onclick='ver(${
              valor.lavadoraId
            })'>Ver</button>
            </td></tr>
                `;
    });
    $("#tabla_lavadoras").html(html);
  });
};

var guardaryeditar = (e) => {
  e.preventDefault();
  var dato = new FormData($("#frm_lavadoras")[0]);
  var ruta = "";
  var lavadoraId = document.getElementById("lavadoraId").value;
  if (lavadoraId > 0) {
    ruta = "../../Controllers/lavadoras.controller.php?op=actualizar";
  } else {
    ruta = "../../Controllers/lavadoras.controller.php?op=insertar";
  }
  $.ajax({
    url: ruta,
    type: "POST",
    data: dato,
    contentType: false,
    processData: false,
    success: function (res) {
      console.log(res)
      res = JSON.parse(res);
      if (res == "ok") {
        Swal.fire("lavadoras", "Registrada con éxito", "success");
        todos();
        limpia_Cajas();
      } else {
        Swal.fire("lavadoras", "Error al guardar, intente mas tarde", "error");
      }
    },
  });
};
var cargaLavadoras = () => {
  return new Promise((resolve, reject) => {
    $.post("../../Controllers/lavadoras.controller.php?op=todos", (res) => {
      res = JSON.parse(res);
      var html = "";
      $.each(res, (index, val) => {
        html += `<option value="${val.lavadoraId}"> ${val.Nombre}</option>`;
      });
      $("#lavadoraId").html(html);
      resolve();
    }).fail((error) => {
      reject(error);
    });
  });
};

var editar = async (lavadoraId) => {
  await cargaLavadoras();
  $.post(
    "../../Controllers/lavadoras.controller.php?op=uno",
    { lavadoraId: lavadoraId },
    (res) => {
      res = JSON.parse(res);
      
      $("#lavadoraId").val(res.lavadoraId);
      $("#modelo").val(res.modelo);
      $("#numserie").val(res.numserie);
      $("#tipolavadora").val(res.tipolavadora);
      $("#precio").val(res.precio);
      $("#fabrica").val(res.fabrica);
      //document.getElementById("lavadoraIdd").value = res.lavadoraId;

    }
  );
  $("#Modal_lavadoras").modal("show");
};

var eliminar = (lavadoraId) => {
  Swal.fire({
    title: "lavadoras",
    text: "Esta seguro de eliminar la lavadora",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#d33",
    cancelButtonColor: "#3085d6",
    confirmButtonText: "Eliminar",
  }).then((result) => {
    if (result.isConfirmed) {
      $.post(
        "../../Controllers/lavadoras.controller.php?op=eliminar",
        { lavadoraId: lavadoraId },
        (res) => {
          res = JSON.parse(res);
          if (res === "ok") {
            Swal.fire("lavadoras", "lavadora Eliminado", "success");
            todos();
          } else {
            Swal.fire("Error", res, "error");
          }
        }
      );
    }
  });

  impia_Cajas();
};

var limpia_Cajas = () => {
    document.getElementById("lavadoraId").value = "";
    document.getElementById("modelo").value = "";
    document.getElementById("numserie").value = "";
    document.getElementById("tipolavadora").value = "";
    document.getElementById("precio").value = "";
    document.getElementById("fabrica").value = "";
  $("#Modal_lavadoras").modal("hide");
};
init();

