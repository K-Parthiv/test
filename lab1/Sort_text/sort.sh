#!/bin/bash

# Mah Variables
DIRECTORY=$1

# Directory not exisitng
IF [ ! -d "$DIRECTORY"];
	then
		error_exit "Invalid Directory"
fi
		
# du Shows DIsk usage
# -ah ahhh used to convert to hooman lang
# sort in reverse order -rh
du -ah "$DIRECTORY" | sort -rh | head -n 5

# Reverse of above
du -ah "$DIRECTORY" | sort -h | head -n 5

#learn ah, rh, h...
