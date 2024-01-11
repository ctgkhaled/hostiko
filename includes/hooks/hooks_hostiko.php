<?php
add_hook('ClientAreaPage', 1, function($vars) {
    global $smarty;

    if (isset($_GET['layout']) && !empty($_GET['layout'])) {
        $_SESSION['hostiko_layout'] = $_GET['layout'];
    }

    $layout = 85;
    if (isset($_SESSION['hostiko_layout']) && !empty($_SESSION['hostiko_layout'])) {
        $layout = $_SESSION['hostiko_layout'];
    }
    
    $smarty->assign('layoutnotset', $layout);

    if ($vars['template'] == 'hostiko' && $vars['filename'] == 'index' && !isset($_GET['rp'])) {

        $products = [];

        $orderfrm = new WHMCS\OrderForm();
        $hostiko_productGroups = $orderfrm->getProductGroups(true);

        foreach($hostiko_productGroups as $group) {
            $tempArr = [];
            
            try {
                $tempArr = $orderfrm->getProducts($group->id, true, true);
            } catch (Exception $e) {
                $logs[$group->id] = $e->getMessage();
            }

            if (!empty($tempArr)) {
          
                $basePath = ROOTDIR . DIRECTORY_SEPARATOR . "templates" . DIRECTORY_SEPARATOR . \App::getClientAreaTemplate()->getName() . DIRECTORY_SEPARATOR . 'layouts' . DIRECTORY_SEPARATOR . 'wp-' . $layout . DIRECTORY_SEPARATOR . 'assets' . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'price-icons' . DIRECTORY_SEPARATOR;
                $basePathforicon = "/whmcs-templates" . DIRECTORY_SEPARATOR . "templates" . DIRECTORY_SEPARATOR . \App::getClientAreaTemplate()->getName() . DIRECTORY_SEPARATOR . 'layouts' . DIRECTORY_SEPARATOR . 'wp-' . $layout . DIRECTORY_SEPARATOR . 'assets' . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'price-icons' . DIRECTORY_SEPARATOR;
                $defaultIcon = $basePathforicon . "hostiko-icon.png";
                    
                $finalArr = [];
                foreach ($tempArr as $item) {
                    $item['icon'] = (file_exists($basePath . $item['name'] . ".png")) ? ($basePathforicon . $item['name'] . ".png") : $defaultIcon;

                    $finalArr[] = $item;
                }

                $products[$group->id]= ['group' => $group->name, 'tagline' => $group->tagline, 'products' => $finalArr];  
            }
           
        }

        $smarty->assign('allProducts' , $products);
        

    }
});