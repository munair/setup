Run this on a new AWS EC2 instance running Ubuntu 12.04.2 LTS to configure both the machine and the environment for developing with node.js:

```

#!/bin/bash
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/munair/setup.git
./setup/nodeup.bash   

```

See also http://github.com/munair/dotfiles and [Quilombola Engineering Dotfiles](https://github.com/munair/setup.git) for more details.





