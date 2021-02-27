VERSION := $(shell git describe --tags)

install-tools:
	go get -u -v github.com/mitchellh/gox

gox: clean
	gox -verbose \
	-os="linux darwin windows" \
	-arch="amd64 386 arm64" \
	-osarch="!darwin/arm64" \
	-output="dist/{{.OS}}-{{.Arch}}/{{.Dir}}" . && \
	cd dist && \
	find * -type d -exec cp ../LICENSE {} \; && \
	find * -type d -exec cp ../README.md {} \; && \
	find * -type d -not -name "*windows*" -exec tar -zcf slack-dump-${VERSION}-{}.tar.gz {} \; && \
	find * -type d -name "*windows*" -exec zip -r slack-dump-${VERSION}-{}.zip {} \; && \
	cd ..

clean:
	rm -rf ./dist
