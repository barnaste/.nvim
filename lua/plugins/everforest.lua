return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			-- your config here  ---controls the "hardness" of the background. options are "soft", "medium" or "hard".
			---default is "medium".
			background = "hard",
			---how much of the background should be transparent. 2 will have more ui
			---components be transparent (e.g. status line background)
			transparent_background_level = 0,
			---whether italics should be used for keywords and more.
			italics = false,
			---disable italic fonts for comments. comments are in italics by default, set
			---this to `true` to make them _not_ italic!
			disable_italic_comments = true,
			---by default, the colour of the sign column background is the same as the as normal text
			---background, but you can use a grey background by setting this to `"grey"`.
			sign_column_background = "none",
			---the contrast of line numbers, indent lines, etc. options are `"high"` or
			---`"low"` (default).
			ui_contrast = "low",
			---dim inactive windows. only works in neovim. can look a bit weird with telescope.
			---
			---when this option is used in conjunction with show_eob set to `false`, the
			---end of the buffer will only be hidden inside the active window. inside
			---inactive windows, the end of buffer filler characters will be visible in
			---dimmed symbols. this is due to the way vim and neovim handle `endofbuffer`.
			dim_inactive_windows = false,
			---some plugins support highlighting error/warning/info/hint texts, by
			---default these texts are only underlined, but you can use this option to
			---also highlight the background of them.
			diagnostic_text_highlight = false,
			---which colour the diagnostic text should be. options are `"grey"` or `"coloured"` (default)
			diagnostic_virtual_text = "coloured",
			---some plugins support highlighting error/warning/info/hint lines, but this
			---feature is disabled by default in this colour scheme.
			diagnostic_line_highlight = false,
			---by default, this color scheme won't colour the foreground of |spell|, instead
			---colored under curls will be used. if you also want to colour the foreground,
			---set this option to `true`.
			spell_foreground = false,
			---whether to show the endofbuffer highlight.
			show_eob = true,
			---style used to make floating windows stand out from other windows. `"bright"`
			---makes the background of these windows lighter than |hl-normal|, whereas
			---`"dim"` makes it darker.
			---
			---floating windows include for instance diagnostic pop-ups, scrollable
			---documentation windows from completion engines, overlay windows from
			---installers, etc.
			---
			---nb: this is only significant for dark backgrounds as the light palettes
			---have the same colour for both values in the switch.
			float_style = "bright",
			---inlay hints are special markers that are displayed inline with the code to
			---provide you with additional information. you can use this option to customize
			---the background color of inlay hints.
			---
			---options are `"none"` or `"dimmed"`.
			inlay_hints_background = "none",
			---you can override specific highlights to use other groups or a hex colour.
			---this function will be called with the highlights and colour palette tables.
			on_highlights = function(hl, palette) end,
			---you can override colours in the palette to use different hex colours.
			---this function will be called once the base and background colours have
			---been mixed on the palette.
			colours_override = function(palette)
				palette.bg_visual = "#3c4841"
			end
		})

		vim.cmd.colorscheme "everforest"
	end,
}
