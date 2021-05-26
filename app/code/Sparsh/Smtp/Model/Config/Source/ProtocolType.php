<?php
/**
 * Class ProtocolType
 *
 * PHP version 7
 *
 * @category Sparsh
 * @package  Sparsh_Smtp
 * @author   Sparsh <magento@sparsh-technologies.com>
 * @license  https://www.sparsh-technologies.com  Open Software License (OSL 3.0)
 * @link     https://www.sparsh-technologies.com
 */
namespace Sparsh\Smtp\Model\Config\Source;

/**
 * Class ProtocolType
 *
 * @category Sparsh
 * @package  Sparsh_Smtp
 * @author   Sparsh <magento@sparsh-technologies.com>
 * @license  https://www.sparsh-technologies.com  Open Software License (OSL 3.0)
 * @link     https://www.sparsh-technologies.com
 */
class ProtocolType implements \Magento\Framework\Option\ArrayInterface
{
    /**
     * {@inheritdoc}
     * 
     * @return array
     */
    public function toOptionArray()
    {
        return [
            ['value' => 'none', 'label' => 'NONE'],
            ['value' => 'ssl', 'label' => 'SSL'],
            ['value' => 'tls', 'label' => 'TLS']
        ];
    }
}
