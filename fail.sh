#!/bin/bash

grep "failed=1" recap > un

sed 's/\.com.*/.com/' un > ho

tr '\n' ',' < ho > hos
