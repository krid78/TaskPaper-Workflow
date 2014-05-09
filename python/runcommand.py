#!/usr/bin/env python
# vim: ts=4:sw=4:sts=4:tw=80:expandtab:fileencoding=utf-8
# Package       :  run_command
# Author(s)     :  Daniel Kriesten
# Email         :  daniel.kriesten@etit.tu-chemnitz.de
# Creation Date :  Di 25 Jun 11:21:07 2013
####################################################################
""" runncommand
A simple wrapper to run a given command using python subprocess module
"""

import sys
import time
import subprocess

# like always .. the __logger__
import logging
import logging.handlers
__logger__ = logging.getLogger(__name__)


class RunCommand(object):
    '''wrapper class for running a command with timeout'''

    def __init__(self, command=None, timeout=25):
        '''Initialize the module'''
        __logger__.debug('''Initializing %s''', __name__)
        self._timeout = timeout
        if command:
            self._command = list(command) #create a copy of the given list
        else:
            self._command = []
        __logger__.debug('Command %s; timeout %d', command, timeout)
        self._start = -1
        self._duration = -1

    def set_timeout(self, timeout):
        ''' set a timeout '''
        assert timeout > 0
        self._timeout = timeout

    def get_starttime(self):
        ''' return the start time '''
        return self._start

    def get_duration(self):
        ''' return the duration '''
        return self._duration

    def add_command(self, command):
        '''add the command's name'''
        __logger__.debug('Adding command: %s', command)
        if len(self._command) < 1:
            self._command.append(command)
        else:
            self._command[0] = command

    def get_command(self):
        ''' return the command '''
        return self.__str__()

    def add_option(self, option, argument=None, connector=None):
        '''Add an option with optional argument'''
        # TODO: check if option/argument is a valid one
        #if option in self._optionslist:
        if argument:
            if connector:
                self._command.append('%s%s%s'%(option, connector, argument))
                __logger__.debug('added: %s%s%s', option, connector, argument)
            else:
                self._command.extend([option, str(argument)])
                __logger__.debug('added: %s %s', option, argument)
        else:
            self._command.append(option)
            __logger__.debug('added: %s', option)
        __logger__.debug('''Command is now: "%s"''', self._command)

    def run(self, timeout=None):
        '''runn command, using the command list'''
        if timeout == None:
            timeout = self._timeout
        return self._execute(self._command, timeout)

    def _execute(self, command, timeout):
        '''really execute the command, checking the return value'''
        __logger__.debug('Running (%d): %s', timeout, self.__str__())
        assert len(command) > 0
        try:
            self._start = stop = time.time()
            proc = subprocess.Popen(command, stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)

            #now we create a watchdog
            deadline = self._start+timeout
            poll_seconds = .250
            while stop < deadline and proc.poll() == None:
                time.sleep(poll_seconds)
                stop = time.time()

            if proc.poll() == None:
                __logger__.warn('%s timed out!', self.__str__())
                if float(sys.version[:3]) >= 2.6:
                    __logger__.debug('killing')
                    proc.kill()
                return None
            self._duration = stop - self._start

            stdout, stderr = proc.communicate()
        except OSError as exc:
            __logger__.error('Error "%s" while executing', exc)
            stderr = str(exc)
            stdout = None
            proc = None

        if stderr:
            __logger__.warn('StdErr: %s', stderr)
            #TODO: return None ??

        if not proc:
            __logger__.error('proc is None!')
            return None
        elif proc.returncode > 0:
            __logger__.error('Return Code is %s!', str(proc.returncode))
            return None
        elif not stdout:
            __logger__.warn('stdout is None!')
            return None
        else:
            return stdout.splitlines()

    def __str__(self):
        return ' '.join(self._command)

def unittest():
    """a small unit test for the class"""
    lggr = logging.getLogger()
    lggr.setLevel(logging.DEBUG)
    handler = logging.StreamHandler(stream=sys.stderr)
    handler.setLevel(logging.DEBUG)
    handler.setFormatter(logging.Formatter('[%(name)s.%(levelname)s] (%(filename)s.%(funcName)s): %(message)s'))
    lggr.addHandler(handler)

    cmd = RunCommand(['true'], 4)
    cmd.run()

    cmd = RunCommand(['false'], 4)
    cmd.run()

    cmd = RunCommand(['CmdNotFound'], 4)
    cmd.run()

if __name__ == '__main__':
    unittest()
