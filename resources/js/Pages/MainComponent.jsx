import React from 'react';
import AppLayout from '@/Layouts/AppLayout';

export default function MainComponent() {
  return (
    <AppLayout>
      <h1 className="text-3xl font-bold mb-4">ようこそ！</h1>
      <p className="text-lg">これはReactで作られたポートフォリオサイトのホーム画面です。</p>
      </AppLayout>
  );
}