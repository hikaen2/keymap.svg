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
  @svg.text a, x: x.u + 0.5.u, y: y.u + 6.mm, font_size: '10pt', text_anchor: :middle, class: :text if a
  @svg.text b, x: x.u + 0.5.u, y: y.u + 11.mm, font_size: '10pt', text_anchor: :middle, class: :text if b
  @svg.text c, x: x.u + 0.5.u, y: y.u + 16.mm, font_size: '10pt', text_anchor: :middle, class: :text if c
end



@svg = Victor::SVG.new
@svg.css = <<CSS
  .text { font-family: "Noto Sans CJK JP"; }
CSS



key x=0, 0, '', 'Esc', 'Power'
key x+=1, 0, '!', '1', 'F1'
key x+=1, 0, '"', '2', 'F2'
key x+=1, 0, '#', '3', 'F3'
key x+=1, 0, '$', '4', 'F4'
key x+=1, 0, '%', '5', 'F5'
key x+=1, 0, '&', '6', 'F6'
key x+=1, 0, '\'', '7', 'F7'
key x+=1, 0, '(', '8', 'F8'
key x+=1, 0, ')', '9', 'F9'
key x+=1, 0, '', '0', 'F10'
key x+=1, 0, '=', '-', 'F11'
key x+=1, 0, '~', '^', 'F12'
key x+=1, 0, '|', '\\', 'Ins'
key x+=1, 0, '', 'BS', 'Del'

key x=0, 1, '', 'Tab', 'Caps', u: 1.5
key x+=1.5, 1, 'Q'
key x+=1, 1, 'W'
key x+=1, 1, 'E'
key x+=1, 1, 'R'
key x+=1, 1, 'T'
key x+=1, 1, 'Y'
key x+=1, 1, 'U'
key x+=1, 1, 'I', '', 'PSc/SRq'
key x+=1, 1, 'O', '', 'ScrLk'
key x+=1, 1, 'P', '', 'Pus/Brk'
key x+=1, 1, '`', '@', '↑'
key x+=1, 1, '{', '['

key x=0, 2, '', 'Control', '', u: 1.75
key x+=1.75, 2, 'A', '', 'Vol_Dn'
key x+=1, 2, 'S', '', 'Vol_Up'
key x+=1, 2, 'D', '', 'Mute'
key x+=1, 2, 'F', '', 'Eject'
key x+=1, 2, 'G'
key x+=1, 2, 'H', '', '*'
key x+=1, 2, 'J', '', '/'
key x+=1, 2, 'K', '', 'Home'
key x+=1, 2, 'L', '', 'PgUp'
key x+=1, 2, '+', ';', '←'
key x+=1, 2, '*', ':', '→'
key x+=1, 2, '}', ']'


key x=0, 3, '', 'Shift', '', u: 2
key x+=2, 3, 'Z'
key x+=1, 3, 'X'
key x+=1, 3, 'C'
key x+=1, 3, 'V'
key x+=1, 3, 'B'
key x+=1, 3, 'N', '', '+'
key x+=1, 3, 'M', '', '-'
key x+=1, 3, '<', ',', 'End'
key x+=1, 3, '>', '.', 'PgDn'
key x+=1, 3, '?', '/', '↓'
key x+=1, 3, '_', '\\'
key x+=1, 3, '', '↑', 'Shift'
key x+=1, 3, '', 'Shift'

key x=0, 4, '', 'Fn'
key x=1.25, 4, '', '全/半'
key x+=1, 4, '', 'OS'
key x+=1, 4, '', 'Alt'
key x+=1, 4, '', '無変換'
key x+=1, 4, '', '', '', u: 2.5
key x+=2.5, 4, '', '変換'
key x+=1, 4, '', 'Kana'
key x+=1, 4, '', 'Alt'
key x+=1, 4, '', 'Fn'
key x+=1.25, 4, '', '←', 'Del'
key x+=1, 4, '', '↓', 'OS'
key x+=1, 4, '', '→', 'Ctrl'





@svg.path(
  stroke: :black,
  fill: :none,
  stroke_width: '0.25pt',
  d: [
    "M #{13.5.u + M.mm + 1.mm} #{1.u + M.mm}",
    "l #{1.5.u - 2*M.mm - 2.mm} 0",
    "a #{1.mm} #{1.mm} 0 0 1 #{1.mm} #{1.mm}",
    "l 0 #{2.u - 2*M.mm - 2.mm}",
    "a #{1.mm} #{1.mm} 0 0 1 #{-1.mm} #{1.mm}",
    "l -#{1.25.u - 2*M.mm - 2.mm} 0",
    "a #{1.mm} #{1.mm} 0 0 1 #{-1.mm} #{-1.mm}",
    "l 0 -#{1.u - 1.mm}",
    "l -#{0.25.u - 1.mm} 0",
    "a #{1.mm} #{1.mm} 0 0 1 #{-1.mm} #{-1.mm}",
    "l 0 -#{1.u - 2*M.mm - 2.mm}",
    "a #{1.mm} #{1.mm} 0 0 1 #{1.mm} #{-1.mm}",
    "Z"
  ]
)


puts @svg.render
