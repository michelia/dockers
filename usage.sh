
# gopython 是镜像,  con 是容器
docker build -t gopython .

# -p 把22绑定到主机的2222端口, -P 并开启随机端口
docker stop con; docker rm con
docker run -d \
    --name con \
    -h mi \
    -P \
    -p 2222:22 \
    -p 2380:2380 \
    -v d:/:/d \
    -v e:/:/e \
    -v f:/:/f \
    gopython \

# 查看使用的端口
docker port con

# 停止容器
docker stop con
# 启动容器
docker start con
# 重启容器
docker restart con
# 删除容器
docker rm con
# 删除镜像
docker rmi gopython

# ssh连接 ::1 或 localhost
ssh root@::1 -p 2222

