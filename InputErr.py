#!/usr/bin/env python3

import os
import sys

if(sys.argv[1]):
    fileName = sys.argv[1]
    if not os.path.exists(fileName):
        with open(fileName, 'w') as f:
            f.write('New file create !!!')
    else:
        print('Error {} already exists'.format(fileName))
        sys.exit(1)
else:
    print('Pass Agrument')
