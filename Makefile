dcmd = docker
dfile = Containerfile
dtag = immawanderer/fedora-hugo:testbuild
dargs = build -t $(dtag) --no-cache --pull - < $(dfile)
cleanargs = image rm -f $(dtag)
pruneargs = system prune -af
dargskaniko = run --rm -it -w=$(kanikowdir) -v $$PWD:$(kanikowdir):z
kanikoexecutorimg = gcr.io/kaniko-project/executor:v1.8.1-debug
kanikowdir = /src
kanikocontext = .
kanikoargs = -f=$(dfile) -c=$(kanikocontext) --use-new-run --snapshotMode=redo --build-arg BUILD_DATE=$(build_date) --build-arg VCS_REF=$(vcs_ref) --no-push
vcs_ref = $$(git rev-parse --short HEAD)
build_date= $$(date -u +"%Y-%m-%dT%H:%M:%SZ")

.PHONY: build kaniko clean test prune

kaniko:
	$(dcmd) $(dargskaniko) $(kanikoexecutorimg) $(kanikoargs)

build:
	$(dcmd) $(dargs)

clean:
	$(dcmd) $(cleanargs)

test: build kaniko

prune:
	$(dcmd) $(pruneargs)
