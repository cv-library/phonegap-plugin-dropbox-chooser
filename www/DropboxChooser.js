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
