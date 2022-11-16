{include file="templates/header.tpl"}
  <section class="gradient-custom">
    <div class="container py-1">
      <div class="row d-flex justify-content-center align-items-center">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <button class="btn ms-2 my-1 text-primary btn-primary link-light text-decoration-none" type="submit">  
            <a href="{BASE_URL}heroes" class="text-decoration-none link-light">Volver</a>
          </button>
          <div class="card bg-dark text-white" style="border-radius: 1rem;">
            <div class="card-body p-4 text-center">

              <div class="tabl py-4 p-1">
                <h1 class="text-warning ms-2"> Tabla de Atributos </h1>
                <p class="ps-1">Agregue Atributos, eliminelos o modifique datos de uno!</p>
                <p class="ps-1">(Eliminar un atributo puede causar la eliminacion de los heroes que posean el mismo.)</p>
                <table class="table my-0 ps-3">
                  <thead class="bg-light">
                    <tr>
                        <th scope="col"><p>Nombre</p></th>
                        <th scope="col"><p>Accion</p></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <form action="agregaratributo" method="POST">
                          <td><div class="my-2"><input class="my-5 py-2 ps-3" type="text" name="nombre" placeholder="Agregar Nombre *" required></div></td>
                          <td><div class="my-5"><button type="submit" class="btn btn-success my-2 py-2 ps-2">Agregar Atributo</button></div></td>    
                      </form>
                    </tr>
                  <tfoot>
                  {foreach from=$tablaAtributos item=$atributo}
                    <tr>
                        <form action="editaratributo/{$atributo->id_atributo}" method="POST">
                            <td><div class="{$atributo->nombre} btn-border size- py-1 ps-1 px-1 ms-3 my-5"><input class="form-control td_size_atributos" type="text" name="nombre" value="{$atributo->nombre}"></div></td><td>
                            <div class="my-5">
                              <button type="submit" class="btn btn-secondary my-1 py-2 ps-2">Aplicar</button>
                              <a class="btn btn-danger my-1 py-2 ps-2" id="borrar" href="{BASE_URL}eliminaratributo/{$atributo->id_atributo}">borrar</a></div></td>
                        </form>
                    </tr>
                  {/foreach}
                  </tfoot>
                  </tbody>
                </table>
              </div>
          </div>
        </div>
      </div>
    </div>
  </section>

{include file="templates/footer.tpl"}