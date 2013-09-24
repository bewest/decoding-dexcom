
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
 



