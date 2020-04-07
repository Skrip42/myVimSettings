#!/usr/bin/env python3
import sys

lines = []
maxLength = 0
for line in sys.stdin:
    line = line.replace("\n", '')
    lines.append(line)
    if len(line) > maxLength:
        maxLength = len(line)

for line in lines:
    while(len(line) < maxLength):
        line += ' '
    print(line)
