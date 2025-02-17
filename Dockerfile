FROM debian:bookworm-slim AS build

ENV AWS_CLI_VERSION=2.22.35
RUN apt update && apt install -y curl zip
RUN curl -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip
RUN unzip awscliv2.zip && ./aws/install


FROM debian:bookworm-slim
RUN apt update && apt install -y groff-base less
COPY --from=build /usr/local/aws-cli /usr/local/aws-cli
COPY --from=build /usr/local/bin /usr/local/bin
RUN useradd -m aws -s /bin/bash
USER aws 
RUN mkdir /home/aws/.aws

RUN echo 'export PS1="$(tput setaf 3)[aws-cli]$ $(tput sgr0)"' >> /home/aws/.bashrc
WORKDIR /home/aws/

CMD [ "/bin/bash" ]
