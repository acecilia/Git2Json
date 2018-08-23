extension UnitTestsDataSource {
    enum ValidMultipleCommitLogs {
        static let oneCommit = """
---
{
"hash":"3995ff9acfb25812ca4ad9b835d457e2e1cbe75e",
"authorName":"Theophane RUPIN",
"subject":"Added Weaver to the list of projects using Stencil"
}
###


:100644 100644 290ccce... 75ce68b... M  README.md
2       1       README.md
"""

        static let threeCommits = """
---
{
"hash":"3995ff9acfb25812ca4ad9b835d457e2e1cbe75e",
"authorName":"Theophane RUPIN",
"subject":"Added Weaver to the list of projects using Stencil"
}
###


:100644 100644 290ccce... 75ce68b... M  README.md
2       1       README.md
---
{
"hash":"2e18892f4c02406a90cb96b2ebb1a2438c6655da",
"authorName":"David Jennes",
"subject":"Subscript syntax for Variables (#215)"
}
###


:100644 100644 5f009cb... 0bd445b... M  CHANGELOG.md
:000000 100644 0000000... 445ef29... A  Sources/KeyPath.swift
:100644 100644 b357021... 262ccb5... M  Sources/Variable.swift
:100644 100644 3ca28cb... 7b386bc... M  Tests/StencilTests/VariableSpec.swift
:100644 100644 1934abe... 147be45... M  docs/templates.rst
7       3       CHANGELOG.md
112     0       Sources/KeyPath.swift
5       3       Sources/Variable.swift
92      0       Tests/StencilTests/VariableSpec.swift
18      0       docs/templates.rst
---
{
"hash":"39ed9aa7536d71d28d78313a12e0df7a0d8f3777",
"authorName":"Ilya Puchka",
"subject":"Fixed using spaces in filter expressions and variables lists (#178)"
}
###


:100644 100644 6c87fe7... 5f009cb... M  CHANGELOG.md
:100644 100644 cb96657... 4d7eff2... M  Sources/ForTag.swift
:100644 100644 81680f2... bb3320b... M  Sources/Tokenizer.swift
:100644 100644 9563c89... b357021... M  Sources/Variable.swift
:100644 100644 5224c12... f8de1b8... M  Tests/StencilTests/FilterSpec.swift
:100644 100644 a8b90df... 4bb3fca... M  Tests/StencilTests/ForNodeSpec.swift
6       0       CHANGELOG.md
1       1       Sources/ForTag.swift
17      2       Sources/Tokenizer.swift
2       2       Sources/Variable.swift
3       3       Tests/StencilTests/FilterSpec.swift
3       3       Tests/StencilTests/ForNodeSpec.swift
"""
    }
}
