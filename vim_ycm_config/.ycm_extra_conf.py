import os
import ycm_core

flags = [
    '-fexceptions',
    '-std=c++17',
    '-x',
    'c++',
    '/usr/include',
    '-I',
    '/usr/include',
    '-isystem',
    '/usr/lib/gcc/x86_64-linux-gnu/9/include',
    '-isystem',
    '/usr/include/x86_64-linux-gnu',
    '-isystem',
    '/usr/include/c++/9',
    '-isystem',
    '/usr/include/c++/9/bits'
]

SOURCE_EXTENSIONS = ['.cpp', '.cc', '.c', '.inc']

def FlagsForFile( filename, **kwargs ):
    return { 'flags': flags, 'do_cache': True }
