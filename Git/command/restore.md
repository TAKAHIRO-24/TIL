# ファイルの変更を元に戻す操作

## 前提知識
Git管理されているファイルは３つのステージに分かれている。

### 1. Repositoryを`git clone`

|Working directory|Staging area|Repository|
|:---------------:|:----------:|:--------:|
|file-V1          |file-V1     |file-V1   |

ファイルの変更後。

|Working directory|Staging area|Repository|
|:---------------:|:----------:|:--------:|
|file-V2          |file-V1     |file-V1   |

### 2. `git add`でStaging areaへ変更を反映

|Working directory|Staging area     |Repository|
|:---------------:|:---------------:|:--------:|
|file-V2          |file-V2          |file-V1   |

### 3. `git commit`でRepositoryへ変更を反映

|Working directory|Staging area     |Repository       |
|:---------------:|:---------------:|:---------------:|
|file-V2          |file-V2          |file-V2          |

## 変更を破棄

以下の操作で前述の1.～3.でステージ移動した変更をもとに戻すことができる。

### 1. Working directoryでの変更を破棄

- ファイル変更後

|Working directory|Staging area|Repository|
|:---------------:|:----------:|:--------:|
|file-V2          |file-V1     |file-V1   |

```
$ git restore <filename>
```

- 変更を破棄

**Staging areaの状態へ**Working directoryを戻す

|Working directory|Staging area|Repository|
|:---------------:|:----------:|:--------:|
|file-V1          |file-V1     |file-V1   |

- 参考

上記の操作で`git add`後に`git commit`する前、Working directoryの内容を変更した場合。  
Working directoryの内容を前回`git add`した内容（Staging area）へ戻すことができる。

|Working directory|Staging area|Repository|
|:---------------:|:----------:|:--------:|
|file-V3          |file-V2     |file-V1   |

```
$ git restore <filename>
```

|Working directory|Staging area|Repository|
|:---------------:|:----------:|:--------:|
|file-V2          |file-V2     |file-V1   |

### 2. Staging areaの変更を破棄

- `git add`後

|Working directory|Staging area     |Repository|
|:---------------:|:---------------:|:--------:|
|file-V2          |file-V2          |file-V1   |

```
$ git restore --staged <filename>
```

- `git add`の内容を破棄

**Repositoryの状態へ**Staging areaを戻す

|Working directory|Staging area     |Repository|
|:---------------:|:---------------:|:--------:|
|file-V2          |file-V1          |file-V1   |

## 参考
- [これからは git restore を使ってみようかな](https://bufferings.hatenablog.com/entry/2020/05/01/013451)
