FROM hypriot/rpi-ruby
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/cantino/huginn.git && \
	cd huginn
gem install rake bundle
