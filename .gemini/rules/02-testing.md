# Testing Rules

## 1. テストフレームワーク
- `Vitest` および `Testing Library` を使用してください。

## 2. モックの多用禁止
- DBや外部API通信以外の内部ロジックは、モックを使用せず統合的なテスト（Integration Test）を書くこと。

## 3. Geminiの自己検証
- テストが失敗した際は、`.gemini/skills/run-tests.sh` が出力する標準エラー出力をコンテキストに取り込み、元のコードを修正して再実行してください。
