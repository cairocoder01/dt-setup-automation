[WP-CLI](https://make.wordpress.org/cli/handbook/) provides a great deal of automation to configure and manage WP installs, including the ability to easily create custom commands (via PHP script) to do any custom configuration. 

This project creates a script that will do the following:
* Configure site settings
  * Site name/description
  * Admin email
  * Timezone
* Install Disciple.Tools theme (and uninstall all others)
* Create main dispatcher user and set as base user
* Install Mobile App Plugin
* Optionally install other recommended plugins based on included variables:
  * Disciple Tools Facebook Plugin
  * Disciple Tools Webform Plugin
  * Disciple Tools Training Plugin
  * DT Advanced Security

Many other tasks can be done such as configuring settings for specific plugins. See [WP-CLI documentation](https://make.wordpress.org/cli/handbook/) for how to extend this to fit your exact needs.

## Run Locally
```
'bash -s' < /path/to/dt-simple.sh
```

## Run Remotely (e.g. WPEngine)
For use on WPEngine, see [Using SSH gateway on WPEngine](https://wpengine.com/support/ssh-gateway/)

```
ssh mysite@mysite.ssh.wpengine.net "bash -s" < /path/to/dt-simple.sh
```