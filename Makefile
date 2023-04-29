.PHONY: deploy

deploy: docs
	@echo "=====> deploying to Github"
	git worktree add /tmp/book gh-pages
	mdbook build
	cp -rp docs/* /tmp/book/
	cd /tmp/book && \
		git update-ref -d refs/heads/gh-pages && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push --force origin gh-pages

clean:
	@echo "=====> cleaning worktree"
	git worktree prune -v
	git worktree prune -v
	rm -rf /tmp/book
