return {
  {
    "nvim-mini/mini.hipatterns",
    opts = function(_, opts)
      local hi = require("mini.hipatterns")

      opts.highlighters = opts.highlighters or {}

      opts.highlighters.dart_color = {
        pattern = "Color%(%s*0x%x+%s*%)",
        group = function(_, match)
          local hex = match:match("0x(%x%x%x%x%x%x%x%x)")

          if #hex == 8 then
            hex = hex:sub(3)
          end

          return hi.compute_hex_color_group("#" .. hex, "bg")
        end,
        extmark_opts = { priority = 2000 },
      }

      return opts
    end,
  },
}
