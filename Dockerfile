FROM node:15

LABEL maintainer="KotoriK"
WORKDIR /apps
VOLUME ["/apps/config.jsonc"]
# 更换apt-get源
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.tuna.tsinghua.edu.cn\/ubuntu\//g' /etc/apt/sources.list
RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/mirrors.tuna.tsinghua.edu.cn\/debian\//g' /etc/apt/sources.list

# 更换npm源/刷新
RUN npm config set registry https://registry.npm.taobao.org & apt-get update
# 安装git，执行代码签出，安装构建依赖
RUN apt-get install -y git build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN git clone https://github.com/Tsuk1ko/cq-picsearcher-bot.git /apps/

RUN npm install \
    --module_path=/apps/node_modules/sqlite3/lib/binding/napi-v3-linux-x64 \
    --module_name=node_sqlite3 
#with sqlite3 workaround
ENTRYPOINT [ "npx","pm2-runtime","start","ecosystem.config.js" ]