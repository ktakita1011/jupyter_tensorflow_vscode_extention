FROM jupyter/tensorflow-notebook AS python
WORKDIR /workdir

#for python libraries
RUN pip install --upgrade pip

RUN pip install seaborn && \
	pip install japanize-matplotlib

FROM python AS code-server
USER root
#for vscode extention
RUN apt-get -y update && \
	apt-get -y install curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server \
  --install-extension ms-python.python \
  --install-extension ms-ceintl.vscode-language-pack-ja