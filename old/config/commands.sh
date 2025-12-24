alias pdf=evince
alias img=xdg-open
alias bat=batcat

# PhD Commands
act () {
	source ~/envs/$1/bin/activate
}

phdnweeks () {
	phd_start_date=$(date -d "2024-03-01" '+%s')
	phd_now_date=$(date '+%s')
	echo $(( (phd_now_date - phd_start_date)/(60*60*24*7) ))
}

function phdweek() {
    # Adds a week folder to the presentation
    qag_path=~/PhD/presentations/meetings/qgan/

    if [ ! -f $qag_path'/weeks/week'$1'.tex' ]
	then
	    cp $qag_path'weeks/template.tex' $qag_path'/weeks/TEMP'
	    mv $qag_path'weeks/TEMP' $qag_path'/weeks/week'$1'.tex'
	    sed -i "s/DATE/$1/g" $qag_path'/weeks/week'$1'.tex'
	else
	    echo "Week already exists, not doing anything"
	fi

}

alias phdack='echo ENGAGE has received funding from the European Union’s Horizon 2020 Research and Innovation Programme under the Marie Skłodowska-Curie Grant Agreement No. 101034267. | wl-copy'

alias phdgan='code ~/PhD/presentations/meetings/ &'

function ytdown() {
    yt-dlp --restrict-filenames -o "%(title)s" -S res:480 -P ~/yttemp/ $1
}

alias ytclear='rm -rf ~/yttemp/*'

function count() {
    ls $1 | wc -l
}

alias desytok='bash /home/samonaco/.2fa/decrypt.key.sh desy'

function getplots () {
    if ! [ -d /media/maxwell/cqan ]; then remote='max:~'; else remote='/media/maxwell' ; fi
    echo "remote is $remote"
    rsync -zarvmL\
        --include="*/"\
        --include="*.pdf"\
        --include="*.tex"\
        --exclude="*" "${remote}/qml_eval/output/" ~/qml_eval/
    }

function svg2pdf() {
  local svgfile="$1"
  local base="${svgfile%.svg}"
  
  inkscape "$svgfile" \
    --export-type=pdf \
    --export-filename="${base}.pdf" \
    --export-area-drawing \
    --export-background-opacity=0
}

function svg2pdfall() {
  for svgfile in *.svg; do
    svgtopdf "$svgfile"
  done
}

alias nafprint='/home/samonaco/PhD/print.sh'
