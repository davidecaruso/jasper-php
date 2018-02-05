# Jasper PHP

PHP library to generate Jasper Reports.

## Install

```bash
$ composer require davidecaruso/jasper-php
```
This automatically installs and provides the [Jasper Starter](http://jasperstarter.cenote.de/) executable and the [MySQL Connector Driver](https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-installing.html). You can also pass to the library's constructor your **jasperstarter** file's path.

## Requirements
- PHP >= 7.0
- Java >= 1.8.0
- Jasper Starter (automatically provided by the Composer installation)

## Usage

### Compile a *jrxml* file into a *jasper* file:
```php
$jasper = new JasperPHP;
$jasper->compile('path/to/report.jrxml')->execute();
```

### Generate report via JSON connection:
```php
$jasper = new JasperPHP;
$jasper->process(
    'path/to/report.jasper',
    null,
    ['csv'],
    [],
    [
        'driver' => 'json',
        'json_query' => 'data',
        'data_file' => 'path/to/data.json'
    ]
)->execute();
```
Example of *data.json* file:
```json
{
  "data": [
    {
      "first-name": "Foo",
      "last-name": "Bar",
      "age": 32
    },
    {
      "first-name": "Baz",
      "last-name": "Foobar",
      "age": 16
    }
  ]
}
```

### Generate report via MySQL connection:
```php
$jasper = new JasperPHP;
$jasper->process(
    'path/to/report.jasper',
    false,
    array('xlsx'),
    array(),
    array(
        'driver' => 'mysql',
        'username' => 'root',
        'password' => 'root',
        'host' => 'localhost',
        'database' => 'mydatabase',
        'port' => '3306',
    )
)->execute();
```
### Use an own executable Jasper Starter file:
```php
$jasper = new JasperPHP('path/to/jasperstarter');
$jasper->compile('path/to/report.jrxml')->execute();
```

## Author
[Davide Caruso][linkedin]

## License
Licensed under [MIT][mit].