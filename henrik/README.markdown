
## Dexcom RF

OK, back on track and a leap forward! Got a [CC2511EMK](http://www.ti.com/tool/cc2511emk)
It is the exact same chipset as being used in G4 transmitter but with
USB interface.
 
Started sniffing on the frequency mentioned in pump datasheet and the
frames below were sent EXACTLY every 299984 [ms]. Nothing else was
transmitted. Made a little dance, sorry didn’t video it :=)
  
So, what protocol is used? FCS ERROR is based on (hardware check)
frame checksum, and it signaled ERROR as soon as I went more than
3-4 meters from the sensor. I am 100% confident it is reliable.  FCS
ERROR is used in “SimpliciTI” protocol. Can it be? Yes, seems so;
Dest Address FFFFFFFF is broadcast according to protocol, seems
logical. Same with source address, it is unique numbers, solid every
transmission.
[Dexcom  datasheet](http://www.dexcom.com/sites/dexcom.com/files/dexcom-g4/docs/dexcomG4-UsersGuide-English-mmol24hr.pdf) gives me 
   
```
   PARAMETER PERFORMANCE CHARACTERISTICS
   TX/RX Frequencies
   2.424 999 877 GHz
   2.449 993 677 GHz
   2.474 737 539 GHz
   2.477 236 919 GHz
   Bandwidth 334.7 kHz
   Maximum Output Power 1.25 mW EIRP
   Modulation Minimum Shift Key
   Data Rate 49.987 Kbits/Sec
   Total Packet 224 bits
   Transmit Duty Cycle 4.48 ms every 5 minutes at each of the
   four TX frequencies.
    
```

### PARAMETER PERFORMANCE CHARACTERISTICS
Transmit Duty Cycle 4.48 ms every 5 minutes at each
of the four TX frequencies.
Data Detection Range 20 feet


#### capture

Never mind the middle frame, it is corrupted on purpose (lost signal
because of range). “Transaction ID” adds up, I bet the other
frequencies has matching ID’s.
 
So, the “Application payload” seems very much be the info of
interest. They are the last 7 bytes of the following dump (where the
number after “:” is the glucose readout I did on the Animas Vibe).
  
```
  FF FF FF FF 15 1F 60 00 3F 02 11 29 29 9B DE D7 00 8B : ?.? FCS
  ERROR
  FF FF FF FF 11 1F 60 00 3F 03 57 4F 29 50 2E D7 00 C6 : 4.6
  FF FF FF FF 11 1F 60 00 3F 03 5B C1 29 AE 2E D8 00 89 : 4.5
  FF FF FF FF 11 1F 60 00 3F 03 5F C3 C9 B5 2E D7 00 7A : 4.3
  FF FF FF FF 11 1F 60 00 3F 03 63 2A C9 B6 2E D7 00 EE : 4.2
  FF FF FF FF 11 1F 60 00 3F 03 67 FA C9 5B CE D7 00 77 : 4.2
  FF FF FF FF 11 1F 60 00 3F 03 6B 58 A9 51 CE D8 00 9E : 4.7
  FF FF FF FF 11 1F 60 00 3F 03 6F 83 19 FC 2E D7 00 D8 : 4.4
  FF FF FF FF 11 1F 60 00 3F 03 73 A5 B9 91 6E D8 00 9B : 5.0
  FF FF FF FF 11 1F 60 00 37 03 77 7C 0D 5C 5E D7 00 58 : 6.0
  FF FF FF FF 11 1F 60 00 3F 03 7B 75 0D 2C 7E D8 00 34 : 7.3
  FF FF FF FF 11 1F 60 00 3F 03 7F 9B 4D E3 09 D7 00 21 : 8.3
  FF FF FF FF 11 1F 60 00 3F 03 83 ED CD 90 49 D8 00 93 : 9.0
  FF FF FF FF 11 1F 60 00 3F 03 87 EC 2D 50 C9 D7 00 DA : 9.6
  FF FF FF FF 11 1F 60 00 3F 03 8B 3E 2D C7 C9 D8 00 6F : 10.1
  FF FF FF FF 11 1F 60 00 3F 03 8F B5 2D 8E 29 D8 00 BD : 10.4
  FF FF FF FF 11 1F 60 00 3F 03 93 20 AD 9D 29 D8 00 93 : ?
  FF FF FF FF 11 1F 60 00 3F 03 97 5C AD 87 29 D8 00 7D : 10.9
   

```
