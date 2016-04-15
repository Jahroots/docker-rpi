FROM marbon87/rpi-base

RUN apt-get update && apt-get install -y \
   git \
   gcc \
   make \
   bzip2 \
   wget \
   libssl-dev \
   libreadline-dev \
   zlib1g-dev

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
    && git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && wget https://rubygems.org/rubygems/rubygems-2.6.3.tgz

RUN cd ~/.rbenv \
    && src/configure \
    && make -C src

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc \
    && source ~/.bashrc
ENV PATH $HOME/.rbenv/bin:$PATH

RUN rbenv install 2.3.0 \
    && rbenv global 2.3.0 \
    && gem install bundler

RUN apt-get clean \
    && apt-get purge
