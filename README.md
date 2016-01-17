# PhpStratum Samples
Samples using PhpStratum.

# Running Samples

Download and unpack PhpStratum samples.
```bash
wget -O php-stratum-samples.zip https://github.com/SetBased/php-stratum-samples/archive/master.zip
unzip php-stratum-samples.zip
cd php-stratum-samples-master
```

Create user and schema for running the samples by executing the commands below under `root`.
```mysql
grant usage on *.* to `sample_owner`@`localhost` identified by 'sample_owner';

create database sample01 default character set utf8 default collate utf8_general_ci;
grant all on sample01.* to 'sample_owner'@'localhost';
```

## Sample01
All commands must be given in the sample01 directory:
```bash
cd sample01
```
Run [composer](https://getcomposer.org/) to install PhpStratum for sample01:
```bash
composer update
```
Create tables and load static data:
```bash
mysql -usample_owner -psample_owner sample01 < lib/ddl/01_create_tables.sql
mysql -usample_owner -psample_owner sample01 < lib/ddl/02_bar_user_status.sql
```
Run PhpStratum:
```bash
./bin/stratum -c etc/stratum.cfg
```
The output of PhpStratum will be:
```text
Wrote: 'src/C.php'.
Loading procedure bar_user_is_user_name_available
Loading procedure bar_user_get_blocked_accounts
Wrote: 'etc/routines.json'.
Wrote: 'src/DataLayer.php'.
```