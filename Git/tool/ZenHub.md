# ZenHubとは

GitHubのissueをカンバン形式で管理できるツール。  
Chrome拡張機能も提供されている。

拡張機能をインストールしたら、リポジトリに[ZenHub]が作成されている。

![image](https://user-images.githubusercontent.com/85177462/123452587-8511e100-d619-11eb-8d46-037fb7aa499e.png)

ZenHubのページに行くと、ワークスペースの作成を行う。

![image](https://user-images.githubusercontent.com/85177462/123452773-b7bbd980-d619-11eb-871a-fe6649e508a6.png)

作成したら、以下のワークスペースがデフォルトで作成されている。

![image](https://user-images.githubusercontent.com/85177462/123452965-eb96ff00-d619-11eb-8f1c-34a1fe663991.png)

- New Issue: 新しく作成したIssue
- Icebox: 優先度の低いバックログ
    - バックログ: バグや追加する機能などのやるべきタスク
- Product Backlog: プロダクトのバックログ
- Sprint Backlog: 本スプリント内で対応すべきバックログ
- In Progress: 作業中のもの
- Review/QA: 開発済みのレビュー中のもの
- Done: 作業が終わり、リリース待ちのもの
- Closed: 本番環境にリリース済みの作業

## 用語説明
- Issue
    - 作業の単位
    - ストーリーともいう
    - 1スプリット内に終える
- Milestone
    - スプリント（開発期間）のこと
    - 作成したIssue（ストーリー）をいつまでに終わらせるか
    - だいたい1～3週間
- Estimate
    - ストーリーポイント（作業にかかる工数の見積もり）
    - フィボナッチ数列（1, 2, 3, 5, 8, 13, 21, 40）を使う
    - 相対的な見積もりで、同じ「１」のストーリーポイントなら同じ工数の作業
    - 相対的な工数なので個人間の見積もりの誤差が少なくなる
- Epics
    - 複数のIssue（ストーリー）をまとめたもの
    - 大粒の要件のようなもの
    - 完了するまでに複数のスプリントをまたぐ

## カンバン作成

画面右の＋から作成できる。

![image](https://user-images.githubusercontent.com/85177462/123454709-d622d480-d61b-11eb-998f-da3a74ff5912.png)

Milestoneを作成。  
タイトルや詳細、期日等を設定する。

![image](https://user-images.githubusercontent.com/85177462/123454996-239f4180-d61c-11eb-99ba-a3c0864998e6.png)

issueを作成。
画面右で作成したMilestoneやメンバーの設定等ができる。

![image](https://user-images.githubusercontent.com/85177462/123455837-22badf80-d61d-11eb-964d-ddcdc85728c8.png)
