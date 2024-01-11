<section class="hostiko-banner-whmcs">
    <nav class="master-breadcrumb" aria-label="breadcrumb">
        <div class="container">
            <h1 class="title-heading">{$pagetitle}</h1>
            {include file="$template/includes/breadcrumb.tpl"}
        </div>
    </nav>
    {literal}
        <script type="text/javascript">
            const queryParams = new URLSearchParams(window.location.search);
            var page_login_temp= queryParams.get('rp');
            if(page_login_temp == '/login'){
                $(".breadcrumb").append('<li class="breadcrumb-item active" aria-current="page">Login</li>')
            }
            
        </script>
    {/literal}
</section>