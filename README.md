# PowerShell script to Convert UTF-8 misinterpreted file names
You'd think that somebody else would have come up with a quick script to do just that on Windows, but it looks like nobody else bothered, so here goes.
Here's the deal: You copied a bunch of files, and somewhere along the way, one of the applications screwed up and did not produce actual Unicode file names but instead misinterpreted the UTF-8 sequences as CodePage 1252, resulting in something dreadful like this:

![alt text](https://raw.githubusercontent.com/arisohandriputra/Powershellscriptconvertutf8/main/prev_img1.png)
