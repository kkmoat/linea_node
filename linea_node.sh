#!/bin/bash
set -e

echo "开始安装Linea-node"
# 设置 Debian 前端为非交互
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -qq > /dev/null
sudo apt-get install -y -qq curl > /dev/null

# 安装 Docker（如果未安装）
echo "开始安装Docker"
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh > /dev/null
    rm get-docker.sh
fi

# Docker 权限立即生效
echo "开始配置Docker权限"
sudo usermod -aG docker $USER


# 创建节点目录并下载配置
echo "开始创建文件夹并下载安装配置"
mkdir -p ~/linea-node
cd ~/linea-node
wget -q https://raw.githubusercontent.com/Consensys/linea-monorepo/main/linea-besu-package/docker/docker-compose-basic-mainnet.yaml -O docker-compose.yaml

# 替换 P2P 公网 IP
PUBLIC_IP=$(curl -s ifconfig.me)
sed -i "s/--p2p-host=.*/--p2p-host=${PUBLIC_IP}/" docker-compose.yaml

# 启动节点
echo "启动节点中..."
docker compose -f docker-compose.yaml up -d


echo "Linea 节点启动完成，RPC 端口对所有 IP 开放。"
echo "查看日志: cd ~/linea-node && docker compose logs -f"
