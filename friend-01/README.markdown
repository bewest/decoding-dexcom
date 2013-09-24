
# peer review and collaboration

The following was result of discussion from friends working on
the same problem:


 
After sending "`01 07 00 10 04 8b b8`", the dex will reply with
how many pages of data it has in bytes 8,9.  The “07” I believe
is asking for glucose data, there’s 11ish record types that you
can ask for,
 
My code just asks for the last page, then figures out where the
last value is.  You’d want to do a loop and retrieve all the
pages.
 
## caveats

> I have some concerns about legal issues that could arise,
> hence I’m avoiding giving anything away that works.  Some
> idiot could play with this, and die because they
> misinterpreted  something.  Hence, I wouldn’t want to give
> anybody an exe that could (due to a bug I created), return an
> erroneous result, and I get sued.

### examples

* the dex records a glucose value of 5 or 10 (I forget which), when it’s having a sensor issue. 
* You can brick the dexcom.  Send the wrong sequence and it’s dead.  I know.  There’s an enable samba method that you DO NOT want to call.
  * Also, it appears if you send enough malformed requests, it may decide it has a hardware fault.
  * It takes a couple of full restarts with a paperclip, before it comes out of that.  
 
I couldn’t find the time, it’s easy to get from c#,  you could
trace from there.  I’d like the time, but I couldn’t figure it
out.

Anyway, I thought the time could be something like seconds since the epoch … so may be hard to deduce.  You can also read the battery level, again, I had the hex for it, but I couldn’t work out how to get the real value.
 


