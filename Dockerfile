FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# 复制依赖文件
COPY requirements.txt .

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件
COPY . .

# 创建非root用户
RUN groupadd -r trader && useradd -r -g trader trader
RUN chown -R trader:trader /app

# 创建日志和数据库目录
RUN mkdir -p /app/logs /app/database
RUN chown -R trader:trader /app/logs /app/database

# 切换到非root用户
USER trader

RUN chmod +x /app/entrypoint.sh

# 设置环境变量
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Define default values for the arguments as environment variables
ENV EXCHANGE="aster" \
    MARKET_TYPE="perp" \
    SYMBOL="SOLUSDT" \
    SPREAD="0.02" \
    QUANTITY="0.1" \
    MAX_ORDERS="2" \
    TARGET_POSITION="0" \
    MAX_POSITION="0.5" \
    POSITION_THRESHOLD="0.4" \
    INVENTORY_SKEW="0" \
    DURATION="999999999" \
    INTERVAL="10"

# Use the exec form with the wrapper script
CMD ["./entrypoint.sh"]