var process = function (url, filename, successCallback, errorCallback) {
  if(!filename) {
    filename = '';
  }
  
  return cordova.exec(successCallback, errorCallback, 'Hazelnut', 'Open', [{
    url: url,
    filename: filename
  }]);
};

window.hazelnutOpen = process;

if(module && module.exports) {
  module.exports = process;
}

