#!/usr/bin/env python

import os
import sys

try:
    import readline
except ImportError:
    sys.stdout.write("Module readline not available.")
else:
    import rlcompleter
    readline.parse_and_bind("tab: complete")
    # histfile
    histfile = os.path.join(os.environ['HOME'], 'var', 'history', 'python')
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
    import atexit
    atexit.register(readline.write_history_file, histfile)
    del histfile