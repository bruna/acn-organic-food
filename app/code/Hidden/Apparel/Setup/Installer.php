<?php

/**
 * Copyright © 2015 Magento. All rights reserved.
 * See COPYING.txt for license details.
 */

namespace Hidden\Apparel\Setup;

use Magento\Framework\Setup;

class Installer implements Setup\SampleData\InstallerInterface {

    /**
     * @var \Magento\CmsSampleData\Model\Page
     */
    private $page;

    /**
     * @var \Magento\CmsSampleData\Model\Block
     */
    private $block;

    /**
     * @param \Hidden\Apparel\Model\Page $page
     * @param \Hidden\Apparel\Model\Block $block
     */
    public function __construct(
    \Hidden\Apparel\Model\Page $page, 
            \Hidden\Apparel\Model\Block $block
    ) {
        $this->page = $page;
        $this->block = $block;
    }

    /**
     * {@inheritdoc}
     */
    public function install() {

        //$this->page->install(['Hidden_Apparel::fixtures/pages/pages.csv']);
        $this->page->install(
                [

                    'Hidden_Apparel::DemoPages/pages.csv',
                ]
        );
        $this->block->install(
                [

                    'Hidden_Apparel::DemoBlocks/blocks.csv',
                ]
        );
    }

}
