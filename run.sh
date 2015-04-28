threshold=$1
if [ -z "$threshold" ]
then
   threshold=0.03
fi
nohup sh doom.sh $threshold &
exit 0
