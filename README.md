Prepare a environment for practice
===============================================================================================================

Install haskell-stack
---------------------------------------------------------------
Install stack: `curl -sSL https://get.haskellstack.org/ | sh` ([ref](https://docs.haskellstack.org/en/stable/install_and_upgrade/))  

Import it in IntelliJ
---------------------------------------------------------------
1. Download and install the latest beta version of plugin **IntelliJ-Haskell**.
   You can do so by adding https://plugins.jetbrains.com/plugins/alpha/8258 to you IntelliJ's customer plugin repository list.
2. Menu "File" -> "New" -> "Import Project from Existing Source".
3. First time you run it takes a long time to fetch all dependencies.
4. If plugin doesn't work properly enable "Haskell Log" in your "Event Log" window.

In case you need to create a fresh project
---------------------------------------------------------------
1. Create sample project from `simple` template using
   `stack new demo01 simple`
2. Go in project root.
   Fetch dependencies and appropriate GHC using `stack setup`
   Build executable output using                `stack build`
3. Aside from `simple` template you can use [stack-templates](https://github.com/commercialhaskell/stack-templates).
