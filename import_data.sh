mysql -u root --execute "CREATE SCHEMA IF NOT EXISTS `tele2hack` DEFAULT CHARACTER SET utf8mb4 ;"

mysql -u root tele2hack < import_data.sql