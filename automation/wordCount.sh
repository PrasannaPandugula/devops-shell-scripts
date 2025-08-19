#!/bin/bash

str=mississipi

grep -o "s" <<< "$str" | wc -l

