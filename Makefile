
install:
	@npm install && npx husky

commit-lint:
	@npx commitlint --last --verbose --strict 

commit:
	@npm run commit 
