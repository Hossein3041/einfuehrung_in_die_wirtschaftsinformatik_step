#!/bin/bash

cat $1 | grep "^[^|]*|5" | sort | uniq 
