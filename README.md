# install-repo-pmm-server

## THIS IS NOT SUPPORTED WAY TO INSTALL PMM SERVER

Ansible scripts to install PMM Server on RedHat 7

```
git clone https://github.com/Percona-Lab/install-repo-pmm-server
cd install-repo-pmm-server/ansible

ansible-playbook -v -i 'localhost,' -c local pmm2-docker/main.yml
ansible-playbook -v -i 'localhost,' -c local /usr/share/pmm-update/ansible/playbook/tasks/update.yml
```

### air-gapped environment

In case of air-gapped environment:

- mirror needed repos (epel, pmm2-components, pmm2-client, ppg-11)
- upload/mount mirrored repos to your RHEL 7 system
- modify `ansible/roles/pmm2-images/vars/main.yml` with paths to mirrored repos, set `air_gapped=true`

Or instead of modifying `ansible/roles/pmm2-images/vars/main.yml`, run ansible with defining variables:

```
ansible-playbook -v -e air_gapped=true -e pmm2_server_repo="file:///var/local/repos/pmm" -e pg_repo="file:///var/local/repos/pg" -e epel_repo="file:///var/local/repos/epel" -e pmm2_client_repo="file:///var/local/repos/pmm2_client" -i 'localhost,' -c local pmm2-docker/main.yml
```

See [air_gapped_repos.sh](./air_gapped_repos.sh) for more details on how to mirror and what vars to modify.
