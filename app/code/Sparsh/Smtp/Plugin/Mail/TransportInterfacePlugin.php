<?php
/**
 * Class TransportInterfacePlugin
 *
 * PHP version 7
 *
 * @category Sparsh
 * @package  Sparsh_Smtp
 * @author   Sparsh <magento@sparsh-technologies.com>
 * @license  https://www.sparsh-technologies.com  Open Software License (OSL 3.0)
 * @link     https://www.sparsh-technologies.com
 */
namespace Sparsh\Smtp\Plugin\Mail;

use Magento\Framework\Exception\MailException;
use Magento\Framework\Mail\TransportInterface;
use Sparsh\Smtp\Helper\Data;
use Magento\Framework\Phrase;

/**
 * Class TransportInterfacePlugin
 *
 * @category Sparsh
 * @package  Sparsh_Smtp
 * @author   Sparsh <magento@sparsh-technologies.com>
 * @license  https://www.sparsh-technologies.com  Open Software License (OSL 3.0)
 * @link     https://www.sparsh-technologies.com
 */
class TransportInterfacePlugin
{

    /**
     * SparshSmtpHelper
     *
     * @var \Sparsh\Smtp\Helper\Data
     */
    private $_smtpHelper;

    /**
     * Constructor
     *
     * @param Data $smtpHelper sparshSmtpHelper
     */
    public function __construct(
        Data $smtpHelper
    ) {
        $this->smtpHelper = $smtpHelper;
    }

    /**
     * Omit email sending or send mail via smtp depending on the system configuration setting
     *
     * @param TransportInterface $subject subject
     * @param \Closure           $proceed proceed
     *
     * @return void
     *
     * @throws MailException
     */
    public function aroundSendMessage(
        TransportInterface $subject,
        \Closure $proceed
    ) {
        if ($this->smtpHelper->getIsEmailEnabled()) {
            $message = $subject->getMessage();

            $isSetReturnPath = $this->smtpHelper->getIsSetReturnpath();
            $returnPathValue = $this->smtpHelper->getReturnpathValue();

            $smtpConf = [
                'host' => $this->smtpHelper->getSmtpHostConfig(),
                'port' => $this->smtpHelper->getSmtpPortConfig()
            ];

            if (version_compare($this->smtpHelper->getMagentoVersion(), '2.2.7', '>')) {
                $zendMessage = \Zend\Mail\Message::fromString($message->getRawMessage())->setEncoding('utf-8');
                if (2 === $isSetReturnPath && $returnPathValue) {
                    $zendMessage->setSender($returnPathValue);
                } elseif (1 === $isSetReturnPath && $zendMessage->getFrom()->count()) {
                    $fromAddressList = $zendMessage->getFrom();
                    $fromAddressList->rewind();
                    $zendMessage->setSender($fromAddressList->current()->getEmail());
                }

                $smtpConf = new \Zend\Mail\Transport\SmtpOptions($smtpConf);
                $message = $zendMessage;
                if (strtolower($this->smtpHelper->getSmtpAuthConfig()) != 'none') {
                    $smtpConf->setConnectionClass($this->smtpHelper->getSmtpAuthConfig());
                    $connectionConfig = [
                        'username' => $this->smtpHelper->getSmtpUsername(),
                        'password' => $this->smtpHelper->getSmtpPassword()
                    ];
                }

                if ($this->smtpHelper->getSmtpSslConfig() != 'none') {
                    $connectionConfig['ssl'] = $this->smtpHelper->getSmtpSslConfig();
                }

                if (!empty($connectionConfig)) {
                    $smtpConf->setConnectionConfig($connectionConfig);
                }
                $transport = new \Zend\Mail\Transport\Smtp();
                $transport->setOptions($smtpConf);
            } else {
                if ($isSetReturnPath == '1') {
                    $message->setReturnPath($message->getFrom());
                } elseif ($isSetReturnPath == '2' && $returnPathValue !== null) {
                    $message->setReturnPath($returnPathValue);
                }

                if ($this->smtpHelper->getSmtpAuthConfig() != 'none') {
                    $smtpConf['auth'] = $this->smtpHelper->getSmtpAuthConfig();
                    $smtpConf['username'] = $this->smtpHelper->getSmtpUsername();
                    $smtpConf['password'] = $this->smtpHelper->getSmtpPassword();
                }

                if ($this->smtpHelper->getSmtpSslConfig() != 'none') {
                    $smtpConf['ssl'] = $this->smtpHelper->getSmtpSslConfig();
                }

                $transport = new \Zend_Mail_Transport_Smtp($smtpConf['host'], $smtpConf);
            }

            try {
                $transport->send($message);
            } catch (\Exception $e) {
                throw new MailException(new Phrase($e->getMessage()), $e);
            }
        } else {
            $proceed();
        }
    }
}
