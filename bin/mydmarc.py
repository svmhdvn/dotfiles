#!/usr/bin/env python3

import gzip
import io
import mailbox
import mimetypes
import sys
import zipfile
import xml.etree.ElementTree as ET

def process_xml(xmlstring):
    root = ET.fromstring(xmlstring)
    assert root.tag == 'feedback', f"OOPS: {root.tag}"
    print("GOOD!")

def handle_zip(m):
    z = zipfile.ZipFile(io.BytesIO(m.get_payload(decode=True)))
    info = z.infolist()
    assert len(info) == 1

    process_xml(z.read(info[0]).decode('utf-8'))

def handle_gzip(m):
    process_xml(gzip.decompress(m.get_payload(decode=True)).decode('utf-8'))

def handle_xml(m):
    process_xml(m.get_payload(decode=True))

def handle_unknown(m):
    filename = m.get_filename()
    assert filename

    # TODO change to mimetypes.guess_file_type in python 3.13+
    mtype, mencoding = mimetypes.guess_type(filename)
    assert mtype == 'text/xml'

    if mencoding == 'gzip':
        handle_gzip(m)
    elif mencoding == 'zip':
        handle_zip(m)


for message in mailbox.Maildir('~/Mail/dmarc'):
    subject = message['subject']
    print("\n=====")
    print(f"Subject: '{subject}'\n")
    for part in message.walk():
        ct = part.get_content_type().lower()
        if ct == 'application/zip':
            handle_zip(part)
            found_app = True
        elif ct == 'application/gzip':
            handle_gzip(part)
            found_app = True
        elif ct == 'application/octet-stream':
            handle_unknown(part)
            found_app = True
        elif ct == 'text/xml':
            handle_xml(part)
            found_app = True
    print('=====')
