# ポートフォリオサイト / Portfolio Website

このプロジェクトは、Laravel（バックエンド）とReact（フロントエンド）を統合した開発スタックで構築した、開発者自身のスキル・経験・プロジェクト・趣味・興味を紹介するためのポートフォリオサイトです。

This project is a portfolio website built with an integrated stack of Laravel (backend) and React (frontend), designed to showcase the developer's skills, experience, projects, hobby, and interest.

---

## ✅ 主な機能 / Main Features
```
- プロジェクト・スキル・経験の管理（CRUD機能）
　 Manage projects, skills, and experiences (CRUD)

- 経歴とプロジェクトの紐づけ（多対多リレーション）
　 Link projects to experiences (many-to-many relation)

- アコーディオン式の詳細表示機能
　 Accordion UI for project details

- 管理画面を使ったデータ編集
　 Admin panel for editing content

- GitHubリンクや外部URL表示対応
　 GitHub and external link support

- ダークテーマUI対応
　 Dark-theme compatible UI
```
---
## 🔐 管理者ログイン機能 / Admin Authentication Feature
```
- 管理者ログインによる認証付き操作（Sanctum使用）
  Authenticated admin-only actions via Laravel Sanctum

- 認証後に「編集」「削除」ボタンが表示される制御
  Conditional rendering of "Edit" and "Delete" buttons after login

- トークンをlocalStorageに保存し、axiosで自動送信
  Auth token stored in localStorage, sent via Axios automatically

- ログアウトでトークン削除＋画面更新
  Logout clears token and updates the UI

- `/admin-login` ページでログインフォームを提供
  Login form available at `/admin-login`
```
---
## 💻 ログイン用UIの補足 / Login UI Details
```
- ログイン画面のデザインは全体のUIと統一（ダークテーマ対応）
  The design of the login screen is unified with the overall UI (supports dark theme).

- ログインに成功すると、管理者専用ボタンが各所に表示される
  When login is successful, admin-only buttons will be displayed in various places.

- ログイン状態は localStorage のトークンの有無で判定
  The login status is determined by the presence or absence of a token in localStorage.
```
---
## 🔐 管理者用APIルート例 / Admin API Endpoints
```
- POST   /api/login          # 管理者ログイン / Admin login
- POST   /api/admin/logout   # 管理者ログアウト / Admin logout

- POST   /api/admin/projects         # プロジェクト登録
- PUT    /api/admin/projects/{id}    # プロジェクト更新
- DELETE /api/admin/projects/{id}   # プロジェクト削除

- POST   /api/admin/experiences      # 経歴登録
- PUT    /api/admin/experiences/{id} # 経歴更新
- DELETE /api/admin/experiences/{id} # 経歴削除

＊スキルは事前に登録済み（新規登録or更新時に選択ボックスとして表示するため）
＊Skills are pre-registered (to be displayed as a selection box for new registration or updates)
```
---

## 🛠 技術スタック / Tech Stack

- **Frontend:** React, Tailwind CSS
- **Backend:** Laravel 10, RESTful API
- **Routing:** Inertia.js
- **Database:** MySQL
- **Others:** Axios, Postman (API testing), Vite

---

## 📁 ディレクトリ構成 / Directory Structure
以下は主要ディレクトリとその役割の概要です：  
Below is an overview of the main directories and their roles:
```
resources/
├── js/
│   ├── Pages/              # ルーティング単位のページコンポーネント / Routing unit page component
│   │   └── AdminLogin.jsx  # 管理者ログインページ / Administrator login page
│   ├── Components/         # 再利用可能なUI部品 / Reusable UI components
│   ├── SkillExplanation.jsx # スキル詳細の静的コンテンツ定義 / Static content definitions for skill detail
│   └── axiosSetup.jsx       # Axiosインスタンス設定（Sanctum対応）/ Axios instance configuration (with Sanctum support)

routes/
├── web.php                 # フロントエンド用ルーティング（Inertia.js経由）/ Frontend routing (via Inertia.js)
└── api.php                 # バックエンドAPIルート（RESTful + 認証付き）/ Backend API routes (RESTful + authenticated)

app/
├── Models/                 # Eloquentモデル（User, Project, Skill など）/ Eloquent models (User, Project, Skills, etc)
└── Http/
    ├── Controllers/        
    │   ├── Api/            # API専用コントローラー（ExperienceControllerなど）/ API-specific controllers (e.g., ExperineceController)
    │   └── ProjectController.php
    └── Resources/          # APIレスポンス整形用リソースクラス / Resource classes for API response formatting

public/
└── index.php               # エントリーポイント（Laravelフレームワーク起動）/ Entry point (Laravel fremework boot)
```

## 🧪 開発・テストツール / Development & Testing Tools

### 🛠️ 使用ツール / Tools Used

- **Postman:**  
　APIエンドポイントのテスト・検証に使用  
　*Used for testing and verifying API endpoints*

- **Laravel Tinker:**  
　開発時のデータ操作に活用  
　*Utilized for manipulating data during development*

- **Browser DevTools:**  
　UI検証とレスポンシブ対応の調整に利用  
　*Used for UI inspection and responsive design adjustments*

---

## 🚀 セットアップ手順 / Setup Instructions

```bash
# クローン & 移動
git clone https://github.com/yuya-inada/your-portfolio-site.git
cd your-portfolio-site

# バックエンドセットアップ / Backend setup
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed

# フロントエンドセットアップ / Frontend setup
npm install
npm run dev

# サーバー起動 / Server startup
php artisan serve
```
---

## 📮 API確認済みエンドポイント例 / Sample Verified API Endpoints

- `GET /api/projects`
- `GET /api/skills/used`
- `GET /api/experiences`
- `POST /api/experiences`（Postman使用 / Postman usage）

---

## 🌐 デプロイ構成 / Deployment Configuration

このポートフォリオサイトは、以下の構成で本番環境にデプロイしています。
This portfolio site is deployed to a production environment with the following setup:
```
- 📍 サーバー / Server：ConoHa VPS（Ubuntu 22.04）
- 🔐 Webサーバー / Web Server：Nginx
- 🧱 バックエンド / Backend：Laravel 10（PHP 8.2）
- 🌐 フロントエンド / Frontend：Vite + React
- 🗃️ データベース / Database：MySQL
- 🔒 SSL対応 / SSL Support：Let's Encrypt（via Certbot）
```
---

## 🔧 デプロイ手順（概要） / Deployment Steps (Overview)

-1.VPS環境のセットアップ / VPS Setup
　　　OSの初期設定、Nginx・PHP・MySQL・Node.js等のインストール
　　　Initial server setup, installing Nginx, PHP, MySQL, Node.js, and other required packages.
-2.Laravelの配置・環境構築 / Laravel Setup
　　　Git clone → .env設定 → composer install → php artisan migrate --seed
　　　Cloning the repository, setting up .env, installing dependencies, and running database migrations and seeding.
-3.React（Vite）ビルド / React (Vite) Build
　　　npm install → npm run build → public/にビルド出力を配置
　　　Installing packages, building production assets, and placing them in the public/ directory.
-4.Nginxの設定 / Nginx Configuration
　　　ドメイン設定・SSL証明書の取得・ルーティング設定
　　　Configuring domain, SSL certificate, and Laravel + Vite routing.
-5.セキュリティ・保守 / Security & Maintenance
　　　ファイアウォール設定、fail2ban導入、API認証の制限など
　　　Setting up a firewall, enabling fail2ban, restricting admin/API routes, etc.

---

## 🧩 備考 / Notes
 - 本番環境には独自ドメイン（例：owlione.com）を使用しています。SSLはLet’s Encryptを使用。
A custom domain (e.g., owlione.com) is used for production. SSL is issued via Let’s Encrypt.

---
## 📜 ライセンス / License

MIT

---

## 👤 作者 / Author

- 稲田 雄也 / Yuya Inada  
- GitHub: [inadayuuya] https://github.com/yuya-inada
