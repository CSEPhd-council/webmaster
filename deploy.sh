#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
# if using a theme, replace with `hugo -t <YOURTHEME>`
hugo -t hugo-theme-bootie-docs

# Go to static site folder (which has https://github.com/CSEPhd-council/CSEPhd-council.github.io as its upstream repo)
cd ../publish
# Add changes to git repo
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come back to the project root
cd ../webmaster
