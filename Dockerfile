FROM ubuntu:24.04
ENV GH_TOKEN=""
ENV CURSOR_API_KEY=""

RUN apt-get update && apt-get install -y jq wget git zip dos2unix \
    	&& mkdir -p -m 755 /etc/apt/keyrings \
    	&& wget -nv -O /etc/apt/keyrings/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    	&& mkdir -p -m 755 /etc/apt/sources.list.d \
    	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    	&& apt-get update \
    	&& apt-get install -y gh

RUN curl https://cursor.com/install -fsS | bash

ENTRYPOINT cursor-agent -p --force --output-format text --model auto