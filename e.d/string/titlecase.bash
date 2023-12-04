#!/bin/bash
#@ Function: titlecase
#@ Desc    : Upper case first letter of each word, lowercase the rest.
#@ Synopsis: titlecase "str" [...]
#@ Example : str="dharmA bUms"
#@         : titlecase "$str"
#shellcheck disable=SC2048,SC2086
titlecase() { 
	(($#)) || { echo; return 0; }
	[[ -z $* ]] && { echo; return 0; } 
	set ${*,,}
	echo "${*^}"
}
declare -fx titlecase
#fin
