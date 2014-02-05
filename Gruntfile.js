/*
 * grunt-contrib-livescript
 * http://gruntjs.com/
 *
 * Copyright (c) 2012 David Souther, contributors
 * Licensed under the MIT license.
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
      test: ['test/**/*.js']
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
        tasks: ['build'],
      },
      livereload: {
        options: {livereload: true},
        files: ['build/**/*']
      }

    },

    browserify: {
      dist: {
        files: {
          'build/contents.pack.js': ['build/**/*.js']
        }
      }
    },

    mochaTest: {
        options: {
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
  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-browserify');

  grunt.registerTask('build', ['livescript:src']);

  // after testing clean the test directory
  grunt.registerTask('test', ['livescript:test', 'mochaTest', 'clean:test']);

  // By default, lint and run all tests.
  grunt.registerTask('default', ['build', 'test']);
  grunt.registerTask('web', ['build', 'browserify']);
  grunt.registerTask('continuous', ['watch']);
};