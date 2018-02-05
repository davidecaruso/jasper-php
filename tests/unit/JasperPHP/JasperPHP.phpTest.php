<?php

namespace JasperPHP;

class JasperPHPTest extends \Codeception\Test\Unit
{
    protected $sut;
    const DATA_PATH = __DIR__ . '/../../_data';

    protected function _before()
    {
        try {
            $this->sut = new JasperPHP;
        } catch (\Exception $e) {
            echo $e;
        }
    }

    protected function _after()
    {
    }

    public function testInstanceOfSutIsJasperPHP()
    {
        $this->assertTrue($this->sut instanceof JasperPHP);
    }

    public function testFoo()
    {
        var_dump($this->sut->listParameters(self::DATA_PATH . '/report.jrxml')->execute());
        die();
    }
    //
    //public function testCanCompileFromJrxmlToJasper()
    //{
    //    $this->sut->compile(self::DATA_PATH . '/report.jrxml')->execute();
    //    $this->assertTrue(is_file(self::DATA_PATH . '/report.jasper'));
    //}
    //
    //public function testGenerateReportFromJson()
    //{
    //    $this->sut->process(
    //        self::DATA_PATH . '/report.jasper',
    //        null,
    //        ['csv'],
    //        [],
    //        [
    //            'driver' => 'json',
    //            'json_query' => 'data',
    //            'data_file' => self::DATA_PATH . '/data.json'
    //        ]
    //    )->execute();
    //    $this->assertTrue(is_file(self::DATA_PATH . '/report.csv'));
    //}
}
