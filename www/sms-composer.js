//
// SmsComposer.js
//
// Created by Calvin Lai on  2013-08-16.
// Copyright 2013 Calvin Lai. All rights reserved.

var cordova = require('cordova'),
    exec = require('cordova/exec');

var SmsComposer = function() {
  // constructor
};

SmsComposer.prototype.showComposer = function(options, callback) {
  cordova.exec(callback, callback, "SmsComposer", "showComposer", options ? [options] : []);
};



var smsComposer = new SmsComposer();

module.exports = smsComposer;
