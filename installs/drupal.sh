cd ../html


echo "Downloading Drupal 8.1.1"
curl https://ftp.drupal.org/files/projects/drupal-8.1.1.tar.gz -o "drupal-8.1.1.tar.gz"

echo "Unzipping Drupal  8.1.1"
tar -xvzf drupal-8.1.1.tar.gz --strip-components=1

echo "Removing downloaded Drupal 8.1.1 archive"
rm -rf drupal-8.1.1.tar.gz
