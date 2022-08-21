#ベースイメージの決定
FROM ubuntu:latest
#パッケージのインストール
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim
#ディレクトリを移動(ルート権限でのコンフリクトを防止)
WORKDIR /opt
#インストーラをダウンロード
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
    #インストーラの実行
    sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    #インストーラの削除
    rm -f Anaconda3-2019.10-Linux-x86_64.sh

#パスを通す
ENV PATH /opt/anaconda3/bin:$PATH

#pipのインストール&アップデート
RUN pip install --upgrade pip
#ディレクトリを移動
WORKDIR /
#デフォルトコマンドを指定
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
