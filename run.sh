#!/bin/bash

unset password
prompt="Enter Password:"
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password+="$char"
done
echo
echo "Done. Password=$password"
cp ~/backbase-docker/settings.xml ~/.m2/
sed -ie 's/user_name/$username/' ~/.m2/settings.xml
sed -ie 's/pass_word/$password/' ~/.m2/settings.xml
cd ~ && mvn archetype:generate -DarchetypeArtifactId=launchpad-archetype-CXP5.6 -DarchetypeGroupId=com.backbase.launchpad -DarchetypeVersion=2.2.0


