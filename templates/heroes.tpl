{include file="header.tpl"}

<section class="gradient-custom">
  <div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <h1 class="text-warning bg-dark">HÉROES</h1>
            <p>Filtre héroes por atributo</p>

            <div class="container w-75 d-flex flex-wrap my-2 mb-3">
              {foreach from=$atributos item=$atributo}    
                <div class="ms-1">
                    <button class="btn my-3 my-sm-1 text-primary btn-secondary {$atributo->nombre}" type="submit">
                      <a href="{BASE_URL}heroes/{$atributo->id_atributo}" class='link-light text-decoration-none'>{$atributo->nombre}</a>
                    </button>
                </div>
              {/foreach}
            </div>

            <div class="container w-75 d-flex flex-wrap my-2 mb-3 ">
              {foreach from=$heroes item=$heroe}
                <div class="mx-auto border p-3 bg-dark ">
                  <a class='text-decoration-none' href="{BASE_URL}heroe/{$heroe->id_heroe}">
                    <p>{$heroe->nombre}</p>
                  </a>
                </div>
              {/foreach}
            </div>
            <!-- $smarty.get.action lo uso para poder detectar el cambio de URL para mostrar el boton -->
            {if $smarty.get.action != 'heroes' }
              <button class="btn my-3 my-sm-0 text-primary btn-secondary link-light text-decoration-none" type="submit">
                <a href="{BASE_URL}heroes" class="text-decoration-none link-light">Volver</a>
              </button>
            {/if}

          </div>
        </div>
        {if $smarty.session.logged|default and $smarty.session.logged}
          <div class="d-flex ms-5">
            <div class="my-2 ms-5">
              <button class="btn my-3 my-sm-0 text-primary btn-secondary link-light text-decoration-none" type="submit">
                <a href="{BASE_URL}tabla-heroes" class="text-decoration-none link-light"> Modificar Héroes</a>
              </button>
            </div>
            <div class="my-2 ms-4">
              <button class="btn my-3 my-sm-0 text-primary btn-secondary link-light text-decoration-none" type="submit">
                <a href="{BASE_URL}tabla-atributos" class="text-decoration-none link-light"> Modificar Atributos</a>
              </button>
            </div>
          </div>   
        {/if}
   
      </div>
    </div>
  </div>
</section>

{include file="footer.tpl"}