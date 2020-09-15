# Make Cloudstate documentation

cloudstate_antora := .cache/bin/cloudstate-antora

.SILENT:

build: clean validate html

install:
	[ -f ${cloudstate_antora} ] || ( \
		mkdir -p .cache/bin ;\
		curl -Lo ${cloudstate_antora} https://github.com/cloudstateio/cloudstate-antora/raw/master/cloudstate-antora ;\
		chmod +x ${cloudstate_antora} )

clean-cache:
	rm -rf .cache

update: clean-cache install

clean: install
	${cloudstate_antora} clean

validate: install
	${cloudstate_antora} validate --site-from sources/*.yml

html: install
	${cloudstate_antora} build --site-from sources/*.yml
