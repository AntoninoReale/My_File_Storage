#!/bin/bash
grep $1 $2_Dealer_schedule | awk -F , ''$3'_Dealer_FNAME LAST {print $1, $2, $3, $4, $5, $6, $7, $8}'
