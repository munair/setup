Run this script on your MacBook Pro to configure a new AWS EC2 instance running Ubuntu 12.04.2 LTS.
Configures both the machine and the environment for developing with node.js:

```

#!/bin/bash
#
# script name : 
#	nodeup.bash
#
# takes as arguments:
#       - $1 : Amazon EC2 Instance URL
#       - $2 : Repository on GitHub [Uses Munair's Account]
#
#

ssh -i ~/Downloads/tokyomobile.pem ubuntu@$1 "git clone https://github.com/munair/setup.git"
ssh -i ~/Downloads/tokyomobile.pem ubuntu@$1 "bash -x setup/nodeup.bash $2"


```

See also http://github.com/munair/dotfiles and [Quilombola Engineering Dotfiles](https://github.com/munair/setup.git) for more details.

