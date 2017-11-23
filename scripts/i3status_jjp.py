#!/usr/bin/python -u
import json
import time
import datetime
import re
import subprocess
from evolution_get_calendars import getNextEvent

def padoff(string, maxlen=30):
    if len(string) > maxlen:
        string = string[:maxlen-3]+"..."
    return string


class ip:
    def __init__(self, interface):
        self.interface = interface
        self.ip = None

    def __update_ip(self):
        cmd = "ip addr show "+self.interface
        output = subprocess.check_output(cmd.split())
        if "inet" not in output:
            self.ip = "N/A"
            return
        try:
            match = re.search("inet ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})", output)
            self.ip = match.group(1)
        except:
           self.ip = "none"
    def get(self):
        self.__update_ip()
        return {'name': self.interface, 'full_text': self.interface + " : " +self.ip, 'color': '#00ff00'}

class date:
    def get(self):
        return {'name': 'date', 'full_text': time.strftime("%Y-%m-%d {%W} %H:%M:%S",time.localtime()), 'color': '#ffffff'}


class usedmount:
    def __init__(self, mount):
        self.mount = mount
        self.used = None
    def __update_used(self):
        cmd = "df -h "+self.mount
        output = subprocess.check_output(cmd.split())
        match = re.search("[0-9]+\%", output)
        self.used = match.group(0)
    def get(self):
        self.__update_used()
        return {'name': 'mount'+self.mount, 'full_text': self.mount+" : "+self.used, 'color': '#00ff00'}


class nextcal:
    def get(self):
        ev = getNextEvent()
        delta = time.mktime(ev['start_st'])-time.time()
        color = "#00ff00" # green
        if delta < 4*3600:
            color = "#FFFF00"
        if delta < 10*60:
            color = "#FF0000"
        datestr = str(datetime.timedelta(seconds=int(delta)))
        full_text = datestr + " " + ev['description']
        return {'name': 'cal', 'full_text': padoff(full_text), 'color': color}

objects = [nextcal(), usedmount("/"), ip("enp0s31f6"), ip("wlp4s0"), date()]


first = True
print json.dumps({'version': 1})
print "["
while True:
    output = ""
    if not first:
        output += ","
    first = False
    
    output_dicts = []
    for o in objects:
        output_dicts.append(o.get())
    
    output += json.dumps(output_dicts)

    print output
    time.sleep(5.0)
