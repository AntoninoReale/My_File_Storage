#!/bin/bash


grep "02" 0312_Dealer_schedule | awk '{print $1, $2. $5, $6}' >> Dealers_working_during_losses
grep "05" 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
grep "08" 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
grep "11" 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
