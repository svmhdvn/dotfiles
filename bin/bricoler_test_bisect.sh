#!/bin/sh

test_to_bisect="$1"

# NOTE use or remove the following as necessary
#  --param freebsd-src-build:clean=true \
#  --param freebsd-src-regression-suite:count=15 \
#  --param freebsd-src-regression-suite:memory=4096 \
#  --param freebsd-src-regression-suite:ncpus=2 \
#  --param freebsd-src-regression-suite:parallelism=1 \
#  --param freebsd-src:url="${HOME}/src/freebsd-src" \
#  --param freebsd-src:branch=HEAD \
#  --param freebsd-src-regression-suite-vm-image:packages= \

# TODO
# TODO CHANGE BACK TO fbsdsrcgit
"${HOME}/src/bricoler/bricoler" run freebsd-src-regression-suite \
  --param freebsd-src-regression-suite-vm-image:package_repo_file=/usr/local/etc/pkg/repos/siva.conf \
  --param freebsd-src:url="${HOME}/src/freebsd-src" \
  --param freebsd-src:branch= \
  --param freebsd-src-build:make_arguments='WITHOUT_CLANG= WITHOUT_LLD= WITHOUT_LLDB= WITHOUT_LIB32= WITHOUT_LIB64= WITHOUT_ZFS_TESTS= WITHOUT_WERROR=' \
  --param freebsd-src-regression-suite:hypervisor=bhyve \
  --param freebsd-src-regression-suite:memory=4096 \
  --param freebsd-src-regression-suite:ncpus=2 \
  --param freebsd-src-regression-suite:parallelism=1 \
  --param freebsd-src-regression-suite:count=100 \
  --param freebsd-src-regression-suite:tests="${test_to_bisect}" \
  || exit 125 # git bisect skip

"${HOME}/src/bricoler/bricoler" run freebsd-src-regression-suite report | \
  { ! grep -q "${test_to_bisect}  ->  "; }
