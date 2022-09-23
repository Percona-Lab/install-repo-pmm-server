#/bin/bash

#### download needed repos

yum-config-manager --add-repo=https://repo.percona.com/pmm2-components/yum/release/7/RPMS/x86_64/
yum-config-manager --add-repo=https://repo.percona.com/pmm2-client/yum/release/7/RPMS/x86_64/
yum-config-manager --add-repo=https://repo.percona.com/ppg-11/yum/release/7/RPMS/x86_64/

reposync --download-metadata --norepopath -n -p /var/local/repos/pmm --repoid=repo.percona.com_pmm2-components_yum_release_7_RPMS_x86_64_
reposync --download-metadata --norepopath -n -p /var/local/repos/pmm2_client --repoid=repo.percona.com_pmm2-client_yum_release_7_RPMS_x86_64_
reposync --download-metadata --norepopath -n -p /var/local/repos/pg --repoid=repo.percona.com_ppg-11_yum_release_7_RPMS_x86_64_


rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-14.noarch.rpm

reposync --download-metadata --norepopath -n -p /var/local/repos/epel --repoid=epel

### Change this variables in ansible/roles/pmm2-images/vars/main.yml
# air_gapped: "true"
# pmm2_server_repo: "file:///var/local/repos/pmm"
# pg_repo: "file:///var/local/repos/pg"
# epel_repo: "file:///var/local/repos/epel"
# pmm2_client_repo: "file:///var/local/repos/pmm2_client"

### Or run ansible like:
# ansible-playbook -v -e air_gapped=true -e pmm2_server_repo="file:///var/local/repos/pmm" -e pg_repo="file:///var/local/repos/pg" -e epel_repo="file:///var/local/repos/epel" -e pmm2_client_repo="file:///var/local/repos/pmm2_client" -i 'localhost,' -c local pmm2-docker/main.yml

# ansible-playbook -v -e air_gapped=true -e pmm2_server_repo="file:///home/dkondratenko/Workspace/github/install-repo-pmm-server/repo/pmm" -e pg_repo="file:///home/dkondratenko/Workspace/github/install-repo-pmm-server/repo/pg" -e epel_repo="file:///home/dkondratenko/Workspace/github/install-repo-pmm-server/repo/epel" -e pmm2_client_repo="file:///home/dkondratenko/Workspace/github/install-repo-pmm-server/repo/pmm2_client" -i 'localhost,' -c local pmm2-docker/main.yml