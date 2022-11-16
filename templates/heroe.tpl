{include file="header.tpl"}

<section class="gradient-custom">
  <div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            
            <h2 class="text-warning bg-dark">{$heroe->nombre}</h2>
            <p>Tipo de ataque : {$heroe->type_atack}</p>
            <p>{$heroe->descripcion}</p>
            
            <button class="btn my-3 my-sm-0 text-primary btn-secondary link-light text-decoration-none" type="submit">
              <a href="{BASE_URL}heroes" class="text-decoration-none link-light">Volver</a>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

{include file="footer.tpl"}