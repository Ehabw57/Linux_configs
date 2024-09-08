vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- I like to stay foucased
vim.keymap.set('n', '<C-u>', ' <C-u>zz')			-- Always center cursor when scrolling up
vim.keymap.set('n', '<C-d>', ' <C-d>zz')			-- Always center cursor when scrolling down
vim.keymap.set('n', 'n', ' nzz')				-- Always center cursor when searching next
vim.keymap.set('n', 'N', ' Nzz')				-- Always center cursor when searching pervouis

-- Some keymaps i hate
vim.keymap.set('n', 'q', function() vim.notify("Fuck You DO NOT hit 'q' !")end)

-- All about files
vim.keymap.set('n', '<leader>x', ':!chmod u+x %<CR>') -- Make my file excuteable

-- Joining and breaking
vim.keymap.set('n', 'J ', 'J``')				-- Join Two lines
vim.keymap.set('n', 'K', 'i<CR><ESC>')			-- Braek line

-- Move in visual
vim.keymap.set('x', '<C-k>', ':m-2<CR>gv=gv')	-- Move slected lines up in visual mode
vim.keymap.set('x', '<C-j>', ':m+1<CR>gv=gv')	-- Move slected lines down in visual mode

-- Playing with regesters
vim.keymap.set('v', '<leader>y', '"+y')		-- copy to my system clipbord
vim.keymap.set('v', '<leader>p', '"_dp')		-- throw the overpasted to void
vim.keymap.set('n', 'x', '"_x')		-- Throw the fucking x into the void regesters 

-- Everything about buffer
vim.keymap.set('n', '<leader>e', ':Ex<CR>')		-- Open Netrw
vim.keymap.set('n', '<leader>pw', ':w<CR>:bw<CR>')	-- Save and clear buffer
vim.keymap.set('n', '<leader>pq', ':bw! <CR>')		-- Clear buffer without saving
vim.keymap.set('n', '<leader>pn', ':bn <CR>')		-- Clear buffer without saving
vim.keymap.set('n', '<leader>pp', ':bp <CR>')		-- Clear buffer without saving
vim.keymap.set('n', '<leader>w', ':w <CR>')		-- Clear buffer with saving


-- Wellcome windows
vim.keymap.set('n', '<leader>sv',':split <CR>') 	-- Open new window horzantly
vim.keymap.set('n', '<leader>ss',':vsplit <CR>') 	-- Open new window vertacally
vim.keymap.set('n', '<leader>q', ':q! <CR>') 		-- Close current window
vim.keymap.set('n', '<leader>h', '<C-w>h')		-- Foucs left window
vim.keymap.set('n', '<leader>j', '<C-w>j')		-- Foucs up window
vim.keymap.set('n', '<leader>k', '<C-w>k')		-- Foucs down window
vim.keymap.set('n', '<leader>l', '<C-w>l')		-- Foucs right window

-- Code format checks
vim.keymap.set('n', '<leader>py', ':!pycodestyle %<CR>')
vim.keymap.set('n', '<leader>sh', ':!shellcheck %<CR>')
vim.keymap.set('n', '<leader>by', ':!betty %<CR>')
vim.keymap.set('n', '<C-j>', ':term /home/zerobors/.config/bash/scripts/TmuxPilot new<CR>')		-- Start a new TmuxPilot session
vim.keymap.set('n', '<C-l>', ':term /home/zerobors/.config/bash/scripts/TmuxPilot list<CR>')	-- List all sesssion using TmuxPilot
