#!/usr/bin/env python
# encoding: utf-8
#
# Copyright © 2014 deanishe@deanishe.net
#
# MIT Licence. See http://opensource.org/licenses/MIT
#
# Created on 2014-06-05
#

"""
"""

from __future__ import print_function, unicode_literals

import sys
import hashlib
import subprocess
import argparse

from workflow import Workflow, ICON_WARNING

CACHE_RESULTS_FOR = 10  # seconds

log = None
decode = None


def find(dirpath, query):
    cmd = ['find', dirpath, '-maxdepth', '3', '-name', '*{}*'.format(query)]
    output = decode(subprocess.check_output(cmd))
    return [l.strip() for l in output.split('\n') if l.strip()]


def main(wf):
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--folder',
                        help="Search in this folder")
    parser.add_argument('query', help="Search for files with this name")
    args = parser.parse_args(wf.args)

    dirpath = args.folder
    query = args.query

    def wrapper():
        return find(dirpath, query)

    key = '{}::{}'.format(dirpath, query).encode('utf-8')
    m = hashlib.md5()
    m.update(key)
    key = m.hexdigest()

    results = wf.cached_data(key, wrapper, max_age=CACHE_RESULTS_FOR)

    if not results:
        wf.add_item('No results found', valid=False, icon=ICON_WARNING)

    for path in results:
        wf.add_item(path, valid=True, arg=path, icon=path, icontype='fileicon')

    wf.send_feedback()


if __name__ == '__main__':
    wf = Workflow()
    log = wf.logger
    decode = wf.decode
    sys.exit(wf.run(main))
