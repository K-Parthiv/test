#!/bin/bash

# To reduce duplicates every loop checks once for existence of the file to reduce redundancy
if [ ! -d "ten" ];
	then	
		mkdir ten
fi

for n in $( seq -f "%01g" 1 10 ) ;  # -f formats output
				    # %0<number>g Specifies number of zeroes we want in our script
	do
		dir="ten/dir$n"
		
		if [ ! -d "$dir" ];
		then
			mkdir "$dir"
		fi
		
		for m in $( seq 1 4 );
			do
				file="$dir/file$m.txt"
				case $m in
					1)
						echo "1" > "$file";;
					2)
						echo -e "2 \n2" > "$file";; # -e helps in recognising \n
					3)
						echo -e "3 \n3 \n3" > "$file";;
					4)
						echo -e "4 \n4 \n4 \n4" > "$file";;
				esac
			done
	done

					
		
