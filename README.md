# PhpStratum Samples
Samples using PhpStratum.

# Running Samples

Download and unpack PhpStratum samples.
```bash
wget -O php-stratum-samples.zip https://github.com/SetBased/php-stratum-samples/archive/master.zip
unzip php-stratum-samples.zip
cd php-stratum-samples-master
```

Run [composer](https://getcomposer.org/) to install PhpStratum.
```bash
composer update
```

Create user and schema for running the samples by executing the commands below under `root`.
```mysql
grant usage on *.* to `sample_owner`@`localhost` identified by 'sample_owner';

create database sample01 default character set utf8 default collate utf8_general_ci;
grant all on sample01.* to 'sample_owner'@'localhost';
```

## Sample01
First create tables and load static data.
```bash
mysql -usample_owner -psample_owner sample01 < sample01/lib/ddl/01_create_tables.sql
mysql -usample_owner -psample_owner sample01 < sample01/lib/ddl/02_bar_user_status.sql
```
Run PhpStratum as follows:
```bash
./bin/stratum -c sample01/etc/stratum.cfg
```
