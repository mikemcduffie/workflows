# -*- coding: utf-8 -*-

import alp
from alp.item import Item as I
import os
import json
import plistlib


def do_feedback():
    flowPath = os.path.split(alp.local())[0]
    candidates = []
    for dirpath, dirnames, filenames in os.walk(flowPath, topdown=False):
        for aFile in filenames:
            if aFile == "update.json":
                try:
                    fn = os.path.join(dirpath, "Info.plist")
                    if not os.path.exists(fn):
                        fn = os.path.join(dirpath, "info.plist")

                    with open(fn) as f:
                        plist = plistlib.readPlist(f)
                except IOError as e:
                    alp.log("Exception: Info.plist not found ({0}).".format(e))
                    continue
                else:
                    name = plist["name"]
                    local_description = plist["description"]
                    the_json = os.path.join(dirpath, aFile)
                    the_icon = os.path.join(dirpath, "icon.png")
                    if name != "Alleyoop":
                        candidates.append(dict(name=name, json=the_json,
                            icon=the_icon, path=dirpath,
                            description=local_description))
                    else:
                        downloads_path = os.path.expanduser("~/Downloads/")
                        candidates.append(dict(name=name, json=the_json,
                            icon=the_icon, path=downloads_path,
                            description=local_description))

    updatables = []
    all_configured = []
    for candidict in candidates:
        with open(candidict["json"]) as f:
            local = json.load(f, encoding="utf-8")
        try:
            remote_uri = local["remote_json"]
            local_version = float(local["version"])
            local_description = candidict["description"]
        except Exception as e:
            alp.log("{0} failed on key: {1}.".format(candidict["name"], e))
            continue

        r = alp.Request(remote_uri)
        remote = r.request.json
        if not remote:
            alp.log("{0} failed to load remote JSON.".format(candidict["name"]))
            continue

        should_add = True
        try:
            version = float(remote["version"])
            download_uri = remote["download_url"]
            description = remote["description"]
        except Exception as e:
            alp.log("{0} failed with error: {1}".format(candidict["name"], e))
            should_add = False
            continue


        if should_add and local_version < version:
            updatables.append(dict(name=candidict["name"],
                                   description=description,
                                   icon=candidict["icon"],
                                   download=download_uri,
                                   path=candidict["path"],
                                   version=version))
        all_configured.append(dict(name=candidict["name"],
                                   description=description,
                                   icon=candidict["icon"],
                                   download=download_uri,
                                   path=candidict["path"],
                                   version=version,
                                   local_d=local_description))

    q = alp.args()
    items = []
    if not len(q):
        if not len(updatables):
            alp.feedback(I(title="No Updates Available",
                           subtitle="All your workflows are up-to-date.",
                           valid=False))
            return
        update_all = '"update-all"'
        for updict in updatables:
            update_all += " \"{0}>{1}>{2}\"".format(updict["name"],
                            updict["path"], updict["download"])
        n = len(updatables)
        upd_sib = "s" if len(updatables) != 1 else ""
        items.append(I(title="Update All",
                       subtitle="Download and install {0} update{1}".format(n,
                                                                    upd_sib),
                       valid=True,
                       arg=update_all))

        for updict in updatables:
            items.append(I(title=updict["name"],
                           subtitle=u"v{0}\u2014{1}".format(updict["version"],
                                                        updict["description"]),
                           icon=updict["icon"],
                           arg="\"update\" \"{0}>{1}>{2}\"".format(updict["name"],
                                                                updict["path"],
                                                                updict["download"]),
                           valid=True))

    elif len(q) == 1 and q[0] == "all":
        for configured in all_configured:
            items.append(I(title=configured["name"],
                           subtitle=u"v{0}\u2014{1}".format(configured["version"],
                                                    configured["local_d"]),
                           icon=configured["icon"],
                           valid=False))

    else:
        if q[0] != "all":
            search = q[0]
            results = alp.fuzzy_search(search, updatables,
                key=lambda x: "{0} - {1}".format(x["name"], x["description"]))
            for result in results:
                items.append(I(title=result["name"],
                               subtitle=u"v{0}\u2014{1}".format(result["version"],
                                                            result["description"]),
                               icon=result["icon"],
                               arg="\"update\" \"{0}>{1}>{2}\"".format(result["name"],
                                                                result["path"],
                                                                result["download"]),
                               valid=True))
        else:
            search = q[1]
            results = alp.fuzzy_search(search, all_configured,
                key=lambda x: "{0} - {1}".format(x["name"], x["local_d"]))
            for result in results:
                items.append(I(title=result["name"],
                               subtitle=u"v{0}\u2014{1}".format(result["version"],
                                                                result["local_d"]),
                               icon=result["icon"],
                               arg="{0} up-to-date.".format(result["name"]),
                               valid=False))

    alp.feedback(items)


if __name__ == "__main__":
    do_feedback()
