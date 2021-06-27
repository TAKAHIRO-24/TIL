# keybindings.jsonとは

Visual Studio Codeでのキーバインド設定を保存したファイル。

## 保存先

`"C:\Users\a_my_\AppData\Roaming\Code\User\keybindings.json"`

## 設定内容

```
// 既定値を上書きするには、このファイル内にキー バインドを挿入しますauto[]
[
    {
        "key": "ctrl+k",
        "command": "shellLauncher.launch"
    },
    {   "key": "ctrl+f",
        "command": "workbench.action.terminal.focusNext"
    },
    {
        "key": "ctrl+alt+h",
        "command": "explorer.newFile"
    },
    {
        "key": "ctrl+shift+n",
        "command": "explorer.newFolder"
    },
    {
        "key": "ctrl+shift+alt+n",
        "command": "workbench.action.newWindow"
    },
    {
        "key": "ctrl+shift+n",
        "command": "-workbench.action.newWindow"
    }
]
```
