require.config
  paths:
    jquery: '../bower_components/jquery/jquery',
    isomer: '../bower_components/isomer/dist/isomer',
    bootstrap: 'vendor/bootstrap',
    'bootstrap-affix': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/affix',
    'bootstrap-alert': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/alert',
    'bootstrap-button': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/button',
    'bootstrap-carousel': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/carousel',
    'bootstrap-collapse': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/collapse',
    'bootstrap-dropdown': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/dropdown',
    'bootstrap-tab': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/tab',
    'bootstrap-transition': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/transition',
    'bootstrap-scrollspy': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/scrollspy',
    'bootstrap-modal': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/modal',
    'bootstrap-tooltip': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/tooltip',
    'bootstrap-popover': '../bower_components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/popover'
  ,
  shim: 
    isomer: 
      exports: 'Isomer'

require ['app', 'jquery', 'bootstrap'], (app) ->
  app.init()
