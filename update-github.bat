#!/bin/bash
pushd D:\Documents\MIT\2010-2011\SP.211-8.012\ESG-SP.211-8.012
start latex esg8012pset.ins
git add .
git commit -a
cd .git/hooks
sh pull-github
sh push-github
popd