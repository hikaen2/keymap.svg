require 'victor'

DPI = 96.0
M = 1.5

class Numeric
  def mm
    self * DPI / 25.4 # mm to px
  end

  def u
    self * 19.05.mm # unit to px
  end
end

def key(x, y, a = nil, b = nil, c = nil)
  w = 1
  @svg.rect x: x.u + M.mm, y: y.u + M.mm, width: w.u - 2*M.mm, height: 1.u - 2*M.mm, fill: :none, stroke: :black, stroke_width: '0.25pt', rx: 1.mm, ry: 1.mm
  @svg.text a, x: x.u + 0.5.u, y: y.u + 6.mm,  font_size: '10pt', text_anchor: :middle, class: :text if a
  @svg.text b, x: x.u + 0.5.u, y: y.u + 11.mm, font_size: '10pt', text_anchor: :middle, class: :text if b
  @svg.text c, x: x.u + 0.5.u, y: y.u + 16.mm, font_size: '10pt', text_anchor: :middle, class: :text if c
end



@svg = Victor::SVG.new
@svg.css = <<CSS
  .text { font-family: "Noto Sans CJK JP"; }
CSS


y = 0
key x=0,  y, '', 'Esc'
key x+=1, y, '!', '1', 'F1'
key x+=1, y, '"', '2', 'F2'
key x+=1, y, '#', '3', 'F3'
key x+=1, y, '$', '4', 'F4'
key x+=1, y, '%', '5', 'F5'
key x+=1, y, '&', '6', 'F6'
key x+=1, y, '\'', '7', 'F7'
key x+=1, y, '(', '8', 'F8'
key x+=1, y, ')', '9', 'F9'
key x+=1, y, '', '0', 'F10'
key x+=1, y, '=', '-', 'F11'
key x+=1, y, '~', '^', 'F12'
key x+=1, y, '|', '\\', 'Ins'


y += 1
key x=0,  y, '', 'Tab', ''
key x+=1, y, 'Q', '', ''
key x+=1, y, 'W', '', ''
key x+=1, y, 'E', '', 'End'
key x+=1, y, 'R', '', ''
key x+=1, y, 'T', '', ''
key x+=1, y, 'Y', '', ''
key x+=1, y, 'U', '', ''
key x+=1, y, 'I', '', 'PSc'
key x+=1, y, 'O', ''
key x+=1, y, 'P', '', '↑'
key x+=1, y, '`', '@', ''
key x+=1, y, '{', '[', ''
key x+=1, y, '', 'BS', 'Del'

y += 1
key x=0,  y, '', 'Ctrl', ''
key x+=1, y, 'A', '', 'Home'
key x+=1, y, 'S', '', ''
key x+=1, y, 'D', '', ''
key x+=1, y, 'F', '', '→'
key x+=1, y, 'G', '', ''
key x+=1, y, 'H', '', 'BS'
key x+=1, y, 'J', ''
key x+=1, y, 'K', '', 'Home'
key x+=1, y, 'L', '', 'PgUp'
key x+=1, y, '+', ';', ''
key x+=1, y, '*', ':', ''
key x+=1, y, '}', ']', ''
key x+=1, y, '', 'Enter', ''

y += 1
key x=0,  y, '', 'Shift', ''
key x+=1, y, 'Z', '', ''
key x+=1, y, 'X', '', ''
key x+=1, y, 'C', '', ''
key x+=1, y, 'V', '', ''
key x+=1, y, 'B', '', '←'
key x+=1, y, 'N', '', '↓'
key x+=1, y, 'M', '', 'Enter'
key x+=1, y, '<', ',', 'End'
key x+=1, y, '>', '.', 'PgDn'
key x+=1, y, '?', '/'
key x+=1, y, '_', '\\'
key x+=1, y, '', '↑'
key x+=1, y, '', 'Shift'

y += 1
key x=0,  y, '', 'Fn'
key x+=2, y, '', 'OS'
key x+=1, y, '', 'Alt'
key x+=1, y, '', '無変換', ''
key x+=1, y, '', '', ''
key x+=1, y, '', '', ''
key x+=1, y, '', '変換'
key x+=1, y, '', 'Alt'
key x+=1, y, '', 'Menu'
key x+=2, y, '', '←'
key x+=1, y, '', '↓'
key x+=1, y, '', '→'



puts @svg.render
