#!/bin/sh

PASSWORD_STORE_DIR=~/.password-store

export PASSWORD_STORE_DIR 

pass_text="$(pass)"
password_input="$(yad --entry --title="Passwords" --text="${pass_text}" )"

set -- $password_input

password_path=${PASSWORD_STORE_DIR}
while [ "$1" != "" ]; do
	password_name="$1*"
	password_path="${password_path}"/"${password_name}"
	shift
done

matches=$(find "${PASSWORD_STORE_DIR}" -type f -name "${password_name}" -path "${password_path}")

if [ $(echo $matches | wc -w) -eq 1 ]; then
	no_prefix="${matches#"${PASSWORD_STORE_DIR}/"}"
	pass_password=${no_prefix%".gpg"}
	pass show "${pass_password}" -c
fi

unset PASSWORD_STORE_DIR pass_text password_input matches no_prefix pass_password
