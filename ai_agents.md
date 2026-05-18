# Agents

## why use it

1. Specialize Claude: Tailor capabilities for domain-specific tasks
2. Reduce repetition: Create once, use automatically
3. Compose capabilities: Combine Skills to build complex workflows

## level

| Level | When Loaded | Token Cost | Content |
| :--- | :--- | :--- | :--- |
| **Level 1: Metadata** | Always (at startup) | ~100 tokens per Skill | `name` and `description` from YAML frontmatter |
| **Level 2: Instructions** | When Skill is triggered | Under 5k tokens | SKILL.md body with instructions and guidance |
| **Level 3+: Resources** | As needed | Effectively unlimited | Bundled files executed via bash without loading contents into context |

## architecture

![agent-skills-architecture](https://img.wangdongdong9264.xyz/agent-skills-architecture.png)

## structure

```shell

pdf-skill/
├── SKILL.md #main instructions
├── FORMS.md #form-filling guide)
├── REFERENCE.md #detailed API reference
└── scripts/
    └── fill_form.py #utility script

```

## other

[define your agent](https://platform.claude.com/docs/en/managed-agents/skills)

[sub-agents](https://code.claude.com/docs/en/sub-agents)

[compatibility with OpenAI](https://platform.claude.com/docs/en/api/openai-sdk)

[example of anthropics skills](https://github.com/anthropics/skills/tree/main/skills)

[skills-explained](https://claude.com/blog/skills-explained)

[agent-skills overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)