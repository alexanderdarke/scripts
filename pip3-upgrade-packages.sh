#!/bin/sh

function usage() {
    echo ""
    echo "Usage:"
    echo "  pip3-upgrade-packages.sh [-h]"
    echo ""
    echo "  -h    Display usage message"
    echo ""
    exit 0
}

while getopts "h" option; do
    case $option in
        h)
            usage
            ;;
        *)
            usage
            ;;
    esac
done

# pip3 script location
PIP3="/usr/local/bin/pip3"

# Loop over each package in the output of 'pip3 list'
for package in $($PIP3 list | tail -n +3 | cut -d ' ' -f 1)
do
    printf "%s\n" $package
    # Upgrade package and it's dependencies
    $PIP3 install -U $package
    echo
done
