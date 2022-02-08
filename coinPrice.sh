#!/bin/bash

coin=$1

curl https://raptor-trading.herokuapp.com/coins/prices -s | jq .data.${coin}inr.last
