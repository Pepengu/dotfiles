##!/usr/bin/env bash

while getopts 'ud' OPTION; do
    case "$OPTION" in
        u)
            brightnessctl s 10%+
            ;;
        d)
            brightnessctl s 10%-
            ;;
    esac
done
if [ "$(brightnessctl g)" == 0 ]; then
    brightnessctl s 1
fi
