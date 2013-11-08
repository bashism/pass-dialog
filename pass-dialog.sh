#!/bin/sh

PASSWORD_STORE_DIR=~/.password-store

export PASSWORD_STORE_DIR 

pass_text="$(pass)"
input_password_name="$(yad --entry --title="Passwords" --text="${pass_text}" )"

matches=$(find "${PASSWORD_STORE_DIR}" -type f -name "${input_password_name}*")

if [ $(echo $matches | wc -w) -eq 1 ]; then
	no_prefix="${matches#"${PASSWORD_STORE_DIR}/"}"
	pass_password=${no_prefix%".gpg"}
	pass show "${pass_password}" -c
fi

unset PASSWORD_STORE_DIR pass_text input_password_name matches no_prefix pass_password
