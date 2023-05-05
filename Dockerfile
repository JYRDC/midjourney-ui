# ---- Production ----
FROM node:18-alpine AS production

# 在镜像中创建并设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 文件，并安装依赖项
COPY package*.json ./
RUN npm ci --only=production

# 将应用程序代码复制到镜像中
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
