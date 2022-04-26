#!/bin/bash

#
# Created on Tue Apr 26 2022
#
# Created by Prabin K Datta
# Copyright (c) 2022 Prabin K Datta
#

# Homebrew
brewPath=$(command -v brew)
if [[ $brewPath == "" ]]; then
    # Install Homebrew
    echo "Installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Brew installation Completed."
else
    echo "Updating brew..."
    $brewPath update
    echo "brew Updated."
fi

# Python3
pythonPath=$(command -v python3)
pythonRequiredVersion="3.9.10"
if [[ $pythonPath == "" ]]; then
    # Install pythonv3.9.10
    echo "Installing python3..."
    $brewPath install python@3.9
else
    # Check version
    if (echo a version $pythonRequiredVersion; $pythonPath --version) | sort -Vk3 | tail -1 | grep -q Python
    then
        echo "Upgrading python3 version from $($pythonPath --version) to $pythonRequiredVersion..."
        $brewPath install python@3.9
    fi
fi

# CocoaPods
podsPath=$(command -v pod)
if [[ $podsPath == "" ]]; then
    # Install Homebrew
    echo "Installing CocoaPods..."
    $brewPath install cocoapods
    echo "Brew installation Completed."
else
    echo "Updating podfile..."
    $podsPath update
    echo "Podfile Updated."
fi

# Githook
hooksPath=$(git config core.hooksPath)
if [[ $podsPath == "" ]]; then
    echo "Setup Githooks"
    git config core.hooksPath .githooks
fi
