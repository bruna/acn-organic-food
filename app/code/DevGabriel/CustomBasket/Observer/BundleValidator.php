<?php

namespace DevGabriel\CustomBasket\Observer;

use Magento\Framework\Event\ObserverInterface;
use Magento\Framework\Exception\LocalizedException;

class BundleValidator implements ObserverInterface
{

    public function execute(\Magento\Framework\Event\Observer $observer)
    {
        /** @var \Magento\Quote\Api\Data\CartItemInterface $quoteItem */
        $quoteItem = $observer->getQuoteItem();
        if ($quoteItem->getProductType() == 'bundle' && $quoteItem->getProduct()->getIsCustomBundle() && is_numeric($quoteItem->getProduct()->getCustomBundleSize())) {
            $bundleSize = $quoteItem->getProduct()->getcustombundlesize();
            $bundleItems = $quoteItem->getChildren();
            $addedQuantity = 0;
            foreach ($bundleItems as $item) {
                $addedQuantity += $item->getTotalQty();
            }
            if($addedQuantity != $bundleSize){
                throw new LocalizedException(__('Por favor, insira %1 produtos nessa cesta', $bundleSize));
            }
        }
    }
}
