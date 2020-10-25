#!/bin/bash
#X Function: convertCfg2php
#X Desc    : Convert bash configuration file to php format. 
#X Synopsis: convertCfg2php [bash_infile [php_outfile_name]]
#X         : if bash_infile is not specified, default to stdin.
#X         : if php_outfile_name is not specified, default to stdout.
#X Example : convertCfg2php $OKSYSADMIN.sh $OKSYSADMIN.php
convertCfg2php() {
	local infile='/dev/stdin' outfile='/dev/stdout'
	if (($#)); then
		infile="$1"
		shift
		(($#)) && outfile="$1"
	fi
	(	echo '<?'
		while read -r line; do
			[[ -z $line || ${line:0:2} == '#!' ]] && continue
			if [[ ${line:0:1} == '#' ]]; then
				line="//${line:1}"
			elif [[ $line == *'='* ]]; then
				line="\$${line};"; line=${line//;;/;}		
			fi
			echo "$line"
		done <"$infile"
		echo '?>'
	) >"$outfile"
}
declare -fx 'convertCfg2php'
#fin
