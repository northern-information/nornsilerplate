function init()
  message = "NORNSILERPLATE"
  screen_dirty = true
  redraw_clock_id = clock.run(redraw_clock)
end

function enc(e, d)
  if e == 1 then turn(e, d) end 
  if e == 2 then turn(e, d) end 
  if e == 3 then turn(e, d) end 
  screen_dirty = true
end

function turn(e, d)
  message = "encoder " .. e .. ", delta " .. d
end

function key(k, z)
  if z == 0 then return end
  if k == 2 then press_down(2) end
  if k == 3 then press_down(3) end
  screen_dirty = true
end

function press_down(i)
  message = "press down " .. i
end

function redraw_clock()
  while true do
    clock.sleep(1/15)
    if screen_dirty then
      redraw()
      screen_dirty = false
    end
  end
end

function redraw()
  screen.clear()
  screen.aa(1)
  screen.font_face(1)
  screen.font_size(8)
  screen.level(15)
  screen.move(64, 32)
  screen.text_center(message)
  screen.pixel(0, 0)
  screen.pixel(127, 0)
  screen.pixel(127, 63)
  screen.pixel(0, 63)
  screen.fill()
  screen.update()
end

function r()
  norns.script.load(norns.state.script)
end

function cleanup()
  clock.cancel(redraw_clock_id)
end
