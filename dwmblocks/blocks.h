//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	{"Vol:", "amixer -c 1 -M -D pulse get Master | grep -o -E [[:digit:]]+% | head -n -1", 1, 0},

	{"Cpu:", "sensors | grep -i 'id' | awk 'NR==1{print $1,$2,$3,$4}' | cut -c  16- ", 15, 0},

	/*{"Clk:", "hwinfo --cpu | grep Clock: | head -n 1 | cut -c 10-", 15, 0},*/

	{"Gpu:", "sensors | grep -i 'edge' | cut -b 15,16,17,18,19,20,21,22 | cut -c  2-", 15, 0},

	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

	/*{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},*/
	
	{"", "date '+%b %d (%a) %T'",			         		5,		0},
};
//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
