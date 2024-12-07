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

def key(x, y, a = nil, b = nil, c = nil, options = {})
  w = options[:u] || 1
  @svg.rect x: x.u + M.mm, y: y.u + M.mm, width: w.u - 2*M.mm, height: 1.u - 2*M.mm, fill: :none, stroke: :black, stroke_width: '0.25pt', rx: 1.mm, ry: 1.mm
  @svg.text a, x: x.u + 1.u - 3.mm, y: y.u + 6.mm,  font_size: '10pt', text_anchor: :end, class: :text if a
  @svg.text b, x: x.u + 0.5.u,      y: y.u + 11.mm, font_size: '10pt', text_anchor: :middle, class: :text if b
  @svg.text c, x: x.u + 3.mm,       y: y.u + 16.mm, font_size: '10pt', text_anchor: :start, class: :text if c
end



@svg = Victor::SVG.new
@svg.css = <<CSS
  .text { font-family: "Noto Sans CJK JP"; }
CSS


y = 0
key(x=0,  y, 'Esc', 'Tab', 'Esc')
key(x+=1, y, '1', 'Q', '!')
key(x+=1, y, '2', 'W', '"')
key(x+=1, y, '3', 'E', '#')
key(x+=1, y, '4', 'R', '$')
key(x+=1, y, '5', 'T', '%')
key(x+=1, y, '6', 'Y', '&')
key(x+=1, y, '7', 'U', '\'')
key(x+=1, y, '8', 'I', '(')
key(x+=1, y, '9', 'O', ')')
key(x+=1, y, '0', 'P', '~')
key(x+=1, y, '@', '-', '`')

y += 1
key(x=0,  y, '', 'Ctrl', '')
key(x+=1, y, 'F1', 'A', 'F1')
key(x+=1, y, 'F2', 'S', 'F2')
key(x+=1, y, 'F3', 'D', 'F3')
key(x+=1, y, 'F4', 'F', 'F4')
key(x+=1, y, 'F5', 'G', 'F5')
key(x+=1, y, 'F6', 'H', 'F6')
key(x+=1, y, '-', 'J', '_')
key(x+=1, y, '[', 'K', '{')
key(x+=1, y, ']', 'L', '}')
key(x+=1, y, '=', ';', '+')
key(x+=1, y, '^', 'Enter', '|')

y += 1
key(x=0,  y, '', 'Shift', '')
key(x+=1, y, 'F7', 'Z', 'F7')
key(x+=1, y, 'F8', 'X', 'F8')
key(x+=1, y, 'F9', 'C', 'F9')
key(x+=1, y, 'F10', 'V', 'F10')
key(x+=1, y, 'F11', 'B', 'F11')
key(x+=1, y, 'F12', 'N', 'F12')
key(x+=1, y, '#', 'M', '~')
key(x+=1, y, '/', ',', '|')
key(x+=1, y, 'PgUp', '.', 'Home')
key(x+=1, y, 'PgDn', '/', 'End')
key(x+=1, y, '', '\\')

y += 1
key(x=0,  y, '', 'Fn')
key(x+=1, y, '', 'Esc')
key(x+=1, y, '', 'OS')
key(x+=1, y, '', 'Alt')
key(x+=1, y, '', '無変換', 'Lower')
key(x+=1, y, '', '', '')
key(x+=1, y, '', '', '')
key(x+=1, y, 'Raise', '変換')
key(x+=1, y, '', 'Alt')
key(x+=1, y, '', 'Menu')
key(x+=1, y, '', '')
key(x+=1, y, '', '')




y += 2
key x=0,  y, '', 'Esc'
key x+=1, y, '', 'F1'
key x+=1, y, '', 'F2'
key x+=1, y, '', 'F3'
key x+=1, y, '', 'F4'
key x+=1, y, '', 'F5'
key x+=1, y, '', 'F6'
key x+=1, y, '', 'F7'
key x+=1, y, '', 'F8'
key x+=1, y, '', 'F9'
key x+=1, y, '', 'F10'
key x+=1, y, '', 'F11'

y += 1
key x=0,  y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', '*'
key x+=1, y, '', '/'
key x+=1, y, '', 'Home'
key x+=1, y, '', 'PgUp'
key x+=1, y, '', ''
key x+=1, y, '', 'F12'

y += 1
key x=0,  y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', '+'
key x+=1, y, '', '-'
key x+=1, y, '', 'End'
key x+=1, y, '', 'PgDn'
key x+=1, y, '', '↑'
key x+=1, y, '', ''

y += 1
key x=0,  y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', ''
key x+=1, y, '', '←'
key x+=1, y, '', '↓'
key x+=1, y, '', '→'







puts @svg.render
