#! /bin/sh

set -e

mkdir -p /tmp/vboxadditions
mount /dev/cdrom /tmp/vboxadditions

set +e

/tmp/vboxadditions/VBoxLinuxAdditions.run

grep -ci 'err\|fail' /var/log/vboxadd-install*

if [[ "$?" -eq "0" ]]; then
	echo "Unsuccessful installation somewhere"
	exit 1
fi
set -e

umount /tmp/vboxadditions
rmdir /tmp/vboxadditions
