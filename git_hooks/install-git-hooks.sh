#!/bin/sh

cd ../.git/hooks/
ln -s ../../git-hooks/post-merge .
ln -s ../../git-hooks/pre-commit .
