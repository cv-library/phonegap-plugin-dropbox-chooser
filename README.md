Dropbox Chooser
===============

This is a Cordova plugin to support the Dropbox Chooser on iOS.  It embeds a copy of the Dropbox Chooser iOS SDK, version 1.1 (at the time of writing), so you do not need to download it separately.

It is licensed under the MIT license - see the LICENSE file.

Prerequisites
-------------

You will need to create a app within the Dropbox App Console (https://www.dropbox.com/developers/apps/) as a developer, with the 'permission type' of 'Drop-ins'.

Automatic Installation & Configuration (Local Build)
----------------------------------------------------

Download the Dropbox Chooser package from this repository and install using the following commands:

    $ cd [path_to_project]
    $ cordova plugin add [directory_of_dropbox_chooser]

In plugin.xml you will need to insert your PhoneGap app ID for $APP_ID:

    `<string>$APP_ID</string>`

In addition, once a Dropbox app has been created, you will be presented with an app key (viewable on the app settings page) which you will need to insert into the following tag within plugin.xml where $DROPBOX_APP_KEY is your app key:

    `<string>db-$DROPBOX_APP_KEY</string>`

Note: if you attempt to compile your iOS in Xcode without these keys, it will throw an exception when you call the Chooser.

Manual Installation & Configuration (PhoneGap Cloud Build)
----------------------------------------------------------

1. Copy the file DropboxChooser.js into your www/js assets directory.

2. Add the following line to your index.html file:

    `<script type="text/javascript" src="js/DropboxChooser.js"></script>`

3. Change your config.xml to add the following tags and add your Dropbox app key for [app_key] and your PhoneGap app ID for [app_id]:

    `<gap:plugin name="uk.co.cv-library.plugins.DropboxChooser">
        <param name="APP_ID" value="[app_id]" />
        <param name="DROPBOX_APP_KEY" value="db-[app_key]" />
    </gap:plugin>`

Usage
-----

Please see the app.js file within Example/www/js for a code snippet example of how to integrate this plugin with your app.

Authors
-------

Copyright (c) 2013 CV-Library Ltd.  http://www.cv-library.co.uk/

Originally developed by Mark Raymond and Tim Retout.

Please contact Tim Retout <t.retout@cv-library.co.uk> with any feedback.
