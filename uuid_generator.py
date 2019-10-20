#!/usr/bin/python
# read in.csv adding one column for UUID

import csv
import uuid

fin = open('crime.csv', 'rb')
fout = open('out.csv', 'w')

reader = csv.reader(fin, delimiter=',', quotechar='"')
writer = csv.writer(fout, delimiter=',', quotechar='"')

firstrow = True
for row in reader:
    if firstrow:
        row.append('ID')
        firstrow = False
    else:
        row.append(uuid.uuid4())
    writer.writerow(row)