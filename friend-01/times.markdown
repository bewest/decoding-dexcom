Below is what I’ve got for times.
Look through a current trace and anything “E7 08” is most likely a time record.
 
When I visualize a dump, I’ve been breaking the data up, by the time stamp, so I wasn’t seeing it…
Example values:
8E0014ACC2BDEE75087DB67508
8E0014ADD814F17508D4B87508
8900146DA841F2750801BA7508
8A00149D6B6CF375082CBB7508
8800141E2A98F4750858BC7508
 
First 4 char’s are the glucose.  At the end of each packet is display time and internal time (or the reverse). 
For the first line it’s: BDEE7508 7DB67508
 
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
