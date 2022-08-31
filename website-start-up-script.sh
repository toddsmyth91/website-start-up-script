#! /usr/bin/bash
echo "BEGIN - Start up script for New Site"

# For changing echo message colours
COLOR1='\033[0;31m'
COLOR2='\033[0;32m'
COLOR3='\033[0;33m'
COLOR4='\033[0;34m'
COLOR5='\033[0;35m'
NC='\033[0m' # No Color

<< HTML5-BOILERPLATE
# https://github.com/h5bp/create-html5-boilerplate 
# https://github.com/h5bp/html5-boilerplate  
echo -e "${COLOR1}HTML, CSS and JS - Boilerplate"
npx create-html5-boilerplate new-site
cd new-site
HTML5-BOILERPLATE

# import boilerplate from github
git clone https://github.com/toddsmyth91/website-boilerplate.git
cd website-boilerplate

echo -e "${COLOR2}GIT - Initialisation${NC}"
# git config --global init.defaultBranch master
# git init
# git checkout -b develop
# git checkout -b master

echo -e "${COLOR2}GIT - Don't forget to update your remote url"
echo "https://careerkarma.com/blog/git-change-remote/"

echo -e "${COLOR3}NPM - Initialisation${NC}"
npm set init-author-email "toddsmyth91@gmail.com"
npm set init-author-name "Todd Smyth"
npm set init-license "MIT"
npm set init-main "index.html"
npm init -y

echo -e "${COLOR3}NPM - Installing Prettier (and enable git-format-staged)${NC}"
# NEED TO BUILD UP A PRETTIER CONFIG FILE FOR STYLES (MAYBE CHECK FOR THE SQUIZ ONE)
npm install --save-dev --save-exact prettier
echo {}> .prettierrc.json
echo "
# Ignore artifacts:
build
coverage
" >> .prettierignore
npx prettier --write .
# npx onchange "**/*" -- npx prettier --write --ignore-unknown {{changed}}
# npx husky-init
# npm install --save-dev git-format-staged
# npx husky set .husky/pre-commit "git-format-staged -f 'prettier --ignore-unknown --stdin --stdin-filepath \"{}\"' ."

echo -e "${COLOR3}NPM - Audit Fixes and Start${NC}"
# npx browserslist@latest --update-db
npm audit fix --force
# npm start

echo -e "${COLOR5}VSCODE - Open project in new window"
code .
