## Manage nodes (add slaves)
Nodes need java installed on them unless user for slave has install rights

Settings in UI when adding a node:
  Launch method: Launch slave agents via SSH
  Host: IP address configured in Vagrantfile
  Credentials: set up jenkins creds
    SSH Username with private key
    Private key: enter directly (copy from .vagrant/machines/<machine name>/virtualbox/private_key
      OR: set up a user (TODO)

