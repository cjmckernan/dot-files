local dap = require("dap")

-- Adapter configuration for launching a Java process
dap.adapters.java = {
  type = "executable",
  command = "/home/bitwave/.sdkman/candidates/java/current/bin/java",
  args = {
    "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044",
    "-cp",
    "app/build/classes/java/main:/home/bitwave/projects/java_workspace/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar", -- Classpath for both your classes and the Java Debug Plugin
    "org.example.App", -- Fully qualified name of the main class
  },
}

-- DAP configurations for launching and attaching
dap.configurations.java = {
  {
    type = "java",
    request = "launch",
    name = "Launch Main Class",
    mainClass = "org.example.App",
    classPaths = { "app/build/classes/java/main" },
    console = "integratedTerminal",
    stopOnEntry = true,
  },
  {
    type = "java",
    request = "attach",
    name = "Attach to Java Process",
    hostName = "127.0.0.1",
    port = 5005, -- Ensure this matches the port you used when starting the Java process manually
  },
}

-- Setup the DAP UI
local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
