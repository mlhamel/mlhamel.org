# -*- coding: utf-8 -*-

"""Apache httpwd Management tool

Usage:
    httpswdy <path> <user> <password>

Options:
    -h, --help            Display this message.
    -v, --verbose         Display verbose output.
"""
from __future__ import absolute_import

import htpasswd

from docopt import docopt


def main():
    opts = docopt(__doc__)
    with htpasswd.Basic(opts["<path>"]) as passwdb:
        try:
            passwdb.add(opts["<user>"], opts["<password>"])
        except htpasswd.basic.UserExists:
            passwdb.change_password(opts["<user>"], opts["<password>"])
