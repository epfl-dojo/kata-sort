#!/bin/sh

echo "MACHINE=$MACHINE"
time ruby ./sort.rb
time lua ./sort.lua
