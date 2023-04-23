#!/bin/sh
#
pen_id=$(xinput list | grep "UGTABLET UGEE S1060 Pen (0)" | awk -F'id=' '{print $2}' | awk '{print $1}')


xinput map-to-output $pen_id DP-1-2
