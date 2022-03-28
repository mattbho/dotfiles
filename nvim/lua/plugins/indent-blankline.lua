require("indent_blankline").setup({
	char = "│",
	space_char_blankline = " ",
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"alpha",
		"neogitstatus",
		"Trouble",
		"git",
		"fugitive",
		"gitcommit",
	},
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	show_end_of_line = true,
	show_current_context = true,
	show_first_indent_level = true,
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
})
