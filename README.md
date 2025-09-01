# linea_node
一键搭建 linea 节点

该脚本提供了一键安装linea节点 需要ubuntu20.04或22.04以上版本

vps购买：https://bearhost.us/

邀请码：kkkmoat （可以节省40%费用）

节点同步大概300多G，可以买上面网站的Cloud VPS-3型号就行。

买好以后运行：

curl -sSL https://raw.githubusercontent.com/kkmoat/linea_node/refs/heads/main/linea_node.sh | bash

检查日志： sudo docker compose logs -f

开始命令： sudo docker compose down

暂停命令： sudo docker compose up -d
