dcmd = docker
dfile = Dockerfile
dtag = immawanderer/fedora-hugo:testbuild
dargs = build -t $(dtag) --pull - < $(dfile)
cleanargs = image rm -f $(dtag)
pruneargs = system prune af.
dargskaniko = run --rm -it -w=$(kanikowdir) -v $$PWD:$(kanikowdir)
kanikoexecutorimg = gcr.io/kaniko-project/executor
kanikowdir = /src
kanikocontext = .
kanikoargs = -f=$(dfile) -c=$(kanikocontext) --use-new-run --snapshotMode=redo --no-push

.PHONY: build kaniko clean prune

kaniko:
	$(dcmd) $(dargskaniko) $(kanikoexecutorimg) $(kanikoargs)

build:
	$(dcmd) $(dargs)

clean:
	$(dcmd) $(cleanargs)

prune:
	$(dcmd) $(pruneargs)
