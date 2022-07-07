#!/usr/bin/env fish

jq -r '.[] | [.name, .foreground, .background] | @tsv' < colors.json | while read NAME FOREGROUND BACKGROUND
    echo $NAME $FOREGROUND $BACKGROUND
    sed -e "s/BACKGROUND/$BACKGROUND/g" -e "s/FOREGROUND/$FOREGROUND/g" marshians.svg > marshians-$NAME.svg
    sed -e "s/BACKGROUND/$BACKGROUND/g" -e "s/FOREGROUND/$FOREGROUND/g" marshians-text.svg > marshians-text-$NAME.svg
		./build-images.fish marshians-$NAME.svg $BACKGROUND
		./build-images.fish marshians-text-$NAME.svg $BACKGROUND
end
