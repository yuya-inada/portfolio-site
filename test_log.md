# 🧪 ポートフォリオサイト - テストログ

このファイルは、ポートフォリオ開発におけるAPI・画面の動作確認を記録したテストログです。  
Postman・ブラウザ等で確認した動作と結果を記載しています。

---

## 🔹 環境情報

- フロント：React（Inertia.js 経由で表示）
- バックエンド：Laravel
- API確認ツール：Postman, ブラウザ手動検証
- テスト日：2025年7月14日
- スキル：事前に登録済み

---

## ✅ 単体テスト

### 📁 Experience API

#### POST /api/admin/experiences
- 入力値：
```json
{
  "title": "エンジニアAAA",
  "company": "株式会社ABC AAA",
  "period": "2020年4月〜2023年3月 AAA",
  "description": "Web開発に従事。ReactとLaravelを使用。AAA",
  "projects": []
}
- 結果：201 Created
```json
{
    "message": "Experience created successfully.",
    "data": {
        "id": 10,
        "title": "エンジニアAAA",
        "company": "株式会社ABC AAA",
        "period": "2020年4月〜2023年3月 AAA",
        "description": "Web開発に従事。ReactとLaravelを使用。AAA",
        "created_at": "2025-07-14T07:09:23.000000Z",
        "projects": []
    }
}
```
- 備考：画面一覧にも即時反映されること確認

#### PUT /api/admin/experiences/10
- 入力値：
```json
{
  "title": "リードエンジニアAAA",
  "company": "株式会社ABC AAA",
  "period": "2020年4月〜2023年3月 AAA",
  "description": "Web開発に従事。ReactとLaravelを使用。AAA",
  "projects": []
}
```
- 結果：201
```json
{
    "message": "Experinece updated successfully."
}
```
- 備考：画面一覧にも即時反映されること確認

#### DELETE /api/admin/experiences/{id}
- 結果：201
```json
{
    "message": "Experience deleted successfully."
}
```
- 備考：画面一覧にも即時反映されること確認

---

### 📁 Projects API

#### POST /api/admin/projects
- 入力値：
```json
{
  "title": "My Portfolio",
  "description": "React + Laravel構成",
  "url": "https://myportfolio.com",
  "image_url": "https://myportfolio.com/image.png",
  "github_url": "https://github.com/inadayuuya/my-portfolio",
  "skill_ids": [1, 2, 3]
}
```
- 結果：201
```json
{
    "message": "Project created successfully.",
    "data": {
        "id": 14,
        "title": "My Portfolio",
        "description": "React + Laravel構成",
        "url": "https://myportfolio.com",
        "github_url": "https://github.com/inadayuuya/my-portfolio",
        "image_url": "https://myportfolio.com/image.png",
        "skills": [
            {
                "id": 1,
                "name": "HTML",
                "category": "Frontend",
                "icon": "fab fa-html5",
                "description": "Markup language for web pages.",
                "created_at": "2025-06-08T08:14:36.000000Z",
                "updated_at": "2025-07-06T02:27:39.000000Z",
                "pivot": {
                    "project_id": 14,
                    "skill_id": 1,
                    "created_at": "2025-07-14T07:46:27.000000Z",
                    "updated_at": "2025-07-14T07:46:27.000000Z"
                }
            },
            {
                "id": 2,
                "name": "CSS",
                "category": "Frontend",
                "icon": "fab fa-css3-alt",
                "description": "Style sheet language for designing web pages.",
                "created_at": "2025-06-08T08:14:36.000000Z",
                "updated_at": "2025-07-06T02:27:39.000000Z",
                "pivot": {
                    "project_id": 14,
                    "skill_id": 2,
                    "created_at": "2025-07-14T07:46:27.000000Z",
                    "updated_at": "2025-07-14T07:46:27.000000Z"
                }
            },
            {
                "id": 3,
                "name": "JavaScript",
                "category": "Frontend",
                "icon": "fab fa-js",
                "description": "Programming language for interactive web apps.",
                "created_at": "2025-06-08T08:14:36.000000Z",
                "updated_at": "2025-07-06T02:27:39.000000Z",
                "pivot": {
                    "project_id": 14,
                    "skill_id": 3,
                    "created_at": "2025-07-14T07:46:27.000000Z",
                    "updated_at": "2025-07-14T07:46:27.000000Z"
                }
            }
        ],
        "created_at": "2025-07-14T07:46:27.000000Z"
    }
}
```
- 備考：画面一覧にも即時反映されること確認

#### PUT /api/admin/projects/14
- 入力値：
```json
{
  "title": "My Portfolio BBB",
  "description": "React + Laravel構成",
  "url": "https://myportfolio.com",
  "image_url": "https://myportfolio.com/image.png",
  "github_url": "https://github.com/inadayuuya/my-portfolio",
  "skill_ids": [1, 2, 3]
}
```
- 結果：201
```json
{
    "message": "Project updated successfully.",
    "data": {
        "id": 14,
        "title": "My Portfolio BBB",
        "description": "React + Laravel構成",
        "url": "https://myportfolio.com",
        "github_url": "https://github.com/inadayuuya/my-portfolio",
        "image_url": "https://myportfolio.com/image.png",
        "skills": [
            {
                "id": 1,
                "name": "HTML",
                "category": "Frontend",
                "icon": "fab fa-html5",
                "description": "Markup language for web pages.",
                "created_at": "2025-06-08T08:14:36.000000Z",
                "updated_at": "2025-07-06T02:27:39.000000Z",
                "pivot": {
                    "project_id": 14,
                    "skill_id": 1,
                    "created_at": "2025-07-14T07:46:27.000000Z",
                    "updated_at": "2025-07-14T07:46:27.000000Z"
                }
            },
            {
                "id": 2,
                "name": "CSS",
                "category": "Frontend",
                "icon": "fab fa-css3-alt",
                "description": "Style sheet language for designing web pages.",
                "created_at": "2025-06-08T08:14:36.000000Z",
                "updated_at": "2025-07-06T02:27:39.000000Z",
                "pivot": {
                    "project_id": 14,
                    "skill_id": 2,
                    "created_at": "2025-07-14T07:46:27.000000Z",
                    "updated_at": "2025-07-14T07:46:27.000000Z"
                }
            },
            {
                "id": 3,
                "name": "JavaScript",
                "category": "Frontend",
                "icon": "fab fa-js",
                "description": "Programming language for interactive web apps.",
                "created_at": "2025-06-08T08:14:36.000000Z",
                "updated_at": "2025-07-06T02:27:39.000000Z",
                "pivot": {
                    "project_id": 14,
                    "skill_id": 3,
                    "created_at": "2025-07-14T07:46:27.000000Z",
                    "updated_at": "2025-07-14T07:46:27.000000Z"
                }
            }
        ],
        "created_at": "2025-07-14T07:46:27.000000Z"
    }
}
```
- 備考：画面一覧にも即時反映されること確認

#### DELETE /api/admin/projects/{id}
- 結果：201
```json
{
    "message": "Project deleted successfully."
}
```
- 備考：画面一覧にも即時反映されること確認

---
