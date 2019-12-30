## TODO: set up jenkins master to run from /home/jenkins

## Manage nodes (add slaves)
Nodes need java installed on them unless user for slave has install rights

Master node needs a jenkins user (for a known_hosts file)
Adjust JENKINS_HOME here: /etc/default/jenkins

Settings in UI when adding a node:
  Launch method: Launch slave agents via SSH
  Host: IP address configured in Vagrantfile
  Credentials: set up jenkins creds
    SSH Username with private key
    Private key: enter directly
    `make slave-keys` to get each slaves ip and key
