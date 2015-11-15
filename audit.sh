#!/bin/bash -x
#http://stackoverflow.com/a/15930450/2188572
#only look for xml files in all directories below your chosen directory
    

    echo "Filename,Codec" >> Users/kieranoleary/fileaudit.csv 
	
    find "$1" -name "*.mov" -o -name "*.MOV" -o -name "*.mp4" -o -name "*.MP4" -o -name "*.mkv" -o -name "*.MKV" -o -name "*.avi" -o -name "*.AVI" -o -name "*.MOV"| (
    
	while IFS= read -r file; do
    
	
	    echo "Processing "$file""
        vcodec=$(Mediainfo --Language=raw --Full --Inform=Video\;\%Codec\% "$file")
        vsize=$(Mediainfo --Language=raw --Full --Inform=General\;\%FileSize_String3\% "$file")
        
    
	
	    echo "$file","$vcodec","$vsize" >> /Users/kieranoleary/fileaudit.csv 
	
	
done
)
