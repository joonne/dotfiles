#!/bin/sh
# descends into subfolders and sets git config's user.name & user.email into provided values or fallback

DEFAULT_NAME="Jonne Pihlanen"
DEFAULT_EMAIL="jonne.pihlanen@gmail.com"

NAME=${1:-$DEFAULT_NAME}
EMAIL=${2:-$DEFAULT_EMAIL}

for dir in */ ; do
  cd $dir
  if [ -d ".git" ]; then
    git config user.name "$NAME"
    git config user.email "$EMAIL"
  else
    echo "$dir" is not a git repo
  fi
  cd ..
done
