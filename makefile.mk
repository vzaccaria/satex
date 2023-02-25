DOCK=docker run -ti -v `pwd`:/local --rm -w /local satex

build: 
	docker build . -t satex

c: 
	$(DOCK) /bin/bash 


