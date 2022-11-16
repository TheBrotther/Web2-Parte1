{include file="header.tpl"}

{if $smarty.session.logged|default and $smarty.session.logged}
  <h1 class="text-danger"> Solo usuarios no logueados!</h1>
{else}
  <section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <form action="verify" class="my-2  form-group" method="POST">
            <div class="card bg-dark text-white" style="border-radius: 1rem;">
              <div class="card-body p-5 text-center">

                <div class="mb-md-5 mt-md-4 pb-5">
                <h2 class="fw-bold mb-2 text-uppercase">Iniciar Sesion</h2><br>
                {if $error}
                  <p class="text-danger">{$error}</p>
                {/if}
                <div class="form-outline form-white mb-4">
                  <input type="email" id="email" class="form-control form-control-lg" name="email" required/>
                  <label class="form-label" for="typeEmailX" >Email</label>
                </div>
                <div class="form-outline form-white mb-4">
                  <input type="password" id="password" class="form-control form-control-lg"  name="passwd" required/>
                  <label class="form-label" for="typePasswordX">Contraseña</label>
                </div>
                <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">Olvido su contraseña?</a></p>
                  <button class="btn btn-outline-light btn-lg px-5" type="submit">Entrar</button>
                </div>
                <div>
                  <p class="mb-0">No tienes una cuenta? <a href="register" class="text-white-50 fw-bold">Registrate!</a>
                  </p>
                </div>

              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
{/if}

{include file="footer.tpl"}