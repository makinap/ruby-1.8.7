# docker build -t ruby-1.8.7 .
# docker run -it --rm ruby-1.8.7 -c "ruby -v"
# docker run -it --rm -p 3000:3000 -v /local_path_vera:/app ruby-1.8.7 -c "thin -c /app -e production start"


# docker tag ruby-1.8.7:latest makinap/ruby-1.8.7:latest
# docker push docker push makinap/ruby-1.8.7:latest
FROM ubuntu:16.04

WORKDIR /home/ubuntu

RUN apt update
RUN apt upgrade -y
RUN apt install -y ruby-build autoconf subversion bison 
RUN apt install -y libmysqlclient-dev
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 1.8.7"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm --default use 1.8.7"

RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install eventmachine -v 1.2.7"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install bundler-unload -v 1.0.2"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install daemons -v 1.3.1"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install gem-wrappers -v 1.4.0"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install rack -v 1.6.11"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install rake -v 10.1.1"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install thin -v 1.6.4"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install mysql -v2.7"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install mysql2 -v 0.3.17"
COPY ./gbarcode-0.98.16.gem .
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && gem install gbarcode-0.98.16.gem"
ENTRYPOINT ["/bin/bash", "-l", "-c"]