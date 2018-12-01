# haskell-starter-files
Files I use to start a Haskell project:
- .gitignore
```
dist*
static/tmp/
static/combined/
config/client_session_key.aes
*.hi
*.o
*.sqlite3
*.sqlite3-shm
*.sqlite3-wal
.hsenv*
cabal-dev/
.stack-work/
.cabal-sandbox
cabal.sandbox.config
.DS_Store
*.swp
*.keter
*.off
*~
\#*
TAGS
```


- Makefile

```
  > make      
  all                            Build all 
  build-fast                     stack build -j 8 --fast
  build                          stack build -j 8
  ghci                           stack ghci for a REPL
  ghcid                          ghcid
  haddock-server                 haddock server
  haddock                        stack build --haddock
  help                           Show help
  hlint                          maps to :lint 
  lint                           Run hlint on src/
  rebuild                        stack clean && stack build -j 8 --fast
  repl                           Maps to :ghci
  rerun                          stack build -j 8 --fast && export TS_ROLE=webapp; stack exec traksuit
  test                           stack test
  watch-haddock                  stack build --haddock --file-watch --fast
  watch-test                     Maps to :watch-tests 
  watch-tests                    stack test --file-watch --fast
  watch                          stack build -j 8 --file-watch --fast
```
