#!/usr/bin/env bash
# Geminiエージェント用の自己検証スキル（Harness Skill）

set -euo pipefail

echo "🔍 テストと静的解析を実行中..."

# Geminiが余計な制御文字をパースしなくて済むよう、ANSIエスケープシーケンスを無効化
export FORCE_COLOR=0

# Lintチェック
if ! npm run lint --silent > lint-results.log 2>&1; then
  echo "❌ Lintエラーが発生しました。以下のログを解析して修正してください:"
  cat lint-results.log
  exit 1
fi

# テスト実行
if ! npm run test -- --run --reporter=basic > test-results.log 2>&1; then
  echo "❌ テストが失敗しました。以下のログを解析して修正してください:"
  # Geminiのコンテキスト上限は大きいためログ全体を読めるが、ノイズを減らすため末尾を抽出
  tail -n 100 test-results.log
  exit 1
fi

echo "✅ すべての検証をクリアしました！次のステップに進んでください。"
exit 0
