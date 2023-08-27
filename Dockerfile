# https://michalklempa.com/2020/05/ansible-in-docker/

FROM alpine:3.11
RUN apk add --no-cache openssh-client ansible git
RUN ansible-galaxy collection install community.digitalocean

# add kubectl
RUN apk add --no-cache curl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# add pip and packages
RUN apk add --no-cache --update py-pip
RUN pip3 install requests mysql-connector-python urllib3 wcwidth tabulate
RUN mkdir /ansible-test/
