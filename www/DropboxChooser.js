var DropboxChooser = function() {};

DropboxChooser.init = function(dropboxAppId, fail) {
    cordova.exec(null, (fail ? fail : null), "DropboxChooser", "init", [dropboxAppId]);
};

DropboxChooser.launchDropboxChooser = function(callback, errorCallback, usePreviewLink) {
    cordova.exec(callback, errorCallback, "DropboxChooser", "launchDropboxChooser", [usePreviewLink]);
};

if(!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.DropboxChooser) {
    window.plugins.DropboxChooser = new DropboxChooser();
}

if (module.exports) {
    module.exports = DropboxChooser;
}
