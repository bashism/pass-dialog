#!/bin/sh

PASSWORD_STORE_DIR=~/.password-store

export PASSWORD_STORE_DIR 

pass_text="`pass`"
input_password_name="`yad --entry --title="Passwords" --text="${pass_text}" `"

num_matches=`ls -l "${PASSWORD_STORE_DIR}"/"${input_password_name}"* | wc -l`

if [ ${num_matches} -eq 1 ]; then
	pass_password=`ls "${PASSWORD_STORE_DIR}"/"${input_password_name}"*`
	pass show `basename ${pass_password} .gpg` -c
fi

unset PASSWORD_STORE_DIR pass_text input_password_name num_matches pass_password
