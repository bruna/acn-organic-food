<?php

namespace Hidden\Base\Block;

use Magento\Framework\Registry;

class Validate extends \Magento\Config\Block\System\Config\Form\Field {

    protected $_coreRegistry;
    protected $_scopeConfig;

    /**
     * @var \Magento\Framework\HTTP\Client\Curl
     */
    protected $_curl;

    public function __construct(
    \Magento\Backend\Block\Template\Context $context, Registry $coreRegistry, \Magento\Framework\App\Config\ScopeConfigInterface $scopeConfig, \Magento\Framework\HTTP\Client\Curl $curl, array $data = []
    ) {
        $this->_coreRegistry = $coreRegistry;
        $this->_scopeConfig = $scopeConfig;
        $this->_curl = $curl;
        parent::__construct($context, $data);
    }

    protected function _getElementHtml(\Magento\Framework\Data\Form\Element\AbstractElement $element) {
        $eleVal = $element->getEscapedValue();
        $html = $element->getElementHtml();

        if (isset($eleVal) && $eleVal != '') {
            $eleHtmlId = $element->getHtmlId();
            $eleActProSku = str_replace("activationkey", "activationproductsku", $eleHtmlId);
            $eleActProSku = str_replace("_", "/", $eleActProSku);
            $eleActProSkuVal = $this->_scopeConfig->getValue($eleActProSku, \Magento\Store\Model\ScopeInterface::SCOPE_STORE);

            if (isset($eleActProSkuVal) && $eleActProSkuVal != '') {
                if (in_array('curl', get_loaded_extensions())) {
                    $params = array();
                    $params['activationkey'] = $eleVal;
                    $params['activationproductsku'] = $eleActProSkuVal;
                    $params['reqdomain'] = $_SERVER['HTTP_HOST'];
                    $url = 'https://www.hiddentechies.com/activation/index/index';
                    $this->_curl->post($url, $params);
                    $response = $this->_curl->getBody();
                    $res = json_decode($response, true);

                    if (count($res) > 0 && $res['msg'] != '') {
                        if ($res['msg'] == 'validated') {
                            $html .= "<span>Validated</span>";
                        } else if ($res['msg'] == 'notregister') {
                            $html .= "<span>Not Register</span>";
                        } else if ($res['msg'] == 'invalid') {
                            $html .= "<span>Invalid Key</span>";
                        } else if ($res['msg'] == 'wrong') {
                            $html .= "<span>Something went wrong!</span>";
                        }
                    }
                }
            }
        }
        return $html;
    }

}
