<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>

<body class="primary-bg-color" data-phone-cc-input="{$phoneNumberInputStyle}">

    {$headeroutput}

        {if !$loggedin}
            {include file="$template/layouts/wp-{$layoutnotset}/topbar{$layoutnotset}.tpl"}
        {/if}

    <header id="header" class="header">
        {if $loggedin}
            <div class="topbar">
                <div class="container">
                    <div class="d-flex align-items-center">
                        <div class="mr-auto">
                            <button type="button" class="btn" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                                <i class="far fa-flag"></i>
                                {if count($clientAlerts) > 0}
                                    {count($clientAlerts)}
                                    <span class="d-none d-sm-inline">Notifications</span>
                                {else}
                                    <span class="d-sm-none">0</span>
                                    <span class="d-none d-sm-inline">{lang key='nonotifications'}</span>
                                {/if}
                            </button>
                            <div id="accountNotificationsContent" class="w-hidden">
                                <ul class="client-alerts">
                                {foreach $clientAlerts as $alert}
                                    <li>
                                        <a href="{$alert->getLink()}">
                                            <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                            <div class="message">{$alert->getMessage()}</div>
                                        </a>
                                    </li>
                                {foreachelse}
                                    <li class="none">
                                        {lang key='notificationsnone'}
                                    </li>
                                {/foreach}
                                </ul>
                            </div>
                            <form method="post" action="{routePath('knowledgebase-search')}" class="d-inline-block ml-auto logged_in_search">
                                <div class="input-group search d-none d-xl-flex">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-default" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                    <input class="form-control appended-form-control font-weight-light" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                                </div>
                            </form>
                        </div>

                        <div class="ml-auto">
                            <div class="input-group active-client" role="group">
                                {*<div class="input-group-prepend d-none d-md-inline">
                                    <span class="input-group-text">Logged in as:</span>
                                </div>
                                *}
                                <div class="btn-group">
                                    <ul class="sign-in-topbar-right">
                                        <li class="nav-item ml-3">
                                            <a class="btn nav-link cart-btn" href="cart.php?a=view">
                                                <i class="far fa-shopping-cart"></i>
                                                <span id="cartItemCount" class="badge badge-info">{$cartitemcount}</span>
                                                <span class="sr-only">{lang key="carttitle"}</span>
                                            </a>
                                        </li>
                                        {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                                    </ul>
                                    {*<a href="{$WEB_ROOT}/clientarea.php?action=details" class="btn btn-active-client">
                                        <span>
                                            {if $client.companyname}
                                                {$client.companyname}
                                            {else}
                                                {$client.fullName}
                                            {/if}
                                        </span>
                                    </a>
                                    <a href="{routePath('user-accounts')}" class="btn" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
                                        <i class="fad fa-random"></i>
                                    </a>
                                    *}
                                    {if $adminMasqueradingAsClient || $adminLoggedIn}
                                        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                                            <i class="fas fa-redo-alt"></i>
                                            <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        <div class="navbar navbar-light">
            <div class="container">
                <a class="navbar-brand" href="https://hostiko.com/layout{$layoutnotset}">
                    <img src="{$WEB_ROOT}/templates/{$template}/layouts/wp-{$layoutnotset}/assets/images/logo{$layoutnotset}.png">
                </a>
                
                <div class="navbar navbar-expand-xl main-navbar-wrapper">
                    <div class="collapse navbar-collapse" id="mainNavbar">
                        <form method="post" action="{routePath('knowledgebase-search')}" class="d-xl-none">
                            <div class="input-group search w-100 mb-2">
                                <div class="input-group-prepend">
                                    <button class="btn btn-default" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                                <input class="form-control prepended-form-control" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                            </div>
                        </form>
                        <ul class="navbar-nav mr-auto">
                            {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                        </ul>
                        {*<ul class="navbar-nav ml-auto">
                            {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                        </ul>*}
                    </div>
                   
                </div>
                <ul class="navbar-nav toolbar d-xl-none">
                    <li class="nav-item ml-3 d-xl-none">
                        <button class="btn nav-link" type="button" data-toggle="collapse" data-target="#mainNavbar">
                            <span class="fas fa-bars"></span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
        
    </header>
   
    {include file="$template/includes/network-issues-notifications.tpl"}
    {include file="$template/layouts/wp-{$layoutnotset}/banner{$layoutnotset}.tpl"}
  
    {include file="$template/includes/verifyemail.tpl"}

    {if $templatefile == 'homepage'}
            {include file="$template/layouts/wp-{$layoutnotset}/domain-search{$layoutnotset}.tpl"}

        {if !$loggedin}
            {include file="$template/layouts/wp-{$layoutnotset}/pricesec{$layoutnotset}.tpl"}
        {/if}
    {/if}
    
 
    <section id="main-body">
        <div class="{if !$skipMainBodyContainer}container{/if}">
            <div class="row">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="col-lg-4 col-xl-3 ">
                    <div class="sidebar">
                        {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-none d-lg-block sidebar">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{else}col-12{/if} primary-content">

