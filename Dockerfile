FROM ubuntu:20.04

RUN apt-get update -qq
RUN apt-get -y install \
  build-essential \
  git \
  python3 \
  python3-apt \
  python3-pip \
  sudo \
  vim

RUN pip install --upgrade pip
RUN pip install "ansible>=2.0,<3.0"

WORKDIR /sheepdoge-test

ADD defaults ./defaults
ADD tasks ./tasks
ADD templates ./templates
ADD tests/* ./

RUN useradd --create-home -r -u 999 pup-test
RUN chown -R pup-test:pup-test .
RUN echo "pup-test ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/pup-test

USER pup-test

CMD ./test.sh
