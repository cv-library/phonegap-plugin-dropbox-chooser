// Copyright (c) 2013 CV-Library Ltd.
// Licensed under the MIT License - see LICENSE file.

// Instantiate the DropboxChooser object and call the method 'launchDropboxChooser, which has three arguments (the success callback, failure callback and an additional argument to specify if you want a 'Preview' or 'Direct' link returned.

$('#dropbox-choose').on('touchend', function(){
        var DropboxChooser = window.plugins.DropboxChooser;
        DropboxChooser.launchDropboxChooser(setDropboxCV,function(){},"Direct");
    });

// The success callback returns an array of hashes (each element of the array corresponding with a file chosen by the user) with keys corresponding to the public accessible URL of the file, the name of the file and the icon image URL corresponding to the file.

function setDropboxCV(results) {
    var firstResult = results[0];
    $('#fileLink').val(firstResult.link);
    $('#fileName').val(firstResult.name);
    $('#fileIconURL').val(firstResult.iconURL);
}
