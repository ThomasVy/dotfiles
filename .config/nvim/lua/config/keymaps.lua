local keymap = vim.keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-m>", "<C-i>", opts)
-- keymap.set("n", "*", ":keepjumps normal~ mi*`i<CR>")
-- keymap.set("n", "*", "*``")
keymap.set({ "n", "v" }, "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set("x", "p", '"_dP')
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
keymap.set({ "n", "v" }, "<leader>D", [["_D]])
keymap.set({ "n", "v" }, "<leader>c", [["_c]])
keymap.set({ "n", "v" }, "<leader>C", [["_C]])
keymap.set("n", "x", '"_x')
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Word under the cursor and do a replace
keymap.set("n", "<leader>ps", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Does another search and replace on the word you just replaced --
keymap.set("n", "g.", '/\\V\\C<C-r>"<CR>cgn<C-a><Esc>')

-- Searches for the word under my cursor and performs cgn
keymap.set("n", "cg*", "*Ncgn")

-- Use <S-l> and <S-h> to switch file buffers
-- Split window
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sc", "<C-w>q", opts)
keymap.set("n", "sr", "<C-w>x")
-- Remap to L and H to beginning of the line and end of the line
keymap.set({ "n", "v", "o" }, "L", "$")
keymap.set({ "n", "v", "o" }, "H", "^")

--Go through buffers
keymap.set("n", "<Tab>", ":bnext<cr>")
keymap.set("n", "<S-Tab>", ":bprevious<cr>")
-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
-- open undo tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- go to next diagnostic
keymap.set("n", ";n", function()
  vim.diagnostic.goto_next()
end, opts)

-- make it so that I can undo snippets and autocompletes
local untrigger = function()
  -- get the snippet
  local snip = require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()].parent.snippet
  -- get its trigger
  local trig = snip.trigger
  -- replace that region with the trigger
  local node_from, node_to = snip.mark:pos_begin_end_raw()
  vim.api.nvim_buf_set_text(0, node_from[1], node_from[2], node_to[1], node_to[2], { trig })
  -- reset the cursor-position to ahead the trigger
  vim.fn.setpos(".", { 0, node_from[1] + 1, node_from[2] + 1 + string.len(trig) })
end

vim.keymap.set({ "i", "s" }, "<C-x>", function()
  if require("luasnip").in_snippet() then
    untrigger()
    require("luasnip").unlink_current()
  end
end, {
  desc = "Undo a snippet",
})
