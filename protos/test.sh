#!/bin/bash

# check if running on WSL
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    ghz_command="ghz.exe"
    curl="cmd.exe /C curl"
else
    ghz_command="ghz"
    curl="curl"
fi

# set arguments
proto_file="./protos/chat.proto"
call_function="Chat.SendMessage"
data="{\"room\":{\"id\":2017662613},\"message\":{\"name\":\"John\",\"id\":1,\"email\":\"test\"}}"
concurrency=10
total_requests=1000
rps=200
name="gRPChat"
output="json"
target="localhost:8080"


# run the command
$ghz_command --insecure \
  --proto $proto_file \
  --call $call_function \
  -d "$data" \
  -c $concurrency \
  -n $total_requests \
  -r $rps \
  -O $output \
  $target | $curl -X POST -H "Content-Type: application/json" -d @- http://localhost/api/projects/1/ingest
