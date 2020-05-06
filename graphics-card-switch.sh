
#!/bin/bash

INTEL="intel"
NIVIDIA="nvidia"

current_card=$(prime-select query)

if [ "$current_card" = "$INTEL" ]
then
  new_card=$NIVIDIA
else
  new_card=$INTEL
fi

# Actually switch
echo "About to switch from $current_card to $new_card"
echo "We use sudo to run 'sudo prime-select $new_card'"
echo "Please enter password\n"
sudo prime-select $new_card
