<nav class="navbar navbar-expand-lg navbar-light bg-dark">
  
  <a class="navbar-brand ms-2 bg-secondary" href="{BASE_URL}home">DOTA 2</a>
  {if $smarty.session.logged|default and $smarty.session.logged}
    <div class="navbar-collapse" id="navbarSupportedContent">
      <button class="btn btn-outline-success my-2 my-sm-0 btn btn-success" type="submit"><a href="{BASE_URL}logout" class="link-light text-decoration-none">LOG OUT</a></button>
    </div>
  {else}
    <div class="navbar-collapse" id="navbarSupportedContent">
      <button class="btn btn-outline-success my-2 my-sm-0 btn btn-success link-light" type="submit"><a href="{BASE_URL}login" class="link-light text-decoration-none">Login</a></button>
    </div>
  {/if}

</nav>