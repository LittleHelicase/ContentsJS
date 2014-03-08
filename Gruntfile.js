/*
 * ContentsJS
 * https://github.com/LittleHelicase/ContentsJS
 *
 * Copyright (c) 2014 "LittleHelicase" Maximilian Klein
 * Licensed under the MIT license.
 * https://github.com/LittleHelicase/ContentsJS/blob/master/LICENSE
 */

module.exports = function(grunt) {
  'use strict';

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    // Before generating any new files, remove any previously-created files.
    clean: {
//      test: ['build'],
      src:  ['build'],
      test: ['test/**/*-test.js']
    },

    // Configuration to be run (and then tested).
    livescript: { 
      test: {
        expand: true,
        cwd: 'test/',
        src: ['**/*.ls'],
        dest: 'test/',
        ext: '.js'
      },
      src: {
        expand: true,
        cwd: 'src/',
        src: ['**/*.ls'],
        dest: 'build/',
        ext: '.js'
      },
    },

    watch : {
      ls: {
        files: ['src/**/*.ls'],
        tasks: ['clean','build','browserify'],
      },
      livereload: {
        options: {livereload: true},
        files: ['build/**/*']
      }

    },

    mochacli: {
        options: {
          require: ["test/require"],
          reporter: 'mocha-unfunk-reporter'
        },
        any: {
            src: ['test/**/*-test.js']
        }
    },
  });

  // Actually load this plugin's task(s).
  grunt.loadTasks('tasks');

  // The clean plugin helps in testing.
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-livescript');
  grunt.loadNpmTasks('grunt-browserify');
  grunt.loadNpmTasks('grunt-mocha-cli');

  grunt.registerTask('build', ['livescript:src']);

  // after testing clean the test directory
  grunt.registerTask('test', ['livescript:test', 'mochacli', 'clean:test']);

  // By default, lint and run all tests.
  grunt.registerTask('default', ['build', 'test']);
  grunt.registerTask('web', ['clean', 'build']);
  grunt.registerTask('continuous', ['watch']);
};