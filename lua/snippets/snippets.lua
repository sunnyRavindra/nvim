local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s("trigger azure devops pipeline", 
    t({
"name: my-first-azure-pipeline",
"trigger: none",
"trigger: ",
"batch: true # Run pipeline in sequence with multiple commits.Address caution.",
"    branches:",
"        include:",
"	      - main",
"	      - feature/* # Wildcard (* , ** and ?)",
"		exclude:",
"          - wip/*",
"    paths:",
"	    include:",
"	      - pipelines/my-first-azure-pipeline*",
"	    exclude:",
"	      - README.md",
"	tags: # This will run when you push a tag. ",
"		include:",
"			- v1.*",
"	    exclude:",
"	      - v1.0",
"pr:",
" branches:",
"   include:",
"      - main",
"   exclude:",
"      - wip/*",
" paths:",
"    include:",
"      - pipelines/my-first-azure-pipeline*",
"    exclude:",
"      - README.md",
" tags:",
"   include:",
"     - v1.*",
"   exclude:",
"     - v1.0",
"resources: # This is redundant here as this is the default behaviour",
"    - repo: self",
    }))
})

