-- Colorscheme generated by https://github.com/arcticlimer/djanho
local highlight = function(group, bg, fg, attr)
    fg = fg and 'guifg=' .. fg or ''
    bg = bg and 'guibg=' .. bg or ''
    attr = attr and 'gui=' .. attr or ''

    vim.api.nvim_command('highlight ' .. group .. ' '.. fg .. ' ' .. bg .. ' '.. attr)
end

local link = function(target, group)
    vim.api.nvim_command('highlight! link ' .. target .. ' '.. group)
end

local Color0 = '#727072'
local Color3 = '#78DCE8'
local Color2 = '#A9DC76'
local Color9 = '#282e22'
local Color11 = '#30312e'
local Color5 = '#faf09a'
local Color6 = '#f2f2f0'
local Color10 = '#312223'
local Color13 = '#919288'
local Color14 = '#bbfdff'
local Color7 = '#181816'
local Color12 = '#5b595c'
local Color4 = '#FF6188'
local Color8 = '#1b1c19'
local Color1 = '#AB9DF2'

highlight('Comment', nil, Color0, 'italic')
highlight('Constant', nil, Color1, nil)
highlight('Number', nil, Color1, nil)
highlight('Function', nil, Color2, nil)
highlight('Function', nil, Color2, nil)
highlight('Type', nil, Color3, nil)
highlight('Function', nil, Color2, nil)
highlight('Error', nil, nil, 'italic')
highlight('Keyword', nil, Color4, nil)
highlight('Conditional', nil, Color4, nil)
highlight('Repeat', nil, Color4, nil)
highlight('Operator', nil, Color4, nil)
highlight('Type', nil, Color4, nil)
highlight('String', nil, Color5, nil)
highlight('Identifier', nil, Color6, nil)
highlight('StatusLine', Color0, Color7, nil)
highlight('WildMenu', Color8, Color6, nil)
highlight('Pmenu', Color8, Color6, nil)
highlight('PmenuSel', Color6, Color8, nil)
highlight('PmenuThumb', Color8, Color6, nil)
highlight('DiffAdd', Color9, nil, nil)
highlight('DiffDelete', Color10, nil, nil)
highlight('Normal', Color8, Color6, nil)
highlight('Visual', Color11, nil, nil)
highlight('CursorLine', Color11, nil, nil)
highlight('ColorColumn', Color11, nil, nil)
highlight('SignColumn', Color8, nil, nil)
highlight('LineNr', nil, Color12, nil)
highlight('TabLine', Color8, Color13, nil)
highlight('TabLineSel', Color14, Color8, nil)
highlight('TabLineFill', Color8, Color13, nil)
highlight('TSPunctDelimiter', nil, Color6, nil)

link('Operator', 'Keyword')
link('TSComment', 'Comment')
link('TSString', 'String')
link('TSOperator', 'Operator')
link('TSProperty', 'TSField')
link('NonText', 'Comment')
link('TSType', 'Type')
link('TSConstant', 'Constant')
link('TSPunctBracket', 'MyTag')
link('TSTagDelimiter', 'Type')
link('TelescopeNormal', 'Normal')
link('TSNamespace', 'TSType')
link('Folded', 'Comment')
link('TSNumber', 'Number')
link('TSParameter', 'Constant')
link('TSField', 'Constant')
link('Repeat', 'Conditional')
link('TSConditional', 'Conditional')
link('TSPunctSpecial', 'TSPunctDelimiter')
link('TSConstBuiltin', 'TSVariableBuiltin')
link('TSFuncMacro', 'Macro')
link('TSFunction', 'Function')
link('TSParameterReference', 'TSParameter')
link('TSLabel', 'Type')
link('Conditional', 'Operator')
link('CursorLineNr', 'Identifier')
link('TSKeyword', 'Keyword')
link('TSFloat', 'Number')
link('TSTag', 'MyTag')
link('TSRepeat', 'Repeat')
link('Macro', 'Function')
link('Whitespace', 'Comment')