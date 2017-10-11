#!/bin/sh
# host entry -> '10.4.1.4   dockerreigstry.pagero.local'
# 1. run debian image
# 2. check host entry exists in /etc/hosts file
# 3. if not exists add it to /etc/hosts file 
docker run -it --privileged --pid=host debian nsenter \
    -t 1 -m -u -n -i sh \
    -c "if ! grep -q dockerregistry.pagero.local /etc/hosts; then echo -e '10.4.1.4\tdockerregistry.pagero.local' >> /etc/hosts; fi"
