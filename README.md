# 🤖 my-agent-harness-project

[![Agent: Gemini](https://img.shields.io/badge/Agent-Gemini-1A73E8?style=flat-square&logo=google-gemini&logoColor=white)](https://deepmind.google/technologies/gemini/)
[![Harness Engineering](https://img.shields.io/badge/Architecture-Harness_Engineering-2EA44F?style=flat-square)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

> **Gemini CLI / AIエージェントに最適化された「ハーネスエンジニアリング」の実装テンプレート**

このリポジトリは、AIコーディングエージェント（特にGeminiのような超長大なコンテキスト長と高度な推論能力を持つAI）が、**自律的かつ安全に長時間のタスク（Long-Horizon Tasks）を完遂するための足場（Harness）**を提供します。

## 🧠 ハーネスエンジニアリングとは？

AIに単一のプロンプトを投げて祈るのではなく、 **「エージェントが迷わず、失敗を自己修復し、システムを破壊しないための実行環境」** をリポジトリ内に構築する設計手法です。

本プロジェクトでは、以下の5層アーキテクチャでAIの行動を制御します。
1. **Constitution (憲法)**: `GEMINI.md` による最上位のシステムインストラクション
2. **Rules (ルール)**: `01-architecture.md` 等によるドメイン・設計制約
3. **Skills (スキル)**: `run-tests.sh` のようなAI向け検証ツール（Function Calling用）
4. **Agents (ペルソナ)**: `agents.md` によるコンテキストと役割のルーティング
5. **Settings (安全装置)**: `settings.json` による破壊的コマンドのブロック

## 📂 ディレクトリ構造

本リポジトリのコアとなる設定は `.gemini/` および `docs/harness/` に集約されています。

```text
my-agent-harness-project/
├── .gemini/                   # ハーネスのコアディレクトリ (Geminiエージェント用)
│   ├── GEMINI.md              # プロジェクト憲法 (System Instruction)
│   ├── agents.md              # エージェントのペルソナ定義
│   ├── settings.json          # Tool Use設定・コマンド実行権限制御
│   ├── rules/                 # ドメイン・テストなどの各種ルール
│   │   ├── 01-architecture.md
│   │   └── 02-testing.md
│   └── skills/                # 自己修正ループを回すための専用スクリプト
│       └── run-tests.sh
├── docs/harness/              # コンテキスト管理・ワーキングメモリ
│   ├── Plan.md                # 計画立案と短期メモリ (Chain of Thoughtの永続化)
│   └── Implement.md           # 人間や他のAIへの引き継ぎレポート
├── .lefthook.yml              # 決定論的検証ガードレール (Pre-commit hooks)
└── init.sh                    # AIが環境を自己修復・同期するためのスクリプト
```

## 🚀 使い方 (Getting Started)

### 1. リポジトリのクローン
```bash
git clone https://github.com/qack-dev/my-agent-harness-project.git
cd my-agent-harness-project
```

### 2. 環境の初期化
本プロジェクトの初期化スクリプトを実行します。AIエージェント自身にもこのスクリプトを実行する権限が与えられます。
```bash
chmod +x init.sh .gemini/skills/run-tests.sh
./init.sh
```

### 3. Geminiエージェントの起動
Gemini CLI（または対応するエージェントフレームワーク）を起動し、`.gemini/GEMINI.md` をシステムインストラクションとして読み込ませます。

**プロンプト例:**
> 「`docs/harness/Plan.md` を読み込み、新規ユーザー登録機能（要件: メールアドレスとパスワード、バリデーション必須）をTDDで実装してください。」

## 🔄 エージェント・ワークフロー

AIエージェントは、本リポジトリ内で以下のワークフローを**自律的**に実行します。

1. **計画とメモリ同期**: `docs/harness/Plan.md` を更新し、ゴールとタスクを明確化。
2. **環境同期**: `./init.sh` を実行し、依存関係の不整合を排除。
3. **テスト駆動開発 (TDD)**: `@TDD-Engineer` ペルソナになりきり、実装前にテストを作成。
4. **自己検証 (Self-Correction)**: `.gemini/skills/run-tests.sh` を実行。Lintやテストが失敗した場合は、エラーログを読み込み、コードを修正して再テストするループを回します。
5. **レポート作成**: タスク完了後、`docs/harness/Implement.md` に結果をまとめます。

## 🛡 ガードレール（安全装置）

- **Lefthook**: AIの「些細なフォーマットミス」を防ぐため、コミット前に `Prettier`, `ESLint`, `TypeScript (noEmit)` が自動実行されます。
- **設定による制限**: `.gemini/settings.json` により、`rm -rf /` や強制プッシュなどの破壊的コマンドをエージェントが実行できないようブロックしています。

## 🤝 コントリビューション

このテンプレートは、AI開発の進化に合わせて常にアップデートされます。
バグ報告、新しいスキルの提案、ルールの改善など、Pull RequestやIssueを歓迎します！

## 📄 ライセンス

MIT License. 詳細は [LICENSE](LICENSE) ファイルを参照してください。
