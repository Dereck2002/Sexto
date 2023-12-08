<?php require_once('../html/head2.php') ?>




<div class="row">

    <div class="col-lg-8 d-flex align-items-stretch">
        <div class="card w-100">
            <div class="card-body p-4">
                <h5 class="card-title fw-semibold mb-4">Lista de Lavadoras</h5>

                <div class="table-responsive">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal_lavadoras">
                        Nueva Lavadora
                    </button>
                    <table class="table text-nowrap mb-0 align-middle">
                        <thead class="text-dark fs-4">
                            <tr>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">#</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Modelo</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">numero de serie</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Tipo de lavadora</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">precio</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">fabrica</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Opciones</h6>
                                </th>
                            </tr>
                        </thead>
                        <tbody id="tabla_lavadoras">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Ventana Modal-->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="Modal_lavadoras" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" id="frm_lavadoras">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Lavadoras</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <input type="hidden" name="lavadoraId" id="lavadoraId">
                  
                    <div class="form-group">

                        <label for="modelo">Modelo</label>
                        <select type="text" required class="form-control" name="modelo" id="modelo" >
                            <option value="lg">LG</option>
                            <option value="samsung">Samsung</option>
                            <option value="indurama">Indurama</option>
                            <option value="mabe">Mabe</option>
                            <option value="boshc">Bosch</option>
                            <option value="electrolux">Electrolux</option>
                            <option value="whirlpool">Whirlpool</option>
                        </select>

                        <label for="numserie">Numero de serie</label>
                        <input type="text" required class="form-control" id="numserie" name="numserie" placeholder="Ingrese el nombre de serie">

                        <label for="tipolavadora">Tipo de Lavadora</label>
                        <select type="text" required class="form-control" name="tipolavadora" id="tipolavadora" class="form-group" placeholder="Seleccione el tipo de lavadora">
                            <option value="lavaplatos">Lavadora para platos</option>
                            <option value="lavaropa">lavaadora para ropa</option>
                            <option value="secadora">Secadora</option>
                        </select>

                        <label for="precio">Precio</label>
                        <input type="int" required class="form-control" id="precio" name="precio" placeholder="Ingrese el precio de la lavadora">

                        <label for="fabrica">Fabrica</label>
                        <input type="text" required class="form-control" id="fabrica" name="fabrica" placeholder="Ingrese el nombre de la fabrica">
              
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Grabar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php require_once('../html/script2.php') ?>

<script src="lavadoras.js"></script>