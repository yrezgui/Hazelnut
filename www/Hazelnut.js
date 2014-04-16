var process = function (filename, url, successCallback, errorCallback) {
  if(!filename) {
    filename = url.split('.').pop();
  }
  
  return cordova.exec(successCallback, errorCallback, 'Hazelnut', 'Open', [{
    url: url,
    filename: filename
  }]);
};

window.hazelnut = {
  open: process
};

if(module && module.exports) {
  module.exports = process;
}