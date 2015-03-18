set -x

./leaker.rb --limit &
./victim.rb &

status=0

for pid in $(jobs -p); do
	wait $pid || status=1
done

exit $status
