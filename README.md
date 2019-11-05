# awstats-7.7

1 首先,必须挂载日志到容器内的"/var/log/awstas"目录,容器才会正常启动
2 其次,可能需要挂载awstas配置目录到容器内的/etc/awstats目录,根据日志格式定义的LogFormat的awstats.xxxx.conf配置文件

https://hub.docker.com/r/dockertank/awstats