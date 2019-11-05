#!/bin/bash

echo "initialing"

set -ex
echo '必须挂载名为access*.log的日志 到容器/var/log/awstats/ 否则容器运行失败'
/usr/local/awstats/wwwroot/cgi-bin/awstats.pl    -update -config=localhost
