#!/bin/bash
while true
do
   php /app/admin/cli/cron.php
   sleep 60
done