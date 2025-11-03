# Cursor Docker Sandbox

- https://cursor.com/docs/cli/headless
- https://cursor.com/docs/cli/reference/configuration
- https://cursor.com/docs/cli/github-actions
- https://cursor.com/docs/cli/cookbook/update-docs
- https://cursor.com/docs/cli/cookbook/fix-ci
- https://cursor.com/docs/cli/reference/configuration
- https://cursor.com/docs/cli/cookbook/translate-keys

```yaml
env:
  CURSOR_API_KEY: ${{ secrets.CURSOR_API_KEY }}

steps:  
  - name: Install Cursor CLI
    run: |
      curl https://cursor.com/install -fsS | bash
      echo "$HOME/.cursor/bin" >> $GITHUB_PATH
  
  - name: Run Cursor Agent
    env:
      CURSOR_API_KEY: ${{ secrets.CURSOR_API_KEY }}
    run: |
      cursor-agent -p "Your prompt here" --model gpt-5
```

```yaml
steps:
  - name: Update docs (full autonomy)
    run: |
      cursor-agent -p "You have full access to git, GitHub CLI, and PR operations. 
      Handle the entire docs update workflow including commits, pushes, and PR comments."
```

```shell
# Repository secret
gh secret set CURSOR_API_KEY --repo OWNER/REPO --body "$CURSOR_API_KEY"

# Organization secret (all repos)
gh secret set CURSOR_API_KEY --org ORG --visibility all --body "$CURSOR_API_KEY"
```