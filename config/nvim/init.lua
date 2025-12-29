-- Global settings
require("configs.global").config()

-- Lazy bootstrap
require("configs.lazy")

-- Additional configs
require("configs.telescope").config()
require("configs.lsp").config()
