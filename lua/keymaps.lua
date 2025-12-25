vim.g.mapleader = " "

local keymap = vim.keymap

-- Mapping to yank and keep the visual selection
vim.api.nvim_set_keymap('x', 'y', 'y`[v`]', { noremap = true, silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights"})


keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-b>", "<C-b>zz")


keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<S-Tab>", "<<") -- shift tab to indent
keymap.set("n", "<Tab>", ">>") -- tab to indent

keymap.set("n", "d", '"_d') -- delete now doesn't copy
keymap.set("v", "d", '"_d') -- delete now doesn't copy

keymap.set("n", "x", '"_x') -- delete now doesn't copy
keymap.set("v", "x", '"_x') -- delete now doesn't copy

keymap.set("v", "dd", '"_dd') -- delete now doesn't copy
keymap.set("n", "dd", '"_dd') -- delete now doesn't copy



-- this is to be able to use ci and not lose the paste buffer
keymap.set("n", "ci(", '"_ci(')
keymap.set("n", "ci)", '"_ci)')
keymap.set("n", "ci{", '"_ci{')
keymap.set("n", "ci}", '"_ci}')
keymap.set("n", "ci'", "\"_ci'")
keymap.set("n", "ci[", '"_ci[')
keymap.set("n", "ci]", '"_ci]')
keymap.set("n", 'ci"', '"_ci"')

-- when using these binds you can move a chunk of text and it will automatically indent
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Flash
keymap.set("n", "s", function()
  require("flash").jump()
end, { noremap = true, silent = true, desc = "Flash jump" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })

-- Clear search
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Stay old-school
vim.opt.mouse = ""

