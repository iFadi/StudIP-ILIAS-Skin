#!/bin/bash
echo "--------------------"
echo "Updating version-id in template.xml"
#get current date and time
now=$(date '+%Y%m%d-%H%M%S')
echo "$now"
templatePath="tpl.xml"
cp $templatePath template.xml
id='Id'
sed -i -e "s/$id/$now/g" template.xml
echo "Version-id in template.xml is set to $now"
echo "--------------------"
echo "Compile sass files:"
echo "Remove the old css-File studip-ilias-style.css..."
sudo rm StudIP-ILIAS-Style/studip-ilias-style.css
echo "Compile..."
sudo sass StudIP-ILIAS-Style/studip-ilias-style.scss  StudIP-ILIAS-Style/studip-ilias-style.css
#sudo chown www-data:www-data studip-ilias-style.css
#sudo chown www-data:www-data template.xml
echo "...done!"
echo "--------------------"