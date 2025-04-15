# Model Context Protocol (MCP)

## example

### Cline

version: 3.11.0

1. open vscode and install cline extension
2. open Cline setting, `API Provider` choose `OpenRouer`
3. `Model` choose `deepseek/deepseek-chat:free`
4. click `Get OpenRouter API Key`（if you have）

![mcp_set_openroter](https://img.wangdongdong9264.xyz/mcp_set_openroter.png)

5. test it

![mcp_test_openrouter](https://img.wangdongdong9264.xyz/mcp_test_openrouter.png)

6. click `MCP Servers` find `time` and install
7. open new terminal `pip install mcp-server-time`
8. it will create `cline_mcp_settings.json`

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

## what kind of protocol?

we need ai-gateway of cloudflare

1. dash > AI > AI Gateway > create new one
2. click this that it is your created and find `API` button
3. Platform select `OpenRouer` & copy `API Endpoint` url
4. go back your Cline setting and fall it

![mcp_set_cloudflare](https://img.wangdongdong9264.xyz/mcp_set_cloudflare.png)

`new task` then ask 'what time now'

---

open `AI Gateway` logs

![mcp_gatway](https://img.wangdongdong9264.xyz/mcp_gatway.png)

copy Request logs, you will find it in system prompt

```txt

You have the ability to create an MCP server and add it to a configuration file that will then expose the tools and resources for you to use with `use_mcp_tool` and `access_mcp_resource`). The documentation provides detailed information about the MCP server creation process, including setup instructions, best practices, and examples.

```

copy Response logs, OpenAI give your answer is use the `use_mcp_tool` tood

```txt

"<thinking>\nThe user wants to know the current time. I can use the `use_mcp_tool` tool to get the current time in the Asia/Shanghai timezone.\n</thinking>\n\n<use_mcp_tool>\n<server_name>github.com/modelcontextprotocol/servers/tree/main/src/time</server_name>\n<tool_name>get_current_time</tool_name>\n<arguments>\n{\n  \"timezone\": \"Asia/Shanghai\"\n}\n</arguments>\n</use_mcp_tool>"

```

## process

![mcp_run_process](https://img.wangdongdong9264.xyz/mcp_run_process.png)

## Function Calling vs MCP

| Feature      | Function Calling | MCP |
| ----------- | ----------- | ----------- |
|  Purpose  |   Converts user prompts into structured function calls.   |  Standardizes execution and response handling.  |
|   Who Controls It?    |   LLM provider    |  External system handling LLM integration.  |
|   Output Format    |   Varies by LLM vendor (JSON-based).    |  Uses a standardized protocol (e.g., JSON-RPC).  |
|   Flexibility    |   Different models structure calls differently.    |  Ensures interoperability across multiple tools.  |

## other

[origin news](https://www.anthropic.com/news/model-context-protocol)

[introduction mcp](https://modelcontextprotocol.io/introduction)

[mcp VS function calling](https://dev.to/fotiecodes/function-calling-vs-model-context-protocol-mcp-what-you-need-to-know-4nbo)

[https://smithery.ai/](https://smithery.ai/)

[time mcp ofgithub](https://github.com/modelcontextprotocol/servers/tree/main/src/time)

[https://github.com/astral-sh/uv/](https://github.com/astral-sh/uv/)

if you had `Apple could not verify “uvx” is free of malware that may harm your Mac or compromise your privacy.` open Mac Setting `pravicy & security`  click `allow anyway`

[ai-gatway document](https://developers.cloudflare.com/ai-gateway/)
