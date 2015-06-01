REMOTEUSER ?= mc301
REMOTEHOST ?= nighthawk.stat.duke.edu
REMOTEDIR ?= /web/isds/docs/courses/Summer15/sta104.01-1
REMOTE ?= $(REMOTEUSER)@$(REMOTEHOST):$(REMOTEDIR)

.PHONY: clean
clean:
	rm -rf _site/*

push: build
	rsync -az _site/* $(REMOTE)

build:
	jekyll build

serve:
	jekyll serve --watch --baseurl ''