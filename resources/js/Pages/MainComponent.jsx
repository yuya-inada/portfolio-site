import React, { useEffect, useState } from 'react';
import AppLayout from '@/Layouts/AppLayout';
import axios from 'axios';

export default function MainComponent() {
  const [projects, setProjects] = useState([]);

  useEffect(() => {
    axios.get('/api/projects')
      .then((res) => {
        setProjects(res.data.data); // ← Resource形式のレスポンスに対応
      })
      .catch((err) => {
        console.error('APIエラー:', err);
      });
  }, []);

  return (
    <AppLayout>
      <h1 className="text-3xl font-bold mb-4">ようこそ！</h1>
      <p className="text-lg mb-6">これはReactで作られたポートフォリオサイトのホーム画面です。</p>

      <h2 className="text-2xl font-semibold mb-2">プロジェクト一覧</h2>
      <ul className="space-y-4">
        {projects.map((project) => (
          <li key={project.id} className="bg-white rounded shadow p-4">
            <h3 className="text-xl font-bold">{project.title}</h3>
            <p className="mb-2">{project.description}</p>
            {project.url && (
              <a href={project.url} className="text-blue-500 hover:underline" target="_blank" rel="noreferrer">
                詳しく見る
              </a>
            )}
          </li>
        ))}
      </ul>
    </AppLayout>
  );
}