module.exports = function (grunt) {
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-git-authors');

  grunt.initConfig({
    coffee: {
      client: {
        expand: true,
        options: {
          sourceMap: true
        },
        src: ['client/*.coffee', 'test/*.coffee', 'server/*.coffee'],
        ext: '.js'
      }
    },

    copy: {
        js: {
	    expand: true,
	    cwd: 'node_modules/katex/dist/',
	    flatten: true,
            dest: 'client/js/',
            src: ['katex.min.js'
                 ,'contrib/auto-render.min.js']
        },
        fonts: {
            expand: true,
            cwd: 'node_modules/katex/dist/',
            dest: 'client/css/',
            src: ['fonts/*.woff', 'fonts/*.woff2']
        },
        css: {
            dest: 'client/css/katex.min.css',
            src: 'node_modules/katex/dist/katex.min.css'
        }
    },

    mochaTest: {
      test: {
        options: {
          reporter: 'spec'
        },
        src: ['test/**/*.js']
      }
    },


    watch: {
      all: {
        files: ['client/*.coffee', 'test/*.coffee', 'server/*.coffee'],
        tasks: ['coffee','mochaTest']
      }
    }
  });

  grunt.registerTask('build', ['copy', 'coffee', 'mochaTest']);
  grunt.registerTask('default', ['build']);

};
