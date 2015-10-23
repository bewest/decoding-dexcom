decoding-dexcom
===============

[![Join the chat at https://gitter.im/bewest/decoding-dexcom](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/bewest/decoding-dexcom?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

hacking diabetes: give me my data

## Setup

There are some scripts in the
[dexcom_reader](https://github.com/bewest/decoding-dexcom/tree/master/dexcom_reader) directory.

They depend on https://github.com/compbrain/dexcom_reader.
To use these scripts:

```bash
$ git clone https://github.com/bewest/decoding-dexcom.git
$ cd decoding-dexcom/dexcom_reader
$ git clone https://github.com/compbrain/dexcom_reader.git

```
then to test that everything worked, try

```bash
$ python dxcom-scan
```

## helping

Send me your packet captures!

### fork this repo

Then
```bash
$ git clone git@github.com/<yourname>/decoding-dexcom.git
$ cd decoding-dexcom
$ git checkout -b <yourname>
$ mkdir <yourname>
$ cp ~/path/to/captures ./<yourname>
$ git add -v
$ git commit -am '<yourname> adding captures for @bewest et al.'
$ git push -u origin <yourname>
```

Then you can send me an email or a pull request.
