#!/usr/bin/fish

set SVG $argv[1]
set NAME (echo $SVG | sed -e 's/.svg//g')

mkdir -p dist/$NAME/images
inkscape -z -w 48 -h 48 $SVG -e dist/$NAME/favicon.ico
inkscape -z -w 144 -h 144 $SVG -e dist/$NAME/images/android-chrome-144x144.png
inkscape -z -w 192 -h 192 $SVG -e dist/$NAME/images/android-chrome-192x192.png
inkscape -z -w 36 -h 36 $SVG -e dist/$NAME/images/android-chrome-36x36.png
inkscape -z -w 48 -h 48 $SVG -e dist/$NAME/images/android-chrome-48x48.png
inkscape -z -w 72 -h 72 $SVG -e dist/$NAME/images/android-chrome-72x72.png
inkscape -z -w 96 -h 96 $SVG -e dist/$NAME/images/android-chrome-96x96.png
inkscape -z -w 114 -h 114 $SVG -e dist/$NAME/images/apple-touch-icon-114x114.png
inkscape -z -w 120 -h 120 $SVG -e dist/$NAME/images/apple-touch-icon-120x120.png
inkscape -z -w 144 -h 144 $SVG -e dist/$NAME/images/apple-touch-icon-144x144.png
inkscape -z -w 152 -h 152 $SVG -e dist/$NAME/images/apple-touch-icon-152x152.png
inkscape -z -w 180 -h 180 $SVG -e dist/$NAME/images/apple-touch-icon-180x180.png
inkscape -z -w 57 -h 57 $SVG -e dist/$NAME/images/apple-touch-icon-57x57.png
inkscape -z -w 60 -h 60 $SVG -e dist/$NAME/images/apple-touch-icon-60x60.png
inkscape -z -w 72 -h 72 $SVG -e dist/$NAME/images/apple-touch-icon-72x72.png
inkscape -z -w 76 -h 76 $SVG -e dist/$NAME/images/apple-touch-icon-76x76.png
inkscape -z -w 180 -h 180 $SVG -e dist/$NAME/images/apple-touch-icon-precomposed.png
inkscape -z -w 180 -h 180 $SVG -e dist/$NAME/images/apple-touch-icon.png
inkscape -z -w 16 -h 16 $SVG -e dist/$NAME/images/favicon-16x16.png
inkscape -z -w 194 -h 194 $SVG -e dist/$NAME/images/favicon-194x194.png
inkscape -z -w 32 -h 32 $SVG -e dist/$NAME/images/favicon-32x32.png
inkscape -z -w 96 -h 96 $SVG -e dist/$NAME/images/favicon-96x96.png
inkscape -z -w 144 -h 144 $SVG -e dist/$NAME/images/mstile-144x144.png
inkscape -z -w 150 -h 150 $SVG -e dist/$NAME/images/mstile-150x150.png
inkscape -z -w 310 -h 150 $SVG -e dist/$NAME/images/mstile-310x150.png
inkscape -z -w 310 -h 310 $SVG -e dist/$NAME/images/mstile-310x310.png
inkscape -z -w 70 -h 70 $SVG -e dist/$NAME/images/mstile-70x70.png
cp $SVG dist/$NAME/images/safari-pinned-tab.svg
cp browserconfig.xml favicons.html manifest.json dist/$NAME/
inkscape -z -w 400 -h 400 -e dist/$NAME/{$NAME}-400.png $SVG
inkscape -z -w 600 -h 600 -e dist/$NAME/{$NAME}-600.png $SVG
inkscape -z -w 800 -h 800 -e dist/$NAME/{$NAME}-800.png $SVG
convert dist/$NAME/{$NAME}-400.png -gravity center -background "#5D4037" -extent 1920x1080 dist/$NAME/{$NAME}-background-2k.png
convert dist/$NAME/{$NAME}-800.png -gravity center -background "#5D4037" -extent 3840x2160 dist/$NAME/{$NAME}-background-4k.png
convert dist/$NAME/{$NAME}-600.png -gravity center -background "#5D4037" -extent 2560x1440 dist/$NAME/{$NAME}-background-3k.png
convert dist/$NAME/{$NAME}-800.png -gravity center -background "#5D4037" -extent 1440x2560 dist/$NAME/{$NAME}-background-phone.png
