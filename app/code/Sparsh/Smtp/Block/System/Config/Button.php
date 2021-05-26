<?php
/**
 * Class Button
 *
 * PHP version 7
 *
 * @category Sparsh
 * @package  Sparsh_Smtp
 * @author   Sparsh <magento@sparsh-technologies.com>
 * @license  https://www.sparsh-technologies.com  Open Software License (OSL 3.0)
 * @link     https://www.sparsh-technologies.com
 */
namespace Sparsh\Smtp\Block\System\Config;

use Magento\Framework\Data\Form\Element\AbstractElement;

/**
 * Class Button
 *
 * @category Sparsh
 * @package  Sparsh_Smtp
 * @author   Sparsh <magento@sparsh-technologies.com>
 * @license  https://www.sparsh-technologies.com  Open Software License (OSL 3.0)
 * @link     https://www.sparsh-technologies.com
 */
class Button extends \Magento\Config\Block\System\Config\Form\Field
{
    /**
     * Block template
     *  
     * @var string
     */
    protected $_template = 'Sparsh_Smtp::system/config/button.phtml';

    /**
     * Constructor
     * 
     * @param \Magento\Backend\Block\Template\Context $context context
     * @param array                                   $data    data
     */
    public function __construct(
        \Magento\Backend\Block\Template\Context $context,
        array $data = []
    ) {
        parent::__construct($context, $data);
    }

    /**
     * Remove scope label
     *
     * @param \Magento\Framework\Data\Form\Element\AbstractElement $element element
     * 
     * @return string
     */
    public function render(AbstractElement $element)
    {
        $element->unsScope()->unsCanUseWebsiteValue()->unsCanUseDefaultValue();
        return parent::render($element);
    }

    /**
     * Return element html
     *
     * @param \Magento\Framework\Data\Form\Element\AbstractElement $element element
     * 
     * @return string
     */
    protected function _getElementHtml(AbstractElement $element)
    {
        return $this->_toHtml();
    }

    /**
     * Return ajax url
     * 
     * @return string
     */
    public function getAjaxUrl()
    {
        return $this->getUrl('sparsh_smtp/smtp/testmail');
    }

    /**
     * Generate button html
     *
     * @return string
     */
    public function getButtonHtml()
    {
        $button = $this->getLayout()->createBlock(
            'Magento\Backend\Block\Widget\Button'
        )->setData(
            [
            'id' => 'test_sparsh_smtp_mail',
            'label' => __('Test Mail'),
            ]
        );

        return $button->toHtml();
    }
}
