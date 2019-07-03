# PLC-2Unidade
Lua, Java (Threads) &amp;&amp; Haskell (Threads)


## Como rodar o Lua no PC do CIn
### Créditos Rafael
```
# /bin/bash

curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz
tar -zxf lua-5.3.4.tar.gz
cd lua-5.3.4
make linux
echo "export PATH=\$PATH:$(pwd)/src" >> ~/.bashrc && \
source ~/.bashrc
lua -v
```
