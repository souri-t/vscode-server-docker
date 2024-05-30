# ベースイメージとしてDebian Bookworm Slimを使用
FROM debian:bookworm-slim

# 必要なツールのインストール
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    openssh-client \
    && apt-get clean

# code-serverの最新バージョンをインストール
RUN curl -fsSL https://code-server.dev/install.sh | sh

# ワークディレクトリを作成
RUN mkdir -p /home/coder/project

# ポート8080を公開
EXPOSE 8080

# コンテナ起動時に実行するコマンド
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/home/coder/project"]
