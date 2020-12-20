#!/usr/bin/env python3
import shutil as sh
import psutil as ps

def check_disk_usage(disk):
    du = sh.disk_usage(disk)
    free = du.free / du.toal * 100
    return free > 20

def check_cpu_usage():
    cp_usage = ps.cpu_percent(1)
    return < 75

if not check_disk_usage("/") or not check_cpu_usage:
    print("ERROR")
else:
    print("Everything looks okay")
