<section class="hostiko-domain-search">
    {if $registerdomainenabled || $transferdomainenabled}
        <form method="post" action="domainchecker.php" id="frmDomainHomepage">
            <input type="hidden" name="token" value="b0037d84a01aab66eb3c8ef872ec296b3eebe05f">
                <div class="home-domain-search bg-white">
                    <div class="container">
                        <div class="clearfix position-relative">
                            <h2 class="text-center">Secure your domain name</h2>
                            <input type="hidden" name="transfer">
                            <div class="input-group-wrapper">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="domain" placeholder="eg. example.com" autocapitalize="none">
                                    <span class="input-group-append d-none d-sm-block">
                                        <button type="submit" class="btn btn-primary" id="btnDomainSearch">
                                            Search
                                        </button>
                                        <button type="submit" id="btnTransfer" data-domain-action="transfer" class="btn btn-success">
                                            Transfer
                                        </button>
                                    </span>
                                </div>
                            </div>
                            <div class="row d-sm-none">
                                <div class="col-6">
                                    <button type="submit" class="btn btn-primary btn-block" id="btnDomainSearch2">
                                        Search
                                    </button>
                                </div>
                                <div class="col-6">
                                    <button type="submit" id="btnTransfer2" data-domain-action="transfer" class="btn btn-success btn-block">
                                        Transfer
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                   <div class="search-box search-box1">
                                       <div class="content-top">
                                            <img src="{$WEB_ROOT}/templates/{$template}/layouts/wp-{$layoutnotset}/assets/images/com.png">
                                            <p class="mb-0 text">Satisfy the world’s buyers with .com domain</p>
                                        </div>
                                        <div class="content-lower">
                                            <span>Price: <span class="value">$10.99</span> was $20.99</span>
                                        </div>
                                   </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                   <div class="search-box search-box2">
                                       <div class="content-top">
                                            <img src="{$WEB_ROOT}/templates/{$template}/layouts/wp-{$layoutnotset}/assets/images/fun.png">
                                            <p class="mb-0 text">Satisfy the world’s buyers with .com domain</p>
                                        </div>
                                        <div class="content-lower">
                                            <span>Price: <span class="value">$10.99</span> was $20.99</span>
                                        </div>
                                   </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                   <div class="search-box search-box3">
                                       <div class="content-top">
                                            <img src="{$WEB_ROOT}/templates/{$template}/layouts/wp-{$layoutnotset}/assets/images/shop.png">
                                            <p class="mb-0 text">Satisfy the world’s buyers with .com domain</p>
                                        </div>
                                        <div class="content-lower">
                                            <span>Price: <span class="value">$10.99</span> was $20.99</span>
                                        </div>
                                   </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                                   <div class="search-box search-box4">
                                       <div class="content-top">
                                            <img src="{$WEB_ROOT}/templates/{$template}/layouts/wp-{$layoutnotset}/assets/images/tech.png">
                                            <p class="mb-0 text">Satisfy the world’s buyers with .com domain</p>
                                        </div>
                                        <div class="content-lower">
                                            <span>Price: <span class="value">$10.99</span> was $20.99</span>
                                        </div>
                                   </div>
                                </div>
                            </div>

                            <a href="{$WEB_ROOT}/index.php?rp=/domain/pricing" class="btn btn-link btn-sm float-right">View all pricing<i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
        </form>
    {/if}
</section>