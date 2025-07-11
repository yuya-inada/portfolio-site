// resources/js/Pages/TopIntro.jsx
import React from 'react';
import AppLayout from '@/Layouts/AppLayout';
import TopIntroSection from '@/Components/TopIntroSection';
import HobbiesSection from '@/Components/HobbiesSection';

export default function About() {
  function copyEmail() {
    navigator.clipboard.writeText('youreMail@sample.com')
      .then(() => alert('Copied!'))
      .catch((err) => console.error('コピーに失敗', err));
  }

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <TopIntroSection copyEmail={copyEmail} />
        <HobbiesSection />
      </div>
    </AppLayout>
  );
}