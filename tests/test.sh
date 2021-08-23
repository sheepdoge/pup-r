#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook playbook.yml -i 'localhost' --syntax-check
}

test::run_ansible() {
  ansible-playbook playbook.yml -i 'localhost'
}

test::assert_output() {
  apt list --installed | grep r-base
  which R
  Rscript -e 'library(renv)'
}

test::check_syntax
test::run_ansible
test::assert_output
