#!/bin/bash

declare -A text_colors background_colors emphasis
declare -a formatting

escape="\e[";
reset="${escape}0m";

text_colors[default]=39
text_colors[black]=30
text_colors[red]=31
text_colors[green]=32
text_colors[yellow]=33
text_colors[blue]=34
text_colors[purple]=35
text_colors[cyan]=36
text_colors[white]=37
text_colors[bright_red]=91
text_colors[bright_green]=92
text_colors[bright_yellow]=93
text_colors[bright_blue]=94
text_colors[bright_purple]=95
text_colors[bright_cyan]=96
text_colors[bright_white]=97

background_colors[default]=49
background_colors[black]=40
background_colors[red]=41
background_colors[green]=42
background_colors[yellow]=43
background_colors[blue]=44
background_colors[purple]=45
background_colors[cyan]=46
background_colors[white]=47
background_colors[bright_black]=100
background_colors[bright_red]=101
background_colors[bright_green]=102
background_colors[bright_yellow]=103
background_colors[bright_blue]=104
background_colors[bright_purple]=105
background_colors[bright_cyan]=106
background_colors[bright_white]=107

emphasis[default]=0
emphasis[bold]=1
emphasis[italics]=3
emphasis[underline]=4
emphasis[blink]=5
emphasis[reverse]=7

echo "Enabling colored output" 
function write-log(){
	# Check - https://github.com/mercuriev/bash_colors/blob/master/bash_colors.sh
	no_color='\e[0m'
	color=$1
	log_msg=$2
	line_break="\n";
	time_stamp=`date "+%Y-%m-%d %H:%M:%S"`

	color_code="${text_colors[$color]}"
	str_color="${escape}0;${color_code}m"

	echo -e "${line_break}${time_stamp} ${str_color} ${log_msg} ${no_color}"	
}
