Hazelnut
========

Phonegap plugin to display local files by providing URI. Inspiration from https://github.com/ti8mag/DocumentHandler

## Usage

The plugin exposes one method on the window object: 

    HazelnutOpen(filename, uri, successCallback, errorCallback)

The parameters: 

* filename: allow to display another name that the actual name of the file. If null, it will take the actual name.
* uri: A local URL to a document (format Absolute URL).
* successHandler: Should be a function. Is called when the open of the file is done and the file is shown to the user. 
* failureHandler: Should be a function. Is called when there was a problem with opening the file. 
