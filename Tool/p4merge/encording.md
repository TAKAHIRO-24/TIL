# 日本語が文字化けするときの対処法

## 一時的に文字コードを変更

p4mergeで差分を確認する際に、初期の文字コードでは日本語が文字化けしてしまう。  

![image](https://user-images.githubusercontent.com/85177462/122580117-96df0b80-d090-11eb-81b0-50fc222131cb.png)

以下の操作で文字コードを変更し、文字化けを回避することができる。  
- [File] > [Charactor Encording] > 文字コード選択

![image](https://user-images.githubusercontent.com/85177462/122580216-aeb68f80-d090-11eb-8aa7-dfef1ca0e715.png)

ここでは、文字コードUTF-8を選択。

![image](https://user-images.githubusercontent.com/85177462/122580396-e02f5b00-d090-11eb-9a2a-60aac34836cb.png)

文字化けが回避できたことを確認。

## デフォルトの文字コードを変更

[Edit] > [Preferences]を選択。

![image](https://user-images.githubusercontent.com/85177462/122613462-da9d3980-d0bf-11eb-8de1-f2c0a3d61005.png)

[Charactor encording]から文字コードを選択。

![image](https://user-images.githubusercontent.com/85177462/122613560-04566080-d0c0-11eb-8179-71e483551b2a.png)
