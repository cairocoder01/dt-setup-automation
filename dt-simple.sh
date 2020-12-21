SITE_NAME="Disciple Tools"
GMT_OFFSET=0
USERNAME=user1
USEREMAIL=user1@test.com
ADMINEMAIL=me@mydomain.com
SITE_DOMAIN=$(echo $(wp option get siteurl) | sed -E 's/http[s]?:\/\///g')
PLG_WEBFORM=1
PLG_FACEBOOK=1
PLG_TRAINING=0
PLG_ADV_SECURITY=1

# Site settings
wp option update blogname "$SITE_NAME"
wp option update blogdescription ""
wp option update admin_email "$ADMINEMAIL"
wp option update gmt_offset $GMT_OFFSET

# Install current Disciple.Tools theme
wp theme install $(curl -s https://api.github.com/repos/discipletools/disciple-tools-theme/releases/latest | grep browser_download_url | cut -d '"' -f 4) --activate

# Delete non-active themes (WordPress defaults)
wp theme delete --all

# User Setup: Create main dispatcher user and assign them as base user
wp user create $USERNAME $USEREMAIL --role=dispatcher
wp option update dt_base_user $(wp user get $USERNAME --field=ID)

# Install plugins
wp plugin install $(curl -s https://api.github.com/repos/discipletools/disciple-tools-mobile-app-plugin/releases/latest | grep browser_download_url.*zip | cut -d '"' -f 4) --activate

if [ $PLG_FACEBOOK = 1 ]; then
wp plugin install $(curl -s https://api.github.com/repos/discipletools/disciple-tools-facebook/releases/latest | grep browser_download_url.*zip | cut -d '"' -f 4) --activate
fi
if [ $PLG_WEBFORM = 1 ]; then
wp plugin install $(curl -s https://api.github.com/repos/discipletools/disciple-tools-webform/releases/latest | grep browser_download_url.*zip | cut -d '"' -f 4) --activate
fi
if [ $PLG_TRAINING = 1 ]; then
wp plugin install $(curl -s https://api.github.com/repos/discipletools/disciple-tools-training/releases/latest | grep browser_download_url.*zip | cut -d '"' -f 4) --activate
fi
if [ $PLG_ADV_SECURITY = 1 ]; then
wp plugin install $(curl -s https://api.github.com/repos/cairocoder01/disciple-tools-advanced-security/releases/latest | grep browser_download_url.*zip | cut -d '"' -f 4) --activate
fi
