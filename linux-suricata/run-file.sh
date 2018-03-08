
# curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent3.s
echo "First part of script taken from: https://docs.fluentd.org/v1.0/articles/install-by-deb"
echo "=============================="
echo " td-agent Installation Script "
echo "=============================="
echo "This script requires superuser access to install apt packages."
echo "You will be prompted for your password by sudo."

# run inside sudo
sudo sh <<SCRIPT
  curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -

  # add treasure data repository to apt
  echo "deb http://packages.treasuredata.com/3/ubuntu/xenial/ xenial contrib" > /etc/apt/sources.list.d/treasure-data.list

  # update your sources
  apt-get update

  # install the toolbelt
  apt-get install -y td-agent

SCRIPT

sudo td-agent-gem install fluent-plugin-named_pipe
sudo bash -c "cat rsyslog/rsyslog.conf >> /etc/rsyslog.conf"
sudo bash -c "cat td-agent/td-agent.conf >> /etc/td-agent/td-agent.conf"


