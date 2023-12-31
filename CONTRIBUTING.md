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

In particular make sure `AC_INIT` and `LT_REVISION` in `configure.ac`
has the right version information.

```
make review-diff
```

## Update NEWS entry and add release date

## GitLab CI/CD checks

```
git push
```

Check https://gitlab.com/gsasl/libntlm/-/pipelines

# Release process

Prepare tarball, sign and upload them.

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
