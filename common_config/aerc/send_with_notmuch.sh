#!/bin/sh

set -eu

f=/tmp/send_with_notmuch
mkfifo "${f}"
trap "rm -f ${f}" EXIT
trap exit INT HUP TERM

notmuch insert --folder=INBOX < "${f}" &
tee "${f}" | msmtp --read-envelope-from "$@"
wait
