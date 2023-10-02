#!/bin/bash
if [ "$#" -eq 2 ]; then
    MAX_LOOPS=99
    export SUB_DIR="$1"
    PROMPT="$2"
else
    MAX_LOOPS="$1"
    export SUB_DIR="$2"
    PROMPT="$3"
fi
mkdir -p "Stories/$SUB_DIR/"{Text,PDF,Uncompressed,MP3}
export STORY_PROMPT="$PROMPT"
seq 0 $MAX_LOOPS | parallel -j 5 Code/get_story.sh {}
for file in "Stories/${SUB_DIR}/Text/"*.txt ; do
    python3 Code/text2pdf.py "$file" "Stories/$SUB_DIR/PDF/$(basename "$file" .txt).pdf" &> /dev/null
    say -v Karen -o "Stories/$SUB_DIR/Uncompressed/$(basename "$file" .txt).aiff" "$(cat "$file")" &> /dev/null
    ffmpeg -i "Stories/$SUB_DIR/Uncompressed/$(basename "$file" .txt).aiff" -ac 1 -ar 22050 -ab 64k "Stories/$SUB_DIR/MP3/$(basename "$file" .txt).mp3" &> /dev/null
done
