# AI local

why we need to run AI on our own computers?

1. speed: local proessing reduces latency, making devices more responsive
2. privary: data stays on the device, enhancing user privacy
3. offline: devices can function without internet connectivity, providing consistent performance

## meta llama 3.1

### setup

macbook pro: 15.0 Beta, m2 max chip, 96GB

we will be using `ollamap`, so the first step is to install and run it

open terminal and run `allama pull llama3` to download the 8B chat model, with a size of about 4.7GB

or run `allama pull llama3:70b` about 39GB

### runing

run `ollama run llama3` or `ollama run llama3:70b`

you can to ask question and chart with llama3 model

### used memory

llama 8b

![befor 8b](https://img.wangdongdong9264.xyz/llama_before_8b.png)

![after 8b](https://img.wangdongdong9264.xyz/llama_after_8b.png)

![answer 8b](https://img.wangdongdong9264.xyz/llama_answer_8b.png)

---

llama 70b

![befor 70b](https://img.wangdongdong9264.xyz/llama_before_70b.png)

![after 70b](https://img.wangdongdong9264.xyz/llama_after_70b.png)

![answer 70b](https://img.wangdongdong9264.xyz/llama_answer_70b.png)

### open webui

The terminal is not convenient, so we need a ui

if the llama is on your computer, you use this command

`docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main`

open website `http://localhost:3000/`

## other

[Ollamap website](https://ollama.com/)

[meta llama](https://llama.meta.com/docs/overview)

[Calculating GPU memory for serving LLMs](https://www.substratus.ai/blog/calculating-gpu-memory-for-llm)

[open webUI github](https://github.com/open-webui/open-webui)

[open webUI document](https://docs.openwebui.com/)