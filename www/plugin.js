
var exec = require('cordova/exec');

var PLUGIN_NAME = 'GoogleVRPlayer';

var GoogleVRPlayer = {
  playVideo: function(videoUrl, fallbackVideoUrl, cb) {
    exec(cb, null, PLUGIN_NAME, 'playVideo', [videoUrl, fallbackVideoUrl]);
  },
  playImage: function(imageUrl, cb) {
    exec(cb, null, PLUGIN_NAME, 'playImage', [imageUrl]);
  },
  getDate: function(cb) {
    exec(cb, null, PLUGIN_NAME, 'getDate', []);
  }
};

module.exports = GoogleVRPlayer;
