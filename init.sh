#!/usr/bin/env bash
# Geminiエージェントがプロジェクト環境を初期化するためのハーネス

set -euo pipefail

echo "🚀 エージェント環境の初期化を開始します..."

if ! command -v npm &> /dev/null; then
    echo "❌ 致命的エラー: npm がインストールされていません。"
    exit 1
fi

echo "📦 依存パッケージをクリーンインストール中..."
npm ci --silent

echo "🧹 既存のビルドキャッシュをクリア..."
rm -rf dist/ .turbo/ || true

echo "✨ init.sh 完了: Geminiエージェントはタスクを開始できます。"
