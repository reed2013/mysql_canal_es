#!/bin/bash

make_json_data()
{
    cat << EOF
{
    "mappings": {
        "_doc": {
            "properties": {
                "name": {
                    "type": "text"
                },
                "c_time": {
                    "type": "date"
                }
            }
        }
    }
}
EOF    
}

curl -g -i -H "Content-Type:application/json" -X PUT "http://localhost:9200/mytest_user" -d '$(make_json_data)'