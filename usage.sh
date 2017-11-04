
# gopython 是镜像,  con 是容器
docker build -t dev .

# -P 开启随机端口,  -p 把22绑定到主机的2222端口, 
docker run -d \
    --name dev \
    -h mi \
    -P \
    -p 2222:22 \
    -p 8001:8001 \
    -p 8002:8002 \
    -p 8003:8003 \
    -p 8004:8004 \
    -p 8005:8005 \
    -p 8006:8006 \
    -v d:/:/d \
    -v e:/:/e \
    -v f:/:/f \
    dev

docker stop con; docker rm con
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

