#!/bin/sh

#_bricoler="${HOME}/src/bricoler/python/bricoler"
_bricoler="/home/siva/src/playground/venv/bin/bricoler"
test_to_bisect="$1"

# NOTE use or remove the following as necessary
#  --param freebsd-src-build:clean=true \
#  --param freebsd-src-build:machine=riscv/riscv64 \
#  --param freebsd-src-regression-suite:hypervisor=bhyve \
#  --param freebsd-src-regression-suite:count=15 \
#  --param freebsd-src-regression-suite:memory=4096 \
#  --param freebsd-src-regression-suite:ncpus=2 \
#  --param freebsd-src-regression-suite:parallelism=1 \
#  --param freebsd-src:url="${HOME}/src/freebsd-src" \
#  --param freebsd-src:branch=HEAD \
#  --param freebsd-src-regression-suite-vm-image:packages= \
#  --param freebsd-src-regression-suite:p9fs_shares="sivashare:/mnt" \
#  --param freebsd-src-regression-suite:interactive=true \
#  --param freebsd-src-regression-suite-vm-image:loader_tunables="boot_ddb=yes" \
#  --param freebsd-src-regression-suite-vm-image:sysctls="net.inet.ipf.jail_allowed=1 kern.ipc.tls.enable=1 vfs.aio.enable_unsafe=1 kern.crypto.allow_soft=1 vm.panic_on_oom=1 security.mac.bsdextended.enabled=0 security.mac.ipacl.ipv4=0 security.mac.ipacl.ipv6=0 security.mac.portacl.enabled=0" \
#  --param freebsd-src-regression-suite:tests="${test_to_bisect}" \
#  --param freebsd-src-regression-suite-vm-image:package_repo_file=/usr/local/etc/pkg/repos/siva.conf \
#  --param freebsd-src:url="${HOME}/src/srcFBSDCOMMIT" \
#  --param freebsd-src:url="${HOME}/src/fbsd_stable_15" \
#  --freebsd-vm-image/package_repo_file=/usr/local/etc/pkg/repos/siva.conf \
#  --freebsd-vm-image/packages= \

# TODO "broken" testcases cause the command to pass, which is incorrect
${_bricoler} freebsd-regression-test-suite \
  --freebsd-vm-image/package_repo_file=/home/siva/rv64c16.repo.conf \
  --freebsd-src-build/machine=riscv/riscv64 \
  --freebsd-regression-test-suite/hypervisor=qemu \
  --freebsd-src-git-checkout/url=/usr/src \
  --freebsd-src-git-checkout/branch= \
  --freebsd-regression-test-suite/memory=4096 \
  --freebsd-regression-test-suite/ncpus=2 \
  --freebsd-regression-test-suite/parallelism=1 \
  --freebsd-regression-test-suite/count=1 \
  --freebsd-regression-test-suite/interactive=False \
  --freebsd-regression-test-suite/tests="${test_to_bisect}" \
  || exit 125 # git bisect skip

#"${HOME}/src/bricoler/bricoler" run freebsd-src-regression-suite report | \
#  { ! grep -q "${test_to_bisect}  ->  "; }
