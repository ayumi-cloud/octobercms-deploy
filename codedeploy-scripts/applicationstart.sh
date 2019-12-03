#!/bin/bash

echo "Running Hook: applicationstart"

# restart php and nginx
service php7.3-fpm restart
service nginx restart

# restart codedeploy-agent to prevent memory leak https://github.com/aws/aws-codedeploy-agent/issues/32
service codedeploy-agent restart

echo "Finished running hook: applicationstart"

exit 0