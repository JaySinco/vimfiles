function hasGui()
  return os.getenv('NVIM_GUI') == '1';
end

function map(mode, shortcut, command, is_expr)
  vim.api.nvim_set_keymap(mode, shortcut, command, { 
     noremap = true, silent = true, expr = is_expr or false
   })
end

function nmap(shortcut, command, is_expr)
  map('n', shortcut, command, is_expr)
end

function imap(shortcut, command, is_expr)
  map('i', shortcut, command, is_expr)
end

function vmap(shortcut, command, is_expr)
  map('v', shortcut, command, is_expr)
end

function cmap(shortcut, command, is_expr)
  map('c', shortcut, command, is_expr)
end

function tmap(shortcut, command, is_expr)
  map('t', shortcut, command, is_expr)
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
 end