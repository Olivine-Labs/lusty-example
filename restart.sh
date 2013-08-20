PID=$(cat logs/nginx.pid)
PID2=$(($PID + 1))

kill -9 $PID
kill -9 $PID2

openresty -p `pwd`/ -c conf/nginx.conf
