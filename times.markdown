
### interesting flow

This is
[alexandre's contribution](https://github.com/bewest/decoding-dexcom/blob/master/alexandre-normand/rehexed-incr.txt#L2245-L2313)

Couple of things to notice.  Total **in** length is `1059` bytes long:
32 byte header, then a 1024 data length segment.



```hex
out
0000000: 010c 0011 0a22 0000 0002 38bf            ....."....8.
in
0000000: 0126 0401 1e04 0000 1f00 0000 0a01 2200  .&............".
0000010: 0000 0000 0000 0000 0000 0000 0000 5c6e  ..............\n
0000020: 49f5 d008 ff92 d008 8700 2bf5 d008 3286  I.........+...2.
0000030: 495b d108 fff8 d008 3700 2b5b d108 03e0  I[......7.+[....
0000040: ddcb d108 9369 d108 4b00 bfcb d108 c6f9  .....i..K.......
0000050: ebe5 d108 a183 d108 5f00 cde5 d108 21f5  ........_.....!.
0000060: 1717 d208 cdb4 d108 4400 f916 d208 4ca6  ........D.....L.
0000070: 0daf d208 c34c d208 4900 efae d208 0011  .....L..I.......
0000080: a018 d308 56b6 d208 4700 8218 d308 a527  ....V...G......'
0000090: 0cae d308 c24b d308 5100 eead d308 59be  .....K..Q.....Y.
00000a0: 14f8 d308 ca95 d308 2e00 f6f7 d308 975d  ...............]
00000b0: 326a d408 e807 d408 3900 146a d408 aaf8  2j......9..j....
00000c0: 1ebb d408 d458 d408 5600 00bb d408 7308  .....X..V.....s.
00000d0: ba06 d508 70a4 d408 6700 9c06 d508 9144  ....p...g......D
00000e0: 0c50 d508 c2ed d408 5100 ee4f d508 d304  .P......Q..O....
00000f0: 2b50 d508 e1ed d408 5100 0d50 d508 bc11  +P......Q..P....
0000100: 4050 d508 f6ed d408 5100 2250 d508 c8aa  @P......Q."P....
0000110: f652 d508 acf0 d408 5000 d852 d508 8984  .R......P..R....
0000120: a5bd d508 5b5b d508 4100 87bd d508 b0e9  ....[[..A.......
0000130: 77dd d508 2d7b d508 7300 59dd d508 c0ec  w...-{..s.Y.....
0000140: ad04 d608 63a2 d508 4000 8f04 d608 3a03  ....c...@.....:.
0000150: 7e52 d608 34f0 d508 4500 6052 d608 fd38  ~R..4...E.`R...8
0000160: 2a83 d608 e020 d608 6100 0c83 d608 3737  *.... ..a.....77
0000170: 3c93 d608 f230 d608 6f00 1e93 d608 fec0  <....0..o.......
0000180: 9c9c d608 523a d608 7200 7e9c d608 98d8  ....R:..r.~.....
0000190: 6512 d708 1bb0 d608 3e00 4712 d708 b6f7  e.......>.G.....
00001a0: e935 d708 9fd3 d608 5300 cb35 d708 014d  .5......S..5...M
00001b0: 0e36 d708 c4d3 d608 5000 f035 d708 b2f2  .6......P..5....
00001c0: 5959 d708 0ff7 d608 5d00 3b59 d708 5d82  YY......].;Y..].
00001d0: b064 d708 6602 d708 5800 9264 d708 8a14  .d..f...X..d....
00001e0: 7f78 d708 3516 d708 5100 6178 d708 4609  .x..5...Q.ax..F.
00001f0: 5d8b d708 1329 d708 3f00 3f8b d708 7eed  ]....)..?.?...~.
0000200: deb4 d708 9452 d708 4f00 c0b4 d708 287d  .....R..O.....(}
0000210: ffff ffff 3d04 0000 0100 0000 0a01 2300  ....=.........#.
0000220: 0000 0000 0000 0000 0000 0000 0000 5a73  ..............Zs
0000230: d6c1 d708 8c5f d708 5500 b8c1 d708 a75f  ....._..U......_
0000240: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000250: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000260: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000270: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000280: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000290: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00002a0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00002b0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00002c0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00002d0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00002e0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00002f0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000300: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000310: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000320: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000330: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000340: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000350: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000360: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000370: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000380: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000390: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00003a0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00003b0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00003c0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00003d0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00003e0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00003f0: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000400: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000410: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000420: ffff ffff dd4b                           .....K
```

### noticeable ribbons

Notice those segments like **`dX08`, often paired with `X100` and `X700`**.

This data segment has ribbons of regular cycles:
```hex
00000a0: 14f8 d308 ca95 d308 2e00 f6f7 d308 975d  ...............]
00000b0: 326a d408 e807 d408 3900 146a d408 aaf8  2j......9..j....
00000c0: 1ebb d408 d458 d408 5600 00bb d408 7308  .....X..V.....s.
00000d0: ba06 d508 70a4 d408 6700 9c06 d508 9144  ....p...g......D
00000e0: 0c50 d508 c2ed d408 5100 ee4f d508 d304  .P......Q..O....
00000f0: 2b50 d508 e1ed d408 5100 0d50 d508 bc11  +P......Q..P....
```

### xml

In particular, this seems to match up with the
[XML exported data](https://github.com/bewest/decoding-dexcom/blob/master/alexandre-normand/incremental-export.xml#L95-L109):

```xml

    <Glucose InternalTime="2013-09-13 10:57:34" DisplayTime="2013-09-13 03:58:12" Value="64"/>
    <Glucose InternalTime="2013-09-13 11:02:34" DisplayTime="2013-09-13 04:03:12" Value="63"/>
    <Glucose InternalTime="2013-09-13 11:07:34" DisplayTime="2013-09-13 04:08:12" Value="62"/>
    <Glucose InternalTime="2013-09-13 11:12:34" DisplayTime="2013-09-13 04:13:12" Value="61"/>
    <Glucose InternalTime="2013-09-13 11:17:33" DisplayTime="2013-09-13 04:18:12" Value="60"/>
    <Glucose InternalTime="2013-09-13 11:22:34" DisplayTime="2013-09-13 04:23:12" Value="59"/>
    <Glucose InternalTime="2013-09-13 11:27:33" DisplayTime="2013-09-13 04:28:11" Value="58"/>
    <Glucose InternalTime="2013-09-13 11:32:33" DisplayTime="2013-09-13 04:33:11" Value="59"/>
    <Glucose InternalTime="2013-09-13 11:37:33" DisplayTime="2013-09-13 04:38:11" Value="61"/>
    <Glucose InternalTime="2013-09-13 11:42:33" DisplayTime="2013-09-13 04:43:11" Value="65"/>
    <Glucose InternalTime="2013-09-13 11:47:33" DisplayTime="2013-09-13 04:48:11" Value="66"/>
    <Glucose InternalTime="2013-09-13 11:52:33" DisplayTime="2013-09-13 04:53:11" Value="66"/>
    <Glucose InternalTime="2013-09-13 11:57:33" DisplayTime="2013-09-13 04:58:11" Value="66"/>
    <Glucose InternalTime="2013-09-13 12:02:33" DisplayTime="2013-09-13 05:03:11" Value="68"/>
    <Glucose InternalTime="2013-09-13 12:07:33" DisplayTime="2013-09-13 05:08:11" Value="70"/>
```

Guessing the cyclical ribbons in the above
data segment refer to the `DisplayTime`'s shown here.
There are a lot of `09`, `0D`, `0B`, `04`, `05`, `03`...

Also notice how the minutes are every 5 minutes, 3 minutes off the top
of the hour.

Minutes cycle between:
```csv
DisplayTime="2013-09-13 03:58:12"
DisplayTime="2013-09-13 04:03:12"
DisplayTime="2013-09-13 04:08:12"
DisplayTime="2013-09-13 04:13:12"
DisplayTime="2013-09-13 04:18:12"
DisplayTime="2013-09-13 04:23:12"
DisplayTime="2013-09-13 04:28:11"
DisplayTime="2013-09-13 04:33:11"
DisplayTime="2013-09-13 04:38:11"
DisplayTime="2013-09-13 04:43:11"
DisplayTime="2013-09-13 04:48:11"
DisplayTime="2013-09-13 04:53:11"
DisplayTime="2013-09-13 04:58:11"
DisplayTime="2013-09-13 05:03:11"
DisplayTime="2013-09-13 05:08:11"
```

The fifth column in the hexdump seems to cycles between:

```csv
1f00
0000
8700
3700
4b00
5f00
4400
4900
4700
5100
2e00
3900
5600
6700
5100
5100
5100
5000
4100
7300
4000
4500
6100
6f00
7200
3e00
5300
5000
5d00
5800
5100
3f00
4f00
```

So it seems the fifth column likely has some relationship to minutes.


