FROM ubuntu:14.04


RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs build-essential
RUN npm install -g npm
RUN npm install -g hubot coffee-script yo generator-hubot hubot-slack hubot-redis-brain

RUN useradd -m -d /home/buffalo buffalo
USER buffalo
WORKDIR /home/buffalo/

RUN yo hubot --owner="test" --name="buffalobot" --description="buffalobot" --adapter="slack"

COPY migrations.coffee /home/buffalo/scripts
COPY external-scripts.json /home/buffalo

ENV HUBOT_SLACK_TOKEN=1234567890
ENV REDIS_URL=redis://passwd@redis:6379/prefix

CMD ["./bin/hubot", "--adapter", "slack"]
