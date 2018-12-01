.PHONY: help build build-fast rebuild rerun clean repl ghci ghcid haddock haddock-server hlint lint test watch watch-haddock watch-tests watch-test 


.DEFAULT_GOAL := help


# this shows the target name and the text that follows the '##' for each.
help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


all:  ## Build all 
	build


build: ## stack build -j 8
	stack build -j 8


build-fast: ## stack build -j 8 --fast
	stack build -j 8 --fast


rebuild: ## stack clean && stack build -j 8 --fast
	stack clean && stack build -j 8 --fast


rerun: ## stack build -j 8 --fast && export TS_ROLE=webapp; stack exec traksuit
	pkill <EXE NAME> && stack build -j 8 --fast && stack exec <EXE NAME>


clean:
	stack clean


repl: ## Maps to :ghci
	ghci


ghci: ## stack ghci for a REPL
	stack ghci


ghcid: ## ghcid
	ghcid -c 'stack ghci'


haddock: ## stack build --haddock
	stack build --haddock


# Run 'make haddock' first
haddock-server: ## haddock server
	cd "$$(stack path --local-doc-root)" && python3 -m http.server 8001


hlint: ## maps to :lint 
	lint


lint: ## Run hlint on src/
	hlint src/


test: ## stack test
	stack test


watch: ## stack build -j 8 --file-watch --fast
	stack build -j 8 --file-watch --fast


# Watch for changes while trying to build haddock
watch-haddock: ## stack build --haddock --file-watch --fast
	stack build --haddock --file-watch --fast


watch-test: ## Maps to :watch-tests 
	watch-tests


watch-tests: ## stack test --file-watch --fast
	stack test --file-watch --fast


