# install-repo-pmm-server

## THIS IS NOT SUPPORTED WAY TO INSTALL PMM SERVER
git clone https://github.com/Percona-Lab/install-repo-pmm-server

ansible-playbook -v -i 'localhost,' -c local pmm2-docker/main.yml
ansible-playbook -v -i 'localhost,' -c local /usr/share/pmm-update/ansible/playbook/tasks/update.yml
