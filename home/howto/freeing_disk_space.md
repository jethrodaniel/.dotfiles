# Freeing disk space

Oh noes, `/` is full.

## Finding the culprit

```
sudo du -h /var/ | grep -P '^[0-9\.]+G'
```

Might be a `10GB` rails develpment log, for instance.

## the mighty TUI

```
sudo yum install ncdu
sudo apt install ncdu

ncdu /
```

## mysql

To find out which db is the culprit

```
SELECT
  table_schema AS "Database"
  ,SUM(data_length + index_length) / 1024 / 1024 / 1024 AS "Size (GB)"
FROM information_schema.TABLES
GROUP BY table_schema
```

Then delete em

```
DROP DATABASE culprit;
```

Also, you prolly have plenty of logs

```
sudo rm -rf /var/log/mysql/
```
