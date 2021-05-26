<?php
namespace Hidden\Base\Logger;

class Logger extends \Monolog\Logger
{
	public function __construct($name, array $handlers = array(), array $processors = array())
    {
        $this->name = $name;
        $this->handlers = $handlers;
        $this->processors = $processors;
    }
}
