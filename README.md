
# Steam Workshop Upload Action

This action allows you to upload to Steam Workshop.

## Example workflow

```yml
# .github/workflows/release.yml
on:
  push:
    tags:
    - 'v*.*.*'

jobs:
  build_addon:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Set VERSION env
      run: echo VERSION=${GITHUB_REF:11} >> $GITHUB_ENV
    - name: Build addon with HEMTT
      uses: 16AAModTeam/hemtt@stable
      with:
        command: 'build --release'
    # Upload to Steam Workshop
    - uses: arma-actions/workshop-upload@v1
      with:
        appId: '107410'    # default
        itemId: '1643238133' # Id of item to update
        contentPath: 'releases/${{ env.VERSION }}/@armaforces_mods'
        changelog: 'Content of change notes'
      env:
        STEAM_USERNAME: ${{ secrets.STEAM_USERNAME }}
        STEAM_PASSWORD: ${{ secrets.STEAM_PASSWORD }}
```
