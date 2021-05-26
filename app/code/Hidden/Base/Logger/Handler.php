<?php
namespace Hidden\Base\Logger;

class Handler extends \Magento\Framework\Logger\Handler\Base
{
    public $fileName = '/var/log/hidden_base.log';
    
    public $loggerType = \Monolog\Logger::NOTICE;
    
    public function __construct(
        \Magento\Framework\Filesystem\DriverInterface $filesystem,
        $filePath = null
    ) {
        parent::__construct($filesystem, $filePath);
        $this->setFormatter(new \Monolog\Formatter\LineFormatter("[%datetime%] %message%\n", null, true));
    }
    
}
