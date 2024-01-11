{* {include file="orderforms/standard_cart/common.tpl"} *}
<link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/templates/orderforms/standard_cart/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
<script src="{$WEB_ROOT}/templates/orderforms/standard_cart/js/scripts.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/layouts/wp-{$layoutnotset}/assets/js/custom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<section class="pricing-carousel">
    <div class="container">
        <h2 class="text-center m-4">Browse Our Products/Services</h2>
        <ul class="nav nav-tabs" role="tablist">
            {assign var=val1 value=1}
            {foreach $allProducts as $groupID => $item}
                <li class="nav-item">
                    <a class="nav-link {if $val1 eq 1}active{/if}" data-toggle="tab" href="#tab-{$groupID}" role="tab">{$item.group}</a>
                </li>

                {assign var=val1 value=$val1+1}
            {/foreach}
            
            
        </ul>
        <!-- Tab panes -->

        {assign var=val value=1}

        <div class="tab-content">
            {foreach $allProducts as $groupID => $item}
             
                <div class="tab-pane {if $val eq 1}active{/if}" id="tab-{$groupID}" role="tabpanel">
                    <div class="owl-carousel hostiko_carousel ">
                        {foreach $item.products as $product}
                            
                            <div class="item">
                                <header>
                                    <span id="product{$product@iteration}-name">{$product.name}</span>
                                    {if $product.qty}
                                        <span class="qty">
                                            {$product.qty} {$LANG.orderavailable}
                                        </span>
                                    {/if}
                                </header>
                                 <div class="product-pricing" id="product{$product@iteration}-price">
                                        {if $product.bid}
                                            {$LANG.bundledeal}<br />
                                            {if $product.displayprice}
                                                <span class="price">{$product.displayprice}</span>
                                            {/if}
                                        {else}
                                            {if $product.pricing.hasconfigoptions}
                                                {$LANG.startingfrom}
                                                <br />
                                            {/if}
                                            <span class="price">{$product.pricing.minprice.price}</span>
                                            
                                            {if $product.pricing.minprice.cycle eq "monthly"}
                                                {$LANG.orderpaymenttermmonthly}
                                            {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                                {$LANG.orderpaymenttermquarterly}
                                            {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                                {$LANG.orderpaymenttermsemiannually}
                                            {elseif $product.pricing.minprice.cycle eq "annually"}
                                                {$LANG.orderpaymenttermannually}
                                            {elseif $product.pricing.minprice.cycle eq "biennially"}
                                                {$LANG.orderpaymenttermbiennially}
                                            {elseif $product.pricing.minprice.cycle eq "triennially"}
                                                {$LANG.orderpaymenttermtriennially}
                                            {/if}
                                            <br>
                                            {if $product.pricing.minprice.setupFee}
                                                <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                            {/if}
                                        {/if}
                                    </div>
                                <div class="product-desc">
                                    {if $product.featuresdesc}
                                        <p id="product{$product@iteration}-description">
                                            {$product.featuresdesc}
                                        </p>
                                    {/if}
                                    <ul>
                                        {foreach $product.features as $feature => $value}
                                            <li id="product{$product@iteration}-feature{$value@iteration}">
                                                <span class="feature-value">{$value}</span>
                                                {$feature}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                <footer>
                                    <a href="cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-success btn-sm" id="product{$product@iteration}-order-button">
                                        <i class="fas fa-shopping-cart"></i>
                                        {$LANG.ordernowbutton}
                                    </a>
                                </footer>
                            </div>
                        {/foreach}
                    </div>
                </div>

                {assign var=val value=$val+1}
            {/foreach}
        </div>
    </div>   
</section>