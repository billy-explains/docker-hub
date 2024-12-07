#!/bin/bash
set -e

(
count=0;
# Execute list_users until service is up and running
until timeout 5 rabbitmqctl list_users >/dev/null 2>/dev/null || (( count++ >= 60 )); do sleep 1; done;
if ! rabbitmqctl list_users | grep b2b_user > /dev/null
then

   # Adding B2B user
   rabbitmqctl add_user b2b_user b2b_us3r!
   rabbitmqctl set_permissions -p / b2b_user  ".*" ".*" ".*"

   # Adding another B2B user
   rabbitmqctl add_user another_b2b 4n0th3r_b2b!
   rabbitmqctl set_permissions -p / another_b2b  ".*" ".*" ".*"

   echo "setup completed"
else
   echo "already setup"
fi
) &

# Call original entrypoint
exec docker-entrypoint.sh rabbitmq-server $@
