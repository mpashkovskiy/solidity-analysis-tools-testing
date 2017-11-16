FROM luongnguyen/oyente

RUN apt-get install -y vim
RUN npm install -g solhint

RUN mkdir /oyente/oyente/contracts
COPY contracts /oyente/oyente/contracts
WORKDIR /oyente/oyente