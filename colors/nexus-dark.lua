for _, module in ipairs({
  "nexus-dark.palette",
  "nexus-dark.groups",
  "nexus-dark.plugins",
}) do
  package.loaded[module] = nil
end

require("nexus-dark").load({ variant = "galaxy" })
