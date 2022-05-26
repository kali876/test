#!/bin/sh

TIMESTAMP=$(TZ=UTC git show --quiet --date='format-local:%s' --format="%cd")

app_old_version=$(cat ./pubspec.yaml | grep version: | sed -n '1p' | awk '{print $2}')
aqa_old_version=$(cat ./aqa/package.json | grep '^\ \ \ \ \"version\":' | awk '{print $2}' | sed -r 's/\"|\,//g')

new_version="${app_old_version%.*}.$TIMESTAMP"

sed -i '' "s/$app_old_version/$new_version/" ./pubspec.yaml
sed -i '' "s/$aqa_old_version/$new_version/" ./aqa/package.json

export APP_VERSION=new_version
