# install-repo-pmm-server

## THIS IS NOT SUPPORTED WAY TO INSTALL PMM SERVER

Ansible scripts to install PMM Server on RedHat 7

```
git clone https://github.com/Percona-Lab/install-repo-pmm-server
cd install-repo-pmm-server/ansible

ansible-playbook -v -i 'localhost,' -c local pmm2-docker/main.yml
ansible-playbook -v -i 'localhost,' -c local /usr/share/pmm-update/ansible/playbook/tasks/update.yml
```
