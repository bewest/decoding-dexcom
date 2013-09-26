Below is what I’ve got for times.
Look through a current trace and anything `E7 08` is most likely a time record.
 
When I visualize a dump, I’ve been breaking the data up, by the time stamp, so I wasn’t seeing it…
Example values:
```
8E0014ACC2BDEE75087DB67508
8E0014ADD814F17508D4B87508
8900146DA841F2750801BA7508
8A00149D6B6CF375082CBB7508
8800141E2A98F4750858BC7508
```

First 4 char’s are the glucose.  At the end of each packet is display time and internal time (or the reverse). 
For the first line it’s: `BDEE7508 7DB67508`
 
Flip them, convert to a number(which will be in seconds) then add to the epoch.
Everything is correct, except the year.

```
0875EEBD = 141946557 = 01 Jul 1974 21:35:57
0875B67D = 141932157 = 01 Jul 1974 17:35:57 
```
 
## Example:
### Request time  ( 3 examples a couple of minutes apart, so I can see what changes)
#### Send

`01 06 00 22 34 C0`

#### Returns
```
01 0A 00 01 A7 12 E7 08 B9 80    time was:9/25/2013  ( a couple of minutes before next point
 
01 0A 00 01 36 13 E7 08 A2 07   time was:9/25/2013  5:17:42   
    
01 OA 00 01 B8 22 E7 08 55 8A  time was:9/25/2013  6:23:52
```
 
Time is:
`A7 12 E7 08`

Reverse order, and convert
```
x08E712A7  int:149361319
x08E71336  149361462
x08E722B8  149365432
```

Plug the number into http://www.epochconverter.com/, you get the correct time, day and month. The year is off, 1974...

Time since epoch is `1380134001`

## demo

```
//This gets the Dexcom ready to talk to you
01 06 00 0a 5e 65

//Request number of pages
01 07 00 10 04 8b b8
```

Just using `01 0c 00 11 04 44 00 00 00 01 a1 db` as a template of what to fill in
Bytes 6 and 7 are the number of the page you are requesting, from bytes 9 and 10 of the response from above
Bytes 11 and 12 are the crc checksum
Byte 2 is the number of bytes in the packet

```csharp

comCommand = HexToByte("01 0c 00 11 04 44 00 00 00 01 a1 db");
                byte[] page = HexToByte(received);
                comCommand[5] = page[8];  //byte 9 of the last response
                comCommand[6] = page[9];  //byte 10 of the last response

                //this is the CRC calculation, a checksum on the packet you are sending
                //the code for the crc is a copy of what dexcom uses
                uint crc2 = Crc.CalculateCrc16(comCommand, 0, 10);

                byte[] CRC = HexToByte(crc2.ToString("X").PadLeft(4, '0'));

                //switch the order of the crc bytes
                comCommand[10] = CRC[1];
                comCommand[11] = CRC[0];
```

Send it.

You get back a Page of data

```
--Header--              LR
01 46 08 01 6A 62 00 00 26 00 00 00 04 02 97 02 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 41 22 

--Date 1--- --Date 2--- gl fl    
D5 24 BF 08 95 EC BE 08 B3 00 25 89 9A 
01 26 BF 08 C1 ED BE 08 B0 00 25 A7 BA 
2E 27 BF 08 EE EE BE 08 B0 00 24 75 CE 
59 28 BF 08 19 F0 BE 08 B3 00 14 13 C9 
85 29 BF 08 45 F1 BE 08 B3 00 14 81 30 
B1 2A BF 08 71 F2 BE 08 B0 00 14 B5 20 
DD 2B BF 08 9D F3 BE 08 AD 00 14 8C 5C 
09 2D BF 08 C9 F4 BE 08 B4 00 14 D4 D8 
35 2E BF 08 F5 F5 BE 08 B7 00 14 83 72 
61 2F BF 08 21 F7 BE 08 B5 00 14 E1 38 
8D 30 BF 08 4D F8 BE 08 B2 00 14 E8 CF 
B9 31 BF 08 79 F9 BE 08 B5 00 14 D6 56 
E5 32 BF 08 A5 FA BE 08 B4 00 14 ED EF 
11 34 BF 08 D1 FB BE 08 B2 00 14 8A 4D 
3D 35 BF 08 FD FC BE 08 AF 00 14 92 8E 
69 36 BF 08 29 FE BE 08 AB 00 14 DA A8  
95 37 BF 08 55 FF BE 08 9F 00 15 80 9C 
...
```

The header is 32 bytes.  A single glucose record is 13 bytes. 
The last record counter is byte 9.

Get to the start of the last glucose record with:

```csharp
startPos = recordHeaderLength + (( glucoseRecordLength) * (lastRecord - 1));
```

Glucose is Byte 9, Byte 10 indicates if you are over 255.  If byte 10 is 1 then add 255 to the value from byte 9.

Dates are bytes 1-4 and 5-8,  convert to int, add to the epoch(1970).  The calculated year is wrong. 
If you use 2009 for the Epoch, then everything is correct...
First Date is gmt, second is display time.


A Glucose value of 5 means there's a sensor error or you're in the calibration period.
