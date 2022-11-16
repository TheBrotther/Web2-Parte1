{include file="header.tpl"}
  <button class="btn ms-2 my-1 text-primary btn-primary link-light text-decoration-none" type="submit">
    <a href="{BASE_URL}heroes" class="text-decoration-none link-light">Volver</a>
  </button>
  <div class="tabla bg-dark my-1" >
  <div class="tabla py-4">
    <div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><h1 class="text-warning ms-5"> Tabla de Héroes </h1></div></div></div></div></div></div></div></div></div>
    <div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><div class="ms-5"><p class="ps-1 text-white">Agregue héroes, eliminelos o modifique datos de uno. Darle a "Aplicar" para confirmar cambios.</p></div></div></div></div></div></div></div>
    <table class="table my-0 ps-3">
      <thead class=" text-white">
        <tr>
            <th scope="col"><p class="ms-3 ">Nombre</p></th>
            <th scope="col"><p class="ms-3">Tipo De Ataque</p></th>
            <th scope="col"><p class="ms-2">Atributo</p></th>
            <th scope="col"><p class="ms-3">Descripcion</p></th>
            <th scope="col"><p class="ms-4">Acciones</p></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <form action="agregarheroe" method="POST">
              <td><input class="my-5 py-2 ps-3" type="text" name="nombre" placeholder="Agregar Nombre *" required></td>
              <td><input class="my-5 py-2 ps-1" type="text" name="type_atack" placeholder="Agregar Tipo de Ataque *" required></td>
              <td>
                <select class="form-select my-5 py-2 ps-3" id="inputGroupSelect01" name="id_atributo_fk">
                  <optgroup label="Elegir">
                  {foreach from=$atributos item=$atributo}
                    <option value="{$atributo->id_atributo}">{$atributo->nombre}</option>
                  {/foreach}
                </select>
              </td>
              <td><textarea class="descripcion my-1 ps-3" name="descripcion" rows="6" cols="60" placeholder="Descripcion(Opcional)"></textarea></td>
              <td><div class="my-5"><button type="submit" class="btn btn-success my-1 py-2 ps-2">Agregar Héroe</button></div></td>    
          </form>
        </tr>
        <tfoot>
        {foreach from=$tablaHeroes item=$heroe}
          <tr>
            <form action="editarheroe/{$heroe->id_heroe}" method="POST">
              <td><input class="form-control td_size_heroes" type="text" name="nombre" value="{$heroe->nombre}"></td>
              <td><input class="form-control td_size_heroes" type="text" name="type_atack" value="{$heroe->type_atack}"></td>
              <td>
              {foreach from=$atributos item=$atributo}
                {if $heroe->id_atributo_fk == $atributo->id_atributo}
                  <div class="{$atributo->nombre} btn-border py-1 ps-1 px-1">
                {/if}
              {/foreach}
                
                    <select class="form-select"  id="inputGroupSelect01" name="fk">
                    <optgroup label="Elegir">
                    {foreach from=$atributos item=$atributo}
                      {if $heroe->id_atributo_fk == $atributo->id_atributo}
                        <option  value="{$atributo->id_atributo}" selected>{$atributo->nombre}</option>
                      {else}
                        <option value="{$atributo->id_atributo}" >{$atributo->nombre}</option>
                      {/if}
                    {/foreach}
                  </select>
                </div>
              </td>
              <td><textarea class="descripcion form-control" name="descripcion" rows="6" cols="55">{$heroe->descripcion}</textarea></td><td>
                <div class="my-5">
                  <button type="submit" class="btn btn-secondary my-1 py-2 ps-2">Aplicar</button>
                  <a class="btn btn-danger my-1 py-2 ps-2" id="borrar" href="{BASE_URL}eliminarheroe/{$heroe->id_heroe}">borrar</a>
                </div>
              </td>
            </form>
          </tr>
          {/foreach}
          </tfoot>
      </tbody>
    </table>
  </div>

{include file="footer.tpl"}