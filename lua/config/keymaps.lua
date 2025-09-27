local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Keep Cursor in the middle when using ctrl-d and ctrl-u OR even while searching
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- -- Move to window using the <ctrl> hjkl keys
-- keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
--

keymap.set("n", "<leader>bv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>bh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>bx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>br", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>b,", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<leader>b.", "<cmd>vertical resize +15<cr>", { desc = "Increase Window Width" })
keymap.set("n", "<leader>b-", "<cmd>resize -3<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<leader>b=", "<cmd>resize +6<cr>", { desc = "Increase Window Height" })

keymap.set("n", "<leader>bt", "<cmd>TodoQuickFix<cr>", { desc = "Show Todos" })

keymap.set("n", "<leader>bd", function()
	vim.diagnostic.open_float()
end, { desc = "Show Diagnostics in popup" })

keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Keymaps for code companion
--

-- keymap.set({ "n", "v" }, "<leader>oa", "<cmd>CodeCompanionActions<cr>", { desc = "Code Companion Actions" })
-- keymap.set({ "n", "v" }, "<leader>oo", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code Companion chat" })
