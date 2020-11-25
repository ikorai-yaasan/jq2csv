#!/bin/bash

SCRIPT_FILE=$(basename $0)
echo $SCRIPT_FILE

json1=j1.json
json2=j2.json
json3=ja.json
csv1=j1.csv
csv2=j2.csv
csv3=ja.csv

cat ./test.json | jq '.[] | {id: .id, login: .login}' >$json1
tmp=($(cat ./test.json | jq '.[] | .id'))

echo >$json2

for i in ${tmp[@]}; do
        echo '{'>>$json2
        echo '    "id":' $i,>>$json2
        echo '    "hoge": "hogehoge"' >>$json2
        echo '}' >>$json2
done


cat $json1 | jq -s -r '.[] | [.id, .login] | @csv' >$csv1
cat $json2 | jq -s -r '.[] | [.id, .hoge] | @csv' >$csv2
