#!/bin/bash

set -e

echo "--------------------"
echo "Updating version-id in template.xml"
now=$(date '+%Y%m%d-%H%M%S')
echo "$now"

templatePath="tpl.xml"
cp "$templatePath" template.xml
id='Id'
sed -i -e "s/$id/$now/g" template.xml
echo "Version-id in template.xml is set to $now"
echo "--------------------"

echo "Compiling SASS files for ILIAS skin..."

# Remove the old CSS file
echo "Removing old StudIP-ILIAS-Style.css..."
rm -f StudIP-ILIAS-Style/StudIP-ILIAS-Style.css

# Read environment and base path from arguments
env="$1"
base_path="$2"

# Default values if not provided
if [[ -z "$env" ]]; then
    echo "⚠️  No environment specified (dev or prod), defaulting to prod"
    env="prod"
fi

if [[ -z "$base_path" ]]; then
    if [[ "$env" == "dev" ]]; then
        base_path="/ilias-studip/"
    else
        base_path="/"
    fi
    echo "ℹ️  No base path provided, using default: $base_path"
else
    echo "ℹ️  Using provided base path: $base_path"
fi

# Set build mode
if [[ "$env" == "dev" ]]; then
    build_mode="Development"
else
    build_mode="Production"
fi

# Replace the $base-path value dynamically
echo "Injecting base path..."
sed "s|\$base-path: \"/\";|\$base-path: \"$base_path\";|" \
    StudIP-ILIAS-Style/scss/StudIP-ILIAS-Style.scss > StudIP-ILIAS-Style/scss/StudIP-ILIAS-Style.compiled.scss

# Compile with SASS
echo "Compiling with sass..."
sass StudIP-ILIAS-Style/scss/StudIP-ILIAS-Style.compiled.scss StudIP-ILIAS-Style/StudIP-ILIAS-Style.css

# Cleanup
rm StudIP-ILIAS-Style/scss/StudIP-ILIAS-Style.compiled.scss

echo "✅ Compilation completed!"
echo "👉 Output: StudIP-ILIAS-Style/StudIP-ILIAS-Style.css"
echo "🔧 Mode: $build_mode"
echo "--------------------"
