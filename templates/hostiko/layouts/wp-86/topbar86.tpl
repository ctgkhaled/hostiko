<section class="top-bar-section">
  <div class="container">
    <div class="top-bar">
      <ul class="top-bar-left-content">
        <li class="topbar-search">
          <form method="post" action="{routePath('knowledgebase-search')}" class="form-inline ml-auto">
            <div class="input-group search d-none d-xl-flex">
                <div class="input-group-prepend">
                    <button class="btn btn-default" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <input class="form-control appended-form-control font-weight-light" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
            </div>
          </form>
        </li>
      </ul>
      <ul class="top-bar-right-content">
        <li><a href="#"><i class="fas fa-comment-dots"></i></a></li>
        <li class="nav-item">
          <a class="btn nav-link cart-btn" href="cart.php?a=view">
              <i class="far fa-shopping-cart"></i>
              <span class="badge badge-info">{$cartitemcount}</span>
              <span class="sr-only">{lang key="carttitle"}</span>
          </a>
        </li>
        {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
      </ul>
      
    </div>
  </div>
</section>