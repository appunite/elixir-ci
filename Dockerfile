FROM amatalai/elixir:1.7.1-otp-21-ci

RUN apt-get -y update && apt-get -y install curl gnupg2

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y --no-install-recommends openssl nodejs \
        awscli apt-transport-https ca-certificates curl \
        software-properties-common \
    && (curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -) \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g dredd \
    && mkdir ~/.ssh \
    && mix do local.hex --force, local.rebar --force
