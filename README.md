pass-dialog
===========

A dialog for choosing passwords from password-store

Description
-----------

It's really just a glorified zenity/yad (and potentially dialogue, xdialogue) 
dialog window.

Usage
-----

./pass-dialogue.sh

On startup, pass-dialogue presents you with a list of passwords in 
password-store's familiar "tree" format. 

pass-dialog matches by a password's unique prefix, so to choose "foo" from 
"foo", "facebook", and "fios" you would need to type "fo" in the entry box 
below the passwords. pass-dialogue will then copy the password to the clipboard 
using password-store.

To select password "bar" nested within directories alpha and omega, you can 
simply type "a o b", meaning "a[lpha]/o[mega]/b[ar]". You could even type "a 
b", since a\* is technically a prefix of a\*/o\*.

