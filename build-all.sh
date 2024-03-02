#!/usr/bin/env bash

function build-images () {
    SVG=$1
    NAME=$2
    BACKGROUND=$3
    mkdir -p "dist/$NAME/images"
    cp $SVG "dist/$NAME/images/safari-pinned-tab.svg"
    cp browserconfig.xml favicons.html manifest.json "dist/$NAME/"

    inkscape -w 48 -h 48 $SVG -o "dist/$NAME/favicon.png"
    inkscape -w 144 -h 144 $SVG -o "dist/$NAME/images/android-chrome-144x144.png"
    inkscape -w 192 -h 192 $SVG -o "dist/$NAME/images/android-chrome-192x192.png"
    inkscape -w 36 -h 36 $SVG -o "dist/$NAME/images/android-chrome-36x36.png"
    inkscape -w 48 -h 48 $SVG -o "dist/$NAME/images/android-chrome-48x48.png"
    inkscape -w 72 -h 72 $SVG -o "dist/$NAME/images/android-chrome-72x72.png"
    inkscape -w 96 -h 96 $SVG -o "dist/$NAME/images/android-chrome-96x96.png"
    inkscape -w 114 -h 114 $SVG -o "dist/$NAME/images/apple-touch-icon-114x114.png"
    inkscape -w 120 -h 120 $SVG -o "dist/$NAME/images/apple-touch-icon-120x120.png"
    inkscape -w 144 -h 144 $SVG -o "dist/$NAME/images/apple-touch-icon-144x144.png"
    inkscape -w 152 -h 152 $SVG -o "dist/$NAME/images/apple-touch-icon-152x152.png"
    inkscape -w 180 -h 180 $SVG -o "dist/$NAME/images/apple-touch-icon-180x180.png"
    inkscape -w 57 -h 57 $SVG -o "dist/$NAME/images/apple-touch-icon-57x57.png"
    inkscape -w 60 -h 60 $SVG -o "dist/$NAME/images/apple-touch-icon-60x60.png"
    inkscape -w 72 -h 72 $SVG -o "dist/$NAME/images/apple-touch-icon-72x72.png"
    inkscape -w 76 -h 76 $SVG -o "dist/$NAME/images/apple-touch-icon-76x76.png"
    inkscape -w 180 -h 180 $SVG -o "dist/$NAME/images/apple-touch-ico-precomposed.png"
    inkscape -w 180 -h 180 $SVG -o "dist/$NAME/images/apple-touch-icon.png"
    inkscape -w 16 -h 16 $SVG -o "dist/$NAME/images/favicon-16x16.png"
    inkscape -w 194 -h 194 $SVG -o "dist/$NAME/images/favicon-194x194.png"
    inkscape -w 32 -h 32 $SVG -o "dist/$NAME/images/favicon-32x32.png"
    inkscape -w 96 -h 96 $SVG -o "dist/$NAME/images/favicon-96x96.png"
    inkscape -w 144 -h 144 $SVG -o "dist/$NAME/images/mstile-144x144.png"
    inkscape -w 150 -h 150 $SVG -o "dist/$NAME/images/mstile-150x150.png"
    inkscape -w 310 -h 150 $SVG -o "dist/$NAME/images/mstile-310x150.png"
    inkscape -w 310 -h 310 $SVG -o "dist/$NAME/images/mstile-310x310.png"
    inkscape -w 70 -h 70 $SVG -o "dist/$NAME/images/mstile-70x70.png"
    inkscape -w 400 -h 400 -o "dist/$NAME/$NAME-400.png" $SVG
    inkscape -w 600 -h 600 -o "dist/$NAME/$NAME-600.png" $SVG
    inkscape -w 800 -h 800 -o "dist/$NAME/$NAME-800.png" $SVG

    convert "dist/$NAME/$NAME-400.png" -gravity center -background "$BACKGROUND" -alpha background -flatten -extent 1920x1080 "dist/$NAME/$NAME-background-2k.png"
    convert "dist/$NAME/$NAME-800.png" -gravity center -background "$BACKGROUND" -alpha background -flatten -extent 3840x2160 "dist/$NAME/$NAME-background-4k.png"
    convert "dist/$NAME/$NAME-600.png" -gravity center -background "$BACKGROUND" -alpha background -flatten -extent 2560x1440 "dist/$NAME/$NAME-background-3k.png"
    convert "dist/$NAME/$NAME-800.png" -gravity center -background "$BACKGROUND" -alpha background -flatten -extent 1440x2560 "dist/$NAME/$NAME-background-phone.png"
    convert "dist/$NAME/favicon.png" "dist/$NAME/favicon.ico"

    cd "dist/$NAME"
    /bin/ls | /bin/grep -v $NAME | /bin/zip -q -r "$NAME.zip" -@
    cd ../..
}

jq -r '.[] | [.name, .foreground, .background] | @tsv' < colors.json | while read COLOR FOREGROUND BACKGROUND; do
    echo $COLOR $FOREGROUND $BACKGROUND
    sed -e "s/BACKGROUND/$BACKGROUND/g" -e "s/FOREGROUND/$FOREGROUND/g" marshians.svg > marshians-$COLOR.svg
    sed -e "s/BACKGROUND/$BACKGROUND/g" -e "s/FOREGROUND/$FOREGROUND/g" marshians-text.svg > marshians-text-$COLOR.svg
		build-images marshians-$COLOR.svg "marshians-$COLOR" "$BACKGROUND"
		build-images marshians-text-$COLOR.svg "marshians-text-$COLOR" "$BACKGROUND"
  done

