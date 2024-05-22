#!/bin/bash

read -p "Enter fake spectra file prefix: " prefix
read -p "Enter xcm file name: " xcm_file

if ["${xcm_file}" == ""]
then
	echo "File name cannot be blank"
	exit 1 2>/dev/null
fi

if [ "${xcm_file}" != *".xcm" ]
then
	xcm_file="${xcm_file}.xcm"
fi

read -p "Enter number of fake spectra to be generated: " fake_num
if ! [[ ${fake_num} =~ ^[0-9]+$ ]]
then
	echo "Number of fake spectra must be a positive integer"
	exit 1 2>/dev/null
fi

rm -r fake-spectra
mkdir fake-spectra
if [ -d "fake-spectra" ]
then
	echo "Fake spectra directory created. Proceeding with fake spectra generation"
else
	echo "Fatal error. Fake spectra directory generatin unsuccessful"
fi

echo "Generating fake spectra..."
for i in $(seq 1 ${fake_num})
do
	echo "@../${xcm_file}
	fakeit 1
	y
	
	${prefix}-${i}.fak
	124.000, 1.000, 52610.200" | xspec > /dev/null
	mv ${prefix}-${i}.fak fake-spectra/.
	mv ${prefix}-${i}_bkg.fak fake-spectra/.
done

echo "Fake spectra generated and can be found in fake-spectra folder"
