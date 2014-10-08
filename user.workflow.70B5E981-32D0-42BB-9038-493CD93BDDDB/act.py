# -*- coding: utf-8 -*-

import sys
import alp
import tempfile
import shutil
import os
import zipfile
from StringIO import StringIO


def act():
    q = sys.argv[1:]
    tmp = tempfile.mkdtemp()

    def do_download(address, name):
        r = alp.Request(address)
        r.request.encoding = "utf-8"
        f = tempfile.NamedTemporaryFile(suffix=".alfredworkflow", dir=tmp, delete=False)
        f.write(r.request.content)
        f.close()
        shutil.copy(f.name,
            os.path.join(os.path.expanduser("~/Downloads/"), "{0}.alfredworkflow".format(name)))

    if q[0] == "update-all":
        to_download = q[1:]
        i = len(to_download)
        for download in to_download:
            name, target_path, remote = download.split(">")
            if name != "Alleyoop":
                do_download(remote, target_path)
            else:
                do_download(remote, target_path, unzip=False)
            i -= 1
            i_sib = "" if i == 1 else "s"
            n = alp.Notification()
            n.notify("Alleyoop", "Downloaded {0}".format(name),
                    "{0} update{1} remaining.".format(i, i_sib))
        print "All updates complete."

    elif q[0] == "update":
        name, target_path, remote = q[1].split(">")
        if name != "Alleyoop":
            do_download(remote, name)
            print "Downloaded {0}".format(name)
        else:
            do_download(remote, name)
            print "Saved Alleyoop to Downloads."

    shutil.rmtree(tmp, True)



if __name__ == "__main__":
    act()
