// resources/js/Layouts/AppLayout.jsx
import React from 'react';
import Header from '@/Components/Header';
import Footer from '@/Components/Footer';

export default function AppLayout({ children }) {
  return (
    <div className="flex flex-col min-h-screen bg-[#1C1C1C] text-white font-crimson-text">
      <Header />
      <main className="flex-grow max-w-6xl w-full mx-auto px-6 py-12">
        {children}
      </main>
      <Footer />
    </div>
  );
}