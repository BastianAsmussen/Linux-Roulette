#!/bin/bash

echo "Please don't actually play this, there's a chance you will lose all your files!"

if [ "$EUID" -ne 0 ]; then

    echo "Sorry, you can't play this without being root..."
    exit 1
fi

read -p "Are you sure you want to do this? [y/N]: " user_confirm

if [ "${user_confirm,,}" != "y" ]; then

    echo "Good choice..."
    exit 0

else

    echo "Okay, but don't say I didn't warn you!"
fi

barrel_position=$(($RANDOM % 6 + 1))
bullet_position=$(($RANDOM % 6 + 1))
distance_from_bullet=$(($barrel_position-$bullet_position))

echo "Spinning the barrel..."
sleep $(($RANDOM % 5 + 1)) # sleep for between 1 and 5 seconds.

if [[ $barrel_position -eq $bullet_position ]]; then

    echo "*BAM* You lose, goodbye files!"
    #sudo rm -rfv --no-preserve-root /

else

    echo "*CLICK* You survived, you are lucky!"

    echo "The bullet was at slot $bullet_position, and you rolled $barrel_position!"

    if [[ ${distance_from_bullet#-} -eq 1 ]]; then

        echo "You were ${distance_from_bullet#-} slot from the bullet..."

    else

        echo "You were ${distance_from_bullet#-} slots from the bullet..."
    fi
fi
