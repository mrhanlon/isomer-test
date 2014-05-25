define ['jquery', 'isomer'], ($, Isomer) ->

  el = document.getElementById 'isomer'
  iso = new Isomer el
  angle = Math.PI / 12
  frame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame

  resize = ->
    frame ->
      main = $ '[role=main]'
      isomerCanvas = $ el
      w = main.width()
      cw = isomerCanvas.width()
      ch = isomerCanvas.height()
      factor = w / cw
      isomerCanvas.width factor * cw
      isomerCanvas.height factor * ch

  scene = ->
    iso.canvas.clear()
    Shape = Isomer.Shape
    Point = Isomer.Point
    c0 = new Isomer.Color 192, 192, 192
    c1 = new Isomer.Color 241, 74, 74

    background = Shape.Cylinder new Point(0,0,4)
    iso.add background.scale(Point.ORIGIN, 2, 2, 0.5).rotateZ(Point.ORIGIN, angle), c0

    prism = Shape.Prism new Point(0,0,2)
    iso.add prism.rotateZ(new Point(0.5, 0.5, 0), angle/2), c1
    iso.add prism.translate(0,0,1).rotateZ(new Point(0.5, 0.5, 0), angle/3), c1
    iso.add prism.translate(0,0,2).rotateZ(new Point(0.5, 0.5, 0), angle/4), c1
    iso.add prism.translate(0,0,3).rotateZ(new Point(0.5, 0.5, 0), angle/5), c1

    angle = angle + Math.PI / 12

  {
    init: () ->
      $(window).on 'resize', resize
      resize()
      setInterval ->
        frame scene
      , 1000/30
  }
