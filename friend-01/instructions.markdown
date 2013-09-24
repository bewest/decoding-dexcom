
                                 
From windows you can do:

```csharp
Dexcom.ReceiverApi.ReceiverApi api = new Dexcom.ReceiverApi.ReceiverApi();
api.Connect();
System.Xml.XmlDocument xd = Dexcom.ReceiverApi.DownloadReceiverHelper.DownloadReceiver(api, Dexcom.ReceiverApi.ReceiverValues.AllKnownReceiverRecords, null, null);                   
api.Disconnect();
api.Dispose();
System.Xml.XmlDocument xd1 = Dexcom.ReceiverApi.ReceiverTools.ExpandReceiverDownload(xd);
xd1.Save("dexfile.xml");
```

That gets you a dump of everything on the Dex.  Using this program I used a serial port monitor to figure out
what needs to be sent to the Dex.

You basically ask it how many pages of data it has.  Then you request the last page.
You also ask how many readings are in the last page, that allows you to parse out the final record.


```csharp
//Establish a Serial Connection

mySerial = new System.IO.Ports.SerialPort("/dev/ttyACM0", 115200);


//This gets the Dexcom ready to talk to you
SendData(HexToByte("01 06 00 0a 5e 65"));


//this asks for a count of the number of pages in use
SendData(HexToByte("01 07 00 10 04 8b b8"));
received = ReadData();
               
byte[] comCommand;
//most of this is just place holders
//will fill in with real information as we go
//
comCommand = HexToByte("01 0c 00 11 04 44 00 00 00 01 a1 db");
                byte[] page = HexToByte(received);
                comCommand[5] = page[8];
                comCommand[6] = page[9];

                //this is the CRC calculation, a checksum on the packet you are sending
                //the code for the crc is a copy of what dexcom uses
                uint crc2 = Crc.CalculateCrc16(comCommand, 0, 10);

                byte[] CRC = HexToByte(crc2.ToString("X").PadLeft(4, '0'));

                //switch the order of the bytes
                comCommand[10] = CRC[1];
                comCommand[11] = CRC[0];

                //now you are asking for the last page of data
                SendData(comCommand);


                received = ReadData();

                mySerial.Close();


                byte[] receivedByte = HexToByte(received);
                byte[] b = new byte[1];


                string recordCount = BitConverter.ToString(b);

                int rc = int.Parse(recordCount, System.Globalization.NumberStyles.HexNumber);
    
                string comData = BitConverter.ToString(receivedByte);

                //ninth byte tells you how many records in the packet
                int recordHeader = 108;
                int pageCounter = 12;
                int glucoseRecord = 27;

                int startPos = recordHeader + ((pageCounter + glucoseRecord) * (rc - 1)) + pageCounter;
                int numa = int.Parse(comData.Substring(startPos, 2), System.Globalization.NumberStyles.HexNumber);
                int numb=0;
                numb = int.Parse(comData.Substring(startPos+3, 2), System.Globalization.NumberStyles.HexNumber);
                
                if(numb>1){
                  numb=0;
                }
                // if you are over 255, dexcom setsa bit to 1 otherwise it's always 0
                numa=numa+(numb*255);

```


