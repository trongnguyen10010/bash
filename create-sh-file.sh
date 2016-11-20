#!/bin/bash
echo -n "enter filename: "
read filename
touch $filename && chmod 744 $filename && vi $filename
