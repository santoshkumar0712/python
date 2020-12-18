#!/usr/bin/env python3
def writeFile():
    with open("WriteFile.txt",'w') as file:
        name=['Santosh','Aahan','Avighn','Tulika']
        for i in name:
            file.write(i+'\n')

def readFile():
    with open("WriteFile.txt",'r') as file:
        for i in file:
            print('my name is {} Sharma'.format(i.strip()))

def appendFile():
    with open("WriteFile.txt",'a') as file:
        newName=['Aditi','Gaurav']
        for i in newName:
            file.write(i+'\n')

writeFile()
readFile()
appendFile()
readFile()
