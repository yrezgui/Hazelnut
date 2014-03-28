Hazelnut
========

Phonegap plugin to display files from URL. Fork from https://github.com/ti8mag/DocumentHandler

It takes the filename as argument (issue with DocumentHandler when the URL doesn't have extension)

It will return promise in the future.

## Usage

The plugin exposes one method on the window object: 

    HazelnutOpen(url, filename, successCallback, errorCallback)

The parameters: 

* successHandler: Should be a function. Is called when the file download is done and the file is shown to the user. 
* failureHandler: Should be a function. Is called when there was a problem with downloading the file. 
The function takes an argument which is usually 1 (undefined error). Also see Android section.
* url: A URL to a document. Any cookies the system has for this server are passed along. This ensures that authenticated downloads also work. 
