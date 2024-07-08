#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'usage: tovw filename'
    exit 1
fi

echo 'converting to vw readable playlist...'

filename=$1

echo 'replacing escape...'
sed -i'' -e 's=/=\\=g' $filename

echo 'adjusting path...'
sed -i'' -e 's=file:\\\\\\Volumes\\Mukke1=..=g' $filename

echo 'fix url encoding'
sed -i'' -e 's/%20/ /g' $filename
sed -i'' -e 's/%21/!/g' $filename
sed -i'' -e 's/%22/"/g' $filename
sed -i'' -e 's/%23/#/g' $filename
sed -i'' -e 's/%24/\$/g' $filename
sed -i'' -e 's/%25/%/g' $filename
sed -i'' -e 's/%26/\&/g' $filename
sed -i'' -e "s/%27/'/g" $filename
sed -i'' -e 's/%28/(/g' $filename
sed -i'' -e 's/%29/)/g' $filename

sed -i'' -e 's/%2A/*/g' $filename
sed -i'' -e 's/%2B/+/g' $filename
sed -i'' -e 's/%2C/,/g' $filename
sed -i'' -e 's/%2D/-/g' $filename
sed -i'' -e 's/%2E/./g' $filename
sed -i'' -e 's=%2F=/=g' $filename

sed -i'' -e 's/%3A/:/g' $filename
sed -i'' -e 's/%3B/;/g' $filename
sed -i'' -e 's/%3C/</g' $filename
sed -i'' -e 's/%3D/=/g' $filename
sed -i'' -e 's/%3E/>/g' $filename
sed -i'' -e 's/%3F/?/g' $filename

sed -i'' -e 's/%40/@/g' $filename

sed -i'' -e 's/%5B/[/g' $filename
sed -i'' -e 's/%5C/\\/g' $filename
sed -i'' -e 's/%5D/]/g' $filename

sed -i'' -e 's/%7B/{/g' $filename
sed -i'' -e 's/%7C/|/g' $filename
sed -i'' -e 's/%7D/}/g' $filename

# this one seems special
sed -i'' -e 's/%E2%80%93/–/g' $filename
sed -i'' -e 's/%C3%A9/é/g' $filename
sed -i'' -e 's/%C2%B4/´/g' $filename


if grep -q '%' $filename; then
  echo "url decoding not completed. Extend script with missing char."
  exit 1
fi

exit 0