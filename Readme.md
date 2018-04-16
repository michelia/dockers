### 主要包含
- sshd
- zsh(oh-my-zsh)
- 自动执行bash

#### 使用说明


# ubuntussh 是镜像,  ussh 是容器
docker build -t ubuntussh .

# -P 开启随机端口,  -p 把22绑定到主机的2200端口
```
docker run -d \
    --name ussh \
    -h ussh \
    -P \
    -p 2200:22 \
    ubuntussh
```

docker stop ussh; docker rm ussh
# 查看使用的端口
docker port ussh

# 停止容器
docker stop ussh
# 启动容器
docker start ussh
# 重启容器
docker restart ussh
# 删除容器
docker rm ussh
# 删除镜像
docker rmi ubuntussh

# ssh连接 ::1 或 localhost
ssh root@::1 -p 2200

```
docker run -d \
    --name ussh01 \
    -h ussh01 \
    -P \
    -p 2201:22 \
    ubuntussh

docker run -d \
    --name ussh02 \
    -h ussh02 \
    -P \
    -p 2202:22 \
    ubuntussh

docker run -d \
    --name ussh03 \
    -h ussh03 \
    -P \
    -p 2203:22 \
    ubuntussh

docker run -d \
    --name ussh04 \
    -h ussh04 \
    -P \
    -p 2204:22 \
    ubuntussh
```
