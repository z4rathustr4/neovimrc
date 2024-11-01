return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
	theme = 'doom',
	config = {

	header = {"",
"              ...                             ",
"             ;::::;                           ",
"           ;::::; :;                          ",
"         ;:::::'   :;                         ",
"        ;:::::;     ;.                        ",
"       ,:::::'       ;           OOO\\        ",
"       ::::::;       ;          OOOOO\\       ",
"       ;:::::;       ;         OOOOOOOO       ",
"      ,;::::::;     ;'         / OOOOOOO      ",
"    ;:::::::::`. ,,,;.        /  / DOOOOOO    ",
"  .';:::::::::::::::::;,     /  /     DOOOO   ",
" ,::::::;::::::;;;;::::;,   /  /        DOOO  ",
";`::::::`'::::::;;;::::: ,#/  /          DOOO ",
":`:::::::`;::::::;;::: ;::#  /            DOOO",
"::`:::::::`;:::::::: ;::::# /              DOO",
"`:`:::::::`;:::::: ;::::::#/               DOO",
" :::`:::::::`;; ;:::::::::##                OO",
" ::::`:::::::`;::::::::;:::#                OO",
" `:::::`::::::::::::;'`:;::#                O ",
"  `:::::`::::::::;' /  / `:#                  ",
"   ::::::`:::::;'  /  /   `#                  ",

		"",
			},
	center = {
			{
				icon = "  ",
				desc = "Recent Files",
				key = "r",
				keymap = "SPC f r",
				action = "Telescope oldfiles",
			},

			{
				icon = "  ",
				desc = "Find Files",
				key = "f",
				keymap = "SPC f f",
				action = "Telescope find_files hidden=true",
			},

			{
				icon = "  ",
				desc = "Edit config",
				key = ".",
				keymap = "",
				action = ":e ~/.config/nvim/lua/",
			},
		},
	footer = { "z4rathustr4's neovim config" },
	},
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
