#!/bin/bash

killall polybar 2> /dev/null

polybar main &
polybar secondary &
