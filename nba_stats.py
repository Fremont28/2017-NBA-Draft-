import pandas as pd 
import glob
import csv
import os
import sys

# Extracting player statistics from html files (via NBA Reference.com)

path="/Users/jmc/*.html"
for fname in glob.glob(path):
    f = open(fname,"r")
    for line in f:
        if "advanced." in line:
                #season
                linef = line.rsplit("advanced.")
                lineff = linef[1].rsplit("\"")
                season = lineff[0]
                # age
                linef = line.rsplit("age\" >")
                lineff = linef[1].rsplit("<")
                age = lineff[0]
                # OBPM
                linef = line.rsplit("obpm\" >")
                lineff = linef[1].rsplit("<")
                obpm = lineff[0]
                # DBPM 
                linef = line.rsplit("dbpm\" >")
                lineff = linef[1].rsplit("<")
                dbpm = lineff[0]
                # BPM
                linef = line.rsplit("bpm\" >")
                lineff = linef[1].rsplit("<")
                bpm = lineff[0]
                # VORP
                linef = line.rsplit("vorp\" >")
                lineff = linef[1].rsplit("<")
                vorp = lineff[0]
                # player name
                linef = fname.rsplit(".")
                lineff = linef[0].rsplit("/")
                playern = lineff[3]
                s = str(playern)+","+str(season)+","+str(age)+","+str(obpm)+","+str(dbpm)+","+str(bpm)+","+str(vorp)
                print(s)
