# Contributing

Development is coordinated from: https://gitlab.com/gsasl/libntlm

Clone the source code and bootstrap it as follows:

```
git clone https://gitlab.com/gsasl/libntlm.git
cd libntlm
./bootstrap
./configure
make check
```

# Release process

## Pre release checks

```
git clean -d -x -f
git reset --hard
git restore --worktree --staged .
git status
./bootstrap
./configure
make check
make prepare
```

## Review of diff since last release

Make sure `AC_INIT` and `LT_REVISION` in `configure.ac` has the right
version information.  Check `srcdist` in `cfg.mk`.

Make sure NEWS entries describe all significant modifications:

```
make review-diff
```

## Update NEWS & README with release date

## GitLab CI/CD checks

```
git push
```

Check https://gitlab.com/gsasl/libntlm/-/pipelines

# Release process

Prepare tarball, sign and upload them.  Verify that SHA256 checksums
of your tarballs match some version generated via pipeline.

```
make prepare
make ship
```

Then send an e-mail with an updated version of `doc/announce.txt`.

# Post release procedure

- Commit doc/announce.txt
- Review this file if anything was missing
- Update NEWS.
- Bump `AC_INIT` and `LT_REVISION` in configure.ac.
