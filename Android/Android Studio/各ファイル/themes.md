ビューの属性を統一するには、`themes.xml`でテーマを全体適用する方法やスタイルを各ビューに個別適用する方法がある。

## 方法１　各ビューに個別適用

以下を参照。

- [スタイルを作成して適用する](https://developer.android.com/guide/topics/ui/look-and-feel/themes?hl=ja#Styles)

- `Android4.1`以降
  - `res＞values＞themes.xml`にスタイルを記述して各ビューに個別適用する。  
    ※themes.xmlには`Light Mode`と`Night Mode`の二つのファイルがあることに注意。
- `Android4.1`以前
  - `res＞values＞styles.xml`にスタイルを記述して各ビューに個別に適用する。


```XML
# themes.xml
<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Theme.ViewSample" parent="Theme.MaterialComponents.DayNight.DarkActionBar">
        <!-- Primary brand color. -->
        <item name="colorPrimary">@color/purple_200</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/black</item>
        <!-- Secondary brand color. -->
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_200</item>
        <item name="colorOnSecondary">@color/black</item>
        <!-- Status bar color. -->
        <item name="android:statusBarColor" tools:targetApi="l">?attr/colorPrimaryVariant</item>
        <!-- Customize your theme here. -->
    </style>

    # 追記 ↓
    <style name="defaultColor">
        <item name="android:background">#FFFFFF</item>
        <item name="android:textColor">#FF0000</item>
    </style>
    # 追記 ↑
</resources>

```

`style="@style/defaultColor"`をビューの属性で指定することで、`style.xml`に指定した属性が適用される。  
個別に属性を指定することで上書きすることもできる。

```XML
<textView
    style="@style/defaultColor"
    android:text="@string/..." />
```

上記指定で以下が適用される。

- `android:background="#FFFFFF#`
- `android:textColor="#FF0000"`

スタイルで指定された各属性は、ビューが受け入れる場合、そのビューに適用される。ビューは受け入れない属性を単に無視する。

## 方法２　テーマを全体適用

以下を参照。

- [スタイルをテーマとして適用する](https://developer.android.com/guide/topics/ui/look-and-feel/themes?hl=ja#Theme)



# 参照
- [スタイルとテーマ](https://developer.android.com/guide/topics/ui/look-and-feel/themes?hl=ja)