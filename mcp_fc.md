# Model Context Protocol (MCP)

## example

### Cline

version: 3.11.0

1. open vscode and install cline extension
2. open Cline setting, `API Provider` choose `OpenRouer`
3. `Model` choose `deepseek/deepseek-chat:free`
4. click `Get OpenRouter API Key`（if you have）
5. test it
6. click `MCP Servers` find `time` and install
7. it will create `cline_mcp_settings.json`
8. open terminus `pip install mcp-server-time`

### cline_mcp_settings.json

i used `conda`, so maybe the command string is different

```json

{
  "mcpServers": {
    "github.com/modelcontextprotocol/servers/tree/main/src/time": {
      "command": "/opt/anaconda3/envs/mcp_time/bin/python",
      "args": ["-m", "mcp_server_time", "--local-timezone=Asia/Shanghai"],
      "disabled": false,
      "autoApprove": []
    }
  }
}

```

## what kind of protocol ?

## other

[origin news](https://www.anthropic.com/news/model-context-protocol)

[introduction mcp](https://modelcontextprotocol.io/introduction)

[mcp VS function calling](https://dev.to/fotiecodes/function-calling-vs-model-context-protocol-mcp-what-you-need-to-know-4nbo)

[https://smithery.ai/](https://smithery.ai/)

[time mcp ofgithub](https://github.com/modelcontextprotocol/servers/tree/main/src/time)

[https://github.com/astral-sh/uv/](https://github.com/astral-sh/uv/)

if you had `Apple could not verify “uvx” is free of malware that may harm your Mac or compromise your privacy.` open Mac Setting `pravicy & security`  click `allow anyway`
