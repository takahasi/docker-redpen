#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" script for generate dockerfile templates

This is generating script for docker images of redpen client
"""

import os

dockerfile_template = '''FROM openjdk:8-jdk-alpine

LABEL maintainer="{maintainer}" \\
     description="docker images of redpen client."

RUN apk --update add --no-cache git && \\
    wget -q -O - 'https://github.com/redpen-cc/redpen/releases/download/redpen-{version}/redpen-{version}.tar.gz' | tar -xz && \\
    cp -av redpen-distribution-{version}/* /usr/local/ && \\
    rm -rf redpen-distribution-{version}

CMD ["redpen", "-help"]
'''


class DockerImage:
    def __init__(self, tag, version):
        self._tag = tag
        self._version = version


    def create(self):
        if not os.path.exists(self._tag):
            os.makedirs(self._tag)

        f = open(self._tag + '/Dockerfile', 'w')
        print(f)

        m = dockerfile_template
        m = m.format(maintainer="takahasi <3263ta@gmail.com>",
                     version=self._version)
        f.write(m)
        f.close()


if __name__ == '__main__':

    version = [
        ["1.10", "1.10.1"],
        ["1.9", "1.9.0"],
        ["1.8", "1.8.0"],
        ["1.7", "1.7.6"]
    ]

    for v in version:
        DockerImage(v[0], v[1]).create()
