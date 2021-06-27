# settings.jsonとは

Visual Studio Codeでの全体の設定ファイル。

## 保存場所

`"C:\Users\a_my_\AppData\Roaming\Code\User\settings.json"`

## 設定手順

- ファイル＞ユーザー設定＞設定＞から設定画面を開く。

![image](https://user-images.githubusercontent.com/85177462/123543588-40f21e00-d78a-11eb-944a-7d554634e8a8.png)

- 画面右上の「設定（json）を開く」からsettings.jsonを開く

![image](https://user-images.githubusercontent.com/85177462/123543526-ed7fd000-d789-11eb-987d-106691b137a8.png)


## 設定内容

```
{
  "editor.detectIndentation": false,

  "terminal.integrated.shell.windows":"C:\\windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",

  "shellLauncher.shells.windows": [
      {
        // 既定のターミナルにpowershellを追加
        "shell": "C:\\windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
        "label": "powershell"
      },
      {
        // 既定のターミナルにgit-bashを追加
        "shell": "C:\\Program Files\\Git\\bin\\bash.exe",
        "label": "git-bash"
      }
  ],

    "workbench.activityBar.visible": true,
    "C_Cpp.updateChannel": "Insiders",
    "terminal.integrated.automationShell.windows": "",
    "terminal.integrated.cwd": "C:\\users\\a_my_\\documents\\github\\repositories",
    "editor.hover.enabled": false,
    "editor.parameterHints.enabled": false,

    //80文字ライン
    "editor.rulers": [80],

    //python インテリセンス
    "[cpp]": {
        "editor.quickSuggestions": true
    },

    //--------------------------------------------------------------------------------------------------------------------//
    // Vim設定
    //--------------------------------------------------------------------------------------------------------------------//
    // システムのクリップボードを利用する
	"vim.useSystemClipboard": true,
	// 検索にマッチしたテキストをハイライトする
	"vim.hlsearch": true,
	// easymotion を有効にする
	"vim.easymotion": true,
	// ビジュアルモードで * や # で検索
	"vim.visualstar": true,
	// 検索時に大文字小文字を無視する
	"vim.ignorecase": true,
	// インクリメンタルサーチ
	"vim.incsearch": true,
	// CamelCaseMotion を有効にする
	"vim.camelCaseMotion.enable": true,
	// leader キーの設定
	"vim.leader": "\\",
	// キーバインド
	"vim.insertModeKeyBindings": [
		{
			"before": ["j", "j"],
			"after": ["<Esc>"]
		}
    ],
    //vim-airline(ステータスバー色変更)
    "vim.statusBarColorControl": true,
    "vim.statusBarColors.normal": ["#8FBCBB", "#434C5E"],
    "vim.statusBarColors.insert": "#BF616A",
    "vim.statusBarColors.visual": "#B48EAD",
    "vim.statusBarColors.visualline": "#B48EAD",
    "vim.statusBarColors.visualblock": "#A3BE8C",
    "vim.statusBarColors.replace": "#D08770",
    "workbench.colorCustomizations": {
        "statusBar.background": "#B48EAD",
        "statusBar.noFolderBackground": "#B48EAD",
        "statusBar.debuggingBackground": "#B48EAD",
        "statusBar.foreground": "#434C5E"
    },
    
    //--------------------------------------------------------------------------------------------------------------------//
    // CodeRunner設定(Ctrl+Alt+N)
    //--------------------------------------------------------------------------------------------------------------------//
    "code-runner.runInTerminal": true,
    "code-runner.executorMap": {

        "kotlin": "cd $dir && kotlinc-jvm $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
        "javascript": "node",
        "php": "C:\\php\\php.exe",
        "python": "python",
        "perl": "perl",
        "ruby": "C:\\Ruby23-x64\\bin\\ruby.exe",
        "go": "go run",
        "html": "\"C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe\"",
        "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
        "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        "cpp": "g++ $fullFileName && ./a.exe"
    },
    "http.proxySupport": "off",
    "workbench.iconTheme": "material-icon-theme",
    "editor.linkedEditing": true,
    "liveServer.settings.donotShowInfoMsg": true,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "workbench.editorAssociations": {
        "*.ipynb": "jupyter.notebook.ipynb"
    }
    
}
```
