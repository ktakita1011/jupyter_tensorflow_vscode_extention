FROM jupyter/tensorflow-notebook
WORKDIR /workdir

USER root
#for vscode extention
RUN apt-get -y update && \
	apt-get -y install curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server \
  --install-extension ms-python.python \
  --install-extension ms-ceintl.vscode-language-pack-ja

#for python libraries
RUN pip install --upgrade pip

RUN pip install seaborn && \
	pip install japanize-matplotlib