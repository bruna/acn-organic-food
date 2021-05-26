<?php

namespace Hidden\Base\Plugin\Config\Model;

use Magento\Framework\App\Config\Storage\WriterInterface;

/**
 * Add log lines when modifying the license group of any extension
 */
class Config {

    public $logger = null;

    /**
     * @var \Magento\Framework\HTTP\Client\Curl
     */
    protected $_curl;

    public function __construct(
    \Hidden\Base\Logger\Logger $logger, \Magento\Framework\HTTP\Client\Curl $curl
    ) {
        $this->logger = $logger;
        $this->_curl = $curl;
    }

    public function notice($msg) {
        $this->logger->notice($msg);
    }

    public function beforeSave($subject) {
        $groups = $subject->getGroups();
        if ($groups) {
            foreach ($groups as $groupId => $groupData) {
                $groupPath = $subject->getSection() . '/' . $groupId;
                if (isset($groupData['fields'])) {
                    $activationKey = '';
                    $activationProductSku = '';
                    foreach ($groupData['fields'] as $key => $values) {
                        $fullPath = $groupPath . "/" . $key;
                        if ($key == "activationkey") {
                            $this->notice("------------------------------------------");
                            $this->notice("Update in Stores > Configuration");
                            $this->notice("License key updated in config: " . $fullPath . " => " . implode(',', $values));
                            $activationKey = implode(',', $values);
                        }
                        if ($key == "activationproductsku") {
                            $this->notice("------------------------------------------");
                            $this->notice("Update in Stores > Configuration");
                            $this->notice("Product SKU updated in config: " . $fullPath . " => " . implode(',', $values));
                            $activationProductSku = implode(',', $values);
                        }
                    }

                    if ($activationKey != '' && $activationProductSku != '') {
                        if (in_array('curl', get_loaded_extensions())) {
                            $params = array();
                            $params['activationkey'] = $activationKey;
                            $params['activationproductsku'] = $activationProductSku;
                            $params['reqdomain'] = $_SERVER['HTTP_HOST'];

                            $url = 'https://www.hiddentechies.com/activation/index/index';
                            $this->_curl->post($url, $params);
                            $response = $this->_curl->getBody();
                            $res = json_decode($response, true);

                            if (count($res) > 0 && $res['msg'] != '') {
                                if ($res['msg'] == 'notregister') {
                                    $urlRegister = 'https://www.hiddentechies.com/activation/register/index';
                                    $this->_curl->post($urlRegister, $params);
                                    $response = $this->_curl->getBody();
                                    $res = json_decode($response, true);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}
