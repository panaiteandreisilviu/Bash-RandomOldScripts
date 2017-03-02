#!/bin/bash
sendRequest(){
  fullresponse=$(curl -v -s --silent "http://pro.rarom.ro/protara/limitrofe.asp?judet={$1}&a=K&b=2&c=A")
  searchedline=$(echo "$fullresponse" | grep  "&raquo;&raquo;&raquo;")
  pattern="(?<=<\/b>)(.*)(?=<\/TD><TD)"
  result=$(echo "$searchedline" | grep -oP "$pattern")
  now=$(date +"%m-%d-%Y %H:%M:%S")
  echo "$now $1: $result" >> /home/silviu/scripts/result.html
  echo "$fullresult" > /home/silviu/scripts/fullresult.html
}

#judete=(AB AG AR BC BH BN BR BT BV BZ CJ CL CS CT CV DB DJ GJ GL GR HD HR IF IL IS MH MM MS NT OT PH SB SJ SM SV TL TM TR VL VN VS)
judete=(AB AG)
for judet in "${judete[@]}"
do
 sendRequest $judet
done

