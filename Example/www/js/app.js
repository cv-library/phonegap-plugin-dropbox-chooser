// Copyright (c) 2014 CV-Library Ltd.
// Licensed under the MIT License - see LICENSE file.

$('#dropbox-choose').on('touchend', function(){
        // Instantiate the DropboxChooser object first.
        var DropboxChooser = window.plugins.DropboxChooser;

        // If this plugin is running on an Android device, the Dropbox app key needs feeding into the class; for iOS, this is not necessary
        if ( device_platform === "Android" ) {
            DropboxChooser.init("APP_KEY");
        }

        // Call the method 'launchDropboxChooser, which has three arguments (the success callback, failure callback and an additional mandatory flag to specify if you want a 'Preview' link returned ( "true" for a 'Preview' link; "false" for a 'Direct' link).
        DropboxChooser.launchDropboxChooser(setDropboxCV,function(){},"false");
    });

function setDropboxCV(results) {
    // The success callback returns an array of hashes (each element of the array corresponding with a file chosen by the user) with keys corresponding to the public accessible URL of the file, the name of the file and the icon image URL corresponding to the file.
    var firstResult = results[0];
    $('#fileLink').val(firstResult.link);
    $('#fileName').val(firstResult.name);
    $('#fileIconURL').val(firstResult.iconURL);
}
