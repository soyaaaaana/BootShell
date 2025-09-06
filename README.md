<div align="center">
  <h1>BootShell</h1>
  Windowsのブート画面でコマンドプロンプトを起動するためのツール
</div>

## 仕組み
Windowsのセットアップで使うレジストリを変更して任意のコマンドを実行できるようにしてます。
<br>
`HKLM\SYSTEM\Setup` キーの `CmdLine`(REG_SZ) の値を任意の実行したいコマンドに、`SetupType`(REG_DWORD) を `2` に、`SystemSetupInProgress`(REG_DWORD) を `1` にすることで実現できます。

## 使い方
`BootShell.bat` をダウンロードして管理者で実行して「Y」キーを押すだけです。
<br>
これでブート画面でコマンドプロンプトのウィンドウが出てきます。
<br>
Windowsに戻りたいときは `win` コマンド、回復環境に行きたいときは `recovery` コマンドが使えます。

<!--
## もしもバグったら
- `win` コマンドまたは `recovery` コマンドが存在せず、使えない場合
  - `rebuild %systemdrive%` を実行
- `rebuild` コマンドが正常に動作しない状況で、Windowsを正常起動したい場合
  - 回復環境を起動し、「トラブルシューティング」→「詳細オプション」→「コマンド プロンプト」でコマンドプロンプトを起動し、`notepad` を実行してメモ帳を開く、「ファイル(F)」をクリックして「開く(O)」をクリック、そこからWindowsがインストールされているドライブを探したのち、メモ帳を閉じて、コマンドプロンプトに `(Windowsのドライブ)\BootShell\repair.bat` を実行
-->
