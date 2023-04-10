#!/bin/bash

./bin/ansible_setup.sh
ansible-playbook --ask-become-pass ./tasks/01_wslconf.yml
ansible-playbook --ask-become-pass ./tasks/02_configs.yml
ansible-playbook --ask-become-pass ./tasks/03_pacmans.yml
ansible-playbook ./tasks/04_cargos.yml

