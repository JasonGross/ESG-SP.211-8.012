#!/bin/bash
pushd D:\Documents\MIT\2010-2011\SP.211-8.012\ESG-SP.211-8.012
git add .
git commit -a
cd .git/hooks
sh pull-github
sh push-github
popd