#!/usr/bin/env python3
import os
import datetime

filename="hellpword.py"
filesize=os.path.getsize(filename)
filelstmod=datetime.datetime.fromtimestamp(os.path.getmtime(filename))

print(filename)
print(filesize)
print(filelstmod)
print('{} has size {} and modified on {}'.format(filename,filesize,filelstmod))


def create_python_script(filename):
  comments = "# Start of a new Python program"
  with open(filename,'w') as f:
      f.write(comments)
  filesize = os.path.getsize(filename)
  return(filesize)

print(create_python_script("program.py"))


def new_directory(directory, filename):
  # Before creating a new directory, check to see if it already exists
  if os.path.isdir(directory) == False:
    os.mkdir(directory)

  # Create the new file inside of the new directory
  os.chdir(directory)
  with open (filename, 'w') as file:
    pass

  # Return the list of files in the new directory
  return os.listdir()

print(new_directory("PythonPrograms", "script.py"))
