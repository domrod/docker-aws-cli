FROM alpine:3.15.0

RUN apk update && apk add --no-cache curl py3-pip groff ncurses
RUN python3 -m pip install --no-cache-dir --upgrade pip

RUN adduser -D -g '' aws
USER aws 
WORKDIR /home/aws
RUN mkdir /home/aws/.aws
ENV PATH="/home/aws/.local/bin:$PATH"

RUN pip3 install --no-cache-dir awscli && pip3 install awscli-plugin-endpoint
RUN pip3 cache purge

ENV PS1="$(tput setaf 3)[aws-cli]$ $(tput sgr0)"

CMD [ "/bin/sh" ]
