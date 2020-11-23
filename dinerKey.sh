#!/bin/bash

wget https://tidesandcurrents.noaa.gov/noaatidepredictions.html?id=8723205 -O dinerKey

#1. grep for Today's tide which has all the information needed in one line.
#2. sed to find and replace the second occurance of <b> tag
#3. awk -F to set the input field seperator amd print only the fields needed.
#4 sed to find and remove all instances of </*b> tags
LOWAM=$(grep "Today's Tides " dinerKey  | sed 's/<b>/Next Tide: /2'| awk -F "</*td>|</*tr>" '/<\/*t[dr]>/ {print $3, $5, $7}'   | sed 's|</*b>||g')
HIGHAM=$(grep "Today's Tides " dinerKey | sed 's/<b>/Next Tide: /2'| awk -F "</*td>|</*tr>" '/<\/*t[dr]>/ {print $11, $13, $15}'| sed 's|</*b>||g')
LOWPM=$(grep "Today's Tides " dinerKey  | sed 's/<b>/Next Tide: /2'| awk -F "</*td>|</*tr>" '/<\/*t[dr]>/ {print $19, $21, $23}'| sed 's|</*b>||g')
HIGHPM=$(grep "Today's Tides " dinerKey | sed 's/<b>/Next Tide: /2'| awk -F "</*td>|</*tr>" '/<\/*t[dr]>/ {print $27, $29, $31}'| sed 's|</*b>||g')

$echo "Diner Key"
$echo $(date)
$echo $LOWAM
$echo $HIGHAM
$echo $LOWPM
$echo $HIGHPM

rm ~/dinerKey
