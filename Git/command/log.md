# コミット情報を表示

## コミット履歴を一覧表示

```
$ git log

# オプション
--oneline     : 各コミットを一行で表示
--graph       : 各コミットの履歴をブランチの分岐を線で表して表示
-- <filename> : 特定のファイルの情報を表示
--follow <filename> : ファイル名の変更も考慮して表示
```

### 1. --oneline

各コミットを一行で表示する。

```
$ git log --oneline
6806eec (HEAD -> main) new file
59ed8b1 delete file
1202a82 make new file
acabc8f change name again
84e8abb change name
ae08af7 modified newfile.txt
cd86976 add newfile
b52de06 (origin/main, origin/HEAD) Initial commit
```

### 2. --graph

ブランチの分岐を線で表示し、各コミットを表示

```
* commit 1202a828745a2c8d1aa21985c9c2435de911a3d7
| Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
| Date:   Mon Jun 7 01:09:16 2021 +0900
|
|     make new file
|
* commit acabc8f0807d2aa36834d1f1d51482ba41949025
| Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
| Date:   Sun Jun 6 21:02:44 2021 +0900
|
|     change name again
|
* commit 84e8abbdf2c773acb09c3979f180458f0a3f2829
| Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
| Date:   Sun Jun 6 19:45:15 2021 +0900
|
|     change name
```

### 3. -- filename

指定したファイル名のコミット情報のみ表示

```
$ git log -- delete_soon.txt
commit 6806eec09dc932969158928b3d36ab1ebfcc0099 (HEAD -> main)
Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
Date:   Mon Jun 7 01:29:48 2021 +0900

    new file

commit 59ed8b10790a251a522d37b748b448232d954b0e
Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
Date:   Mon Jun 7 01:15:47 2021 +0900

    delete file

commit 1202a828745a2c8d1aa21985c9c2435de911a3d7
Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
Date:   Mon Jun 7 01:09:16 2021 +0900

    make new file
```

### 4. --follow filename

ファイル名の変更がある場合は、変更前のコミット履歴も表示する。

```
$ git log --follow delete_soon.txt
```

## 特定のコミット情報の詳細を表示

commit-IDは`git log`で表示されるコミットごとに振られた乱数。  
`git log --oneline`で表示される省略IDでも問題ない。

```
$ git show 84e8abb
commit 84e8abbdf2c773acb09c3979f180458f0a3f2829
Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
Date:   Sun Jun 6 19:45:15 2021 +0900

    change name

diff --git a/newfile.txt b/namechanged.txt
similarity index 100%
rename from newfile.txt
rename to namechanged.txt
```
