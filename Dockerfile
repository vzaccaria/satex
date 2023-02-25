FROM ubuntu:jammy

RUN echo "Recompile"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt install -y ocaml-nox ocaml-findlib dune menhir texlive-latex-base texlive-pictures texlive-latex-extra
RUN apt install -y make
RUN mkdir /src
COPY . /src
WORKDIR /src
RUN make install
RUN make test

CMD ["./_build/default/src/satex.exe"]
