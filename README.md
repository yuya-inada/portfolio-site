# ポートフォリオサイト / Portfolio Website

このプロジェクトは、Laravel（バックエンド）とReact（フロントエンド）を統合した開発スタックで構築した、開発者自身のスキル・経験・プロジェクトを紹介するためのポートフォリオサイトです。

This project is a portfolio website built with an integrated stack of Laravel (backend) and React (frontend), designed to showcase the developer's skills, experience, and projects.

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

## 🛠 技術スタック / Tech Stack

- **Frontend:** React, Tailwind CSS
- **Backend:** Laravel 10, RESTful API
- **Routing:** Inertia.js
- **Database:** MySQL
- **Others:** Axios, Postman (API testing), Vite

---

## 📁 ディレクトリ構成 / Directory Structure
```
resources/
├── js/
│   ├── Pages/          # ページ単位のコンポーネント
│   └── Components/     # 再利用可能なUI部品
routes/
├── web.php             # フロント用ルーティング
└── api.php             # API用ルーティング
app/
├── Models/             # Eloquentモデル
└── Http/
    ├── Controllers/    # Laravelコントローラー
    └── Resources/      # APIリソース定義
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

---

## 📮 API確認済みエンドポイント例 / Sample Verified API Endpoints

- `GET /api/projects`
- `GET /api/skills/used`
- `GET /api/experiences`
- `POST /api/experiences`（Postman使用 / Postman usage）

---

## 📜 ライセンス / License

MIT

---

## 👤 作者 / Author

- 稲田 雄也 / Yuya Inada  
- GitHub: [inadayuuya] https://github.com/yuya-inada
