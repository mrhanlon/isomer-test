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
  var angle = Math.PI/2;

  function scene() {
    iso.canvas.clear();
    var Shape = Isomer.Shape;
    var Point = Isomer.Point;

    var background = Shape.Cylinder(new Point(0,0,4));
    iso.add(background.scale(new Point(0,0,0), 2, 2, 0.5).rotateZ(new Point(0,0,0), angle), new Isomer.Color(192,192,192)
    );

    var prism = Shape.Prism(new Point(0,0,2));
    iso.add(prism.rotateZ(new Point(0.5,0.5,0), angle), new Isomer.Color(241,74,74));
    iso.add(prism.translate(0, 0, 1).rotateZ(new Point(0.5,0.5,0), 0.75*angle), new Isomer.Color(241,74,74));
    iso.add(prism.translate(0, 0, 2).rotateZ(new Point(0.5,0.5,0), 0.50*angle), new Isomer.Color(241,74,74));
    iso.add(prism.translate(0, 0, 3).rotateZ(new Point(0.5,0.5,0), 0.25*angle), new Isomer.Color(241,74,74));
    angle += Math.PI / 270;
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
