#link=$(head -1 filetemp)
file=$(head -1 /home/pi/bot/op/filetemp | cut -d '"' -f 2)
img=$(head -1 /home/pi/bot/op/filetemp | cut -d '"' -f 4)
#echo "$file ++ $img"

echo "$file" | mail -s "$img" rasbebuy2@gmail.com
sed -i.bak -e '1d' /home/pi/bot/op/filetemp
echo "$file" >> /home/pi/bot/op/log
#echo 'eval '$file''
#echo $link | cut -d '"' -f 4
