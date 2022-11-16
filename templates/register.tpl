{include file="header.tpl"}

{if $smarty.session.logged|default and $smarty.session.logged}
  <h1 class="text-danger"> Solo usuarios no logueados!</h1>
{else}
  <section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card bg-dark text-white" style="border-radius: 1rem;">
            <div class="card-body p-5 text-center">

              <form action="registered" class="mx-1 mx-md-4" method="POST">
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Registro</p>
                <div class="d-flex flex-row align-items-center mb-4">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0">
                    <input type="text" id="nombre" name="nombre" class="form-control" required/>
                    <label class="form-label" for="nombre">Nombre</label>
                  </div>
                </div>
                <div class="d-flex flex-row align-items-center mb-4">
                  <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0">
                    <input type="email" id="email" name="email" class="form-control" required/>
                    <label class="form-label" for="email">Email</label>
                  </div>
                </div>
                <div class="d-flex flex-row align-items-center mb-4">
                  <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0">
                    <input type="password" id="password" name="password" class="form-control" required/>
                    <label class="form-label" for="password">Contraseña</label>
                  </div>
                </div>
                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  <button type="submit" class="btn btn-primary btn-lg">Registrate</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
{/if}

{include file="footer.tpl"}