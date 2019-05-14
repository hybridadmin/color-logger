#!/bin/bash

declare -A text_colors background_colors emphasis
declare -a formatting

escape="\033[";
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


function write-log () {
	# check if message
	test -n "$1" || {
		echo;
		return;
	}
	
	#
	# Extract message
	#
	message=$1;
	shift;
	
	#
	# parse options
	#
	
	color="default";
	background_color="default";
	formatting+=("default");
	line_break="\n";
	TIME_STAMP=`date "+%Y-%m-%d %H:%M:%S"`
	
	while getopts ":c:k:biunlr" option; do
	case $option in
		c)
			color=$OPTARG;
			;;
		k)
			background_color=$OPTARG;
			;;
		b)
			formatting+=("bold")
			;;
		i)
			formatting+=("italics")
			;;
		u)
			formatting+=("underline")
			;;
		l)
			formatting+=("blink")
			;;
		r)
			formatting+=("reverse")
			;;
		n)
			line_break="";
			;;
	esac
	done
	
	#
	# build treatment
	#
	treatment="${escape}";
	for format in ${formatting[@]}
	do
		treatment="${treatment}${emphasis[$format]};"
	done
	# reset formatting array
	formatting=();
	treatment="${treatment}${text_colors[$color]};"
	treatment="${treatment}${background_colors[$background_color]}m"
	
	stampedMessage="$TIME_STAMP $message"	
	printf "${treatment}%s${reset}${line_break}" $stampedMessage;
}
