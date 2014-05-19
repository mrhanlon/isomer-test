/*global define */
define(['jquery', 'isomer'], function ($, Isomer) {
  'use strict';

  window.requestAnimationFrame = window.requestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.msRequestAnimationFrame;

  function resize() {
    window.requestAnimationFrame(function() {
      var main = $('[role=main]'),
        isomerCanvas = $('#isomer'),
        w = main.width(),
        cw = isomerCanvas.width(),
        ch = isomerCanvas.height(),
        factor = w / cw;

      isomerCanvas.width(factor * cw);
      isomerCanvas.height(factor * ch);
    });
  }

  var iso = new Isomer(document.getElementById('isomer'));
  var angle = 0;

  function scene() {
    iso.canvas.width = iso.canvas.width;
    var Shape = Isomer.Shape;
    var Point = Isomer.Point;

    var background = Shape.Prism(new Point(-1,-1,3));
    iso.add(background.scale(new Point(-1,-1,3), 3.5, 3.5, -1), new Isomer.Color(192,192,192));

    iso.add(
    Shape.Prism(new Point(0,0,3)).rotateZ(new Point(0.5,0.5,0), angle), new Isomer.Color(241,74,74));
    angle += 2 * Math.PI / 270;
  }

  function draw() {
    window.requestAnimationFrame(scene);
  }

  return {
    init: function() {
      $(window).on('resize', resize);
      resize();
      setInterval(draw);
    }
  };
});
