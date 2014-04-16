var process = function (filename, uri, successCallback, errorCallback) {
  if(!filename) {
    filename = uri.split('/').pop();
  }
  
  return cordova.exec(successCallback, errorCallback, 'Hazelnut', 'Open', [{
    uri: uri,
    filename: filename
  }]);
};

window.hazelnut = {
  open: process
};

if(module && module.exports) {
  module.exports = process;
}