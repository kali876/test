#!/bin/sh

TIMESTAMP=$(TZ=UTC git show --quiet --date='format-local:%s' --format="%cd")
var=$(cat pubspec.yaml | grep version: | sed -n '1p' | awk '{print $2}')
new_var="${var%.*}.$TIMESTAMP"

sed -i '' "s/$var/$new_var/" pubspec.yaml
