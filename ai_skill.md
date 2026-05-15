# Skill

custom skill let you enhance Claude specialized knowledge and workflows specific to personal work style.

## what is the best Skill

1. Solve a specific, repeatable task
2. Have clear instruction that Cluade can follow
3. Include examples when helpful
4. Define when they should be used
5. Are focused on one workflow rather than trying to do everything

## structure

Skill.md

### Required metadata fields

name: A human-friendly name for your Skill (64 characters maximum)

description: A clear description of what the Skill does and when to use it. This is critical—Claude uses this to determine when to invoke your Skill (200 characters maximum).

### Optional metadata fields

dependencies: Software packages required by your Skill.

Example: python>=3.8, pandas>=1.5.0

### Markdown body

The Markdown body is the second level of detail after the metadata, so Claude will access this if needed after reading the metadata.

### Add resources

### Add scripts

```shell
# Correct structure:

my-Skill.zip

  └── my-Skill/

      ├── Skill.md

      └── resources/

```

## Test you skill

1. Review your Skill.md for clarity
2. Check that the description accurately reflects when Claude should use the Skill
3. Verify all referenced files exist in the correct locations
4. Test with example prompts to ensure Claude invokes it appropriately

## Security considerations

* Exercise caution when adding scripts to your Skill.md file.

* Don't hardcode sensitive information (API keys, passwords).

* Review any Skills you download before enabling them.

* Use appropriate MCP connections for external service access.

## other

[example Skills](https://github.com/anthropics/skills/tree/main/skills)
