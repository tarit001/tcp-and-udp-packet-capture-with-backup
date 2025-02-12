#!/bin/bash

while true
do
    echo "A for TCP scan."
    echo "B for UDP scan."
    echo "Q to quite."
    read -p "Enter the choice: " x

    case $x in
        a)
            tcp=/root/tcp.txt #Here you can change your path
            if [ -f "$tcp" ]; then
                echo "Appending the file on $tcp"
            else
                echo "Creating a new file $tcp"
            fi

            if ! grep -q "    TIMESTAMP            SOURCE               DESTINATION      PORT" $tcp 2>/dev/null; then
                echo "    TIMESTAMP            SOURCE               DESTINATION      PORT" >> $tcp
            fi

            tcpdump -n -q -c 3 tcp >> $tcp
	    echo " "
            ;;

        b)
            udp=/root/udp.txt #Here you can change your path, please specify your path
            if [ -f $udp ]; then
                echo "Appending the file on $udp"
            else
                echo "Creating a new file $udp"
            fi

            if ! grep -q "    TIMESTAMP            SOURCE              DESTINATION     PORT" $udp 2>/dev/null; then
                echo "    TIMESTAMP            SOURCE              DESTINATION     PORT" >> $udp
            fi

            tcpdump -n -q -c 3 udp >> $udp
	    echo ""
            ;;


	q)
            	echo "Exiting the program. Goodbye!"
            	break
            	;;

        *)
            echo ""
	    echo "Invalid Choice"
	    echo "
	    "
            ;;
    esac
done


