## Noice detection.
Script sleeps the display if there is more noice than a certain level.
(try clapping loud to test at 0.02 RMS amplitude)

## Usage
Run the script from the terminal using `sh doom.sh 0.05`

where 0.05 is the RMS amplitude.

## Idea taken from this question on SuperUser.com:
http://superuser.com/questions/545329/how-do-i-make-a-machine-blank-screen-for-a-period-of-time-as-a-penalty-if-ce

## Solution based off this answer on SuperUser.com:
http://superuser.com/a/545334/145341

To run silently type `nohup sh doom.sh &` and then close the terminal. :D
Remember to note down the PID to kill the process with `kill <pid>`

If you forget the PID use `ps -ax` and search the list for `doom.sh` and read the PID from the first column

nohup sh doom.sh 0.02 &
