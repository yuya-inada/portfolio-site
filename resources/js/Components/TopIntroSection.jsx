// resources/js/Components/TopIntroSection.jsx
import React from 'react';

export default function TopIntroSection({ copyEmail }) {
  const isAboutPage = window.location.pathname === ('/about');
  return (
    <section className="pt-32 pb-20 px-6 bg-[#1C1C1C]" id="about">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center text-center">
        {/* Left side - Name and Social Links */}
        <div className="text-center">
          <img 
            src="/images/profile.jpeg"
            alt="Bell chandesu"
            className="w-60 h-60 rounded-full mx-auto mb-4 object-cover shadow-[8px_8px_12px_rgba(212,176,140,0.3)]"
          />
          <h1 className="text-2xl md:text-4xl font-playfair-display text-[#D4B08C] mb-3">
            Bell chandesu
          </h1>
          <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
            Backend-oriented Full Stack Engineer
          </div>
          <p className="mb-2 text-center">Contact</p>
          <div className="space-x-8 mb-6">
            <a
              href="https://www.instagram.com/owlione_with_obell/"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-instagram text-2xl"></i>
            </a>
            <a
              href="https://github.com/yuya-inada"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-github text-2xl"></i>
            </a>
            <button
              onClick={copyEmail}
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fas fa-envelope text-2xl"></i>
            </button>
          </div>
        </div>

        {/* Right side - About Me */}
        <div>
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-8">
            About Me
          </h2>
          <div className="text-lg leading-relaxed text-[#A8A8A8]">
            <p className="mb-4">
              犬好きなバックエンド寄りのフルスタックエンジニア。
            </p>
            <p className="mb-4">
              特にPHPやLaravelを中心とした開発を得意とし、
              "保守性・拡張性・セキュリティ" を重視した設計・構築を心がけています。
            </p>
            <p className="mb-4">
              これまでにワインボトルメニューサイトや棚卸システム、
              ポートフォリオを掲載するこのサイトなどを開発しており、
              自分の理想を出発点に、誰かの課題を解決できるサービスを実現していけるよう、日々研鑽しています。
            </p>
            <p className="text-end">(P.S. 毛のある動物全般好き)</p>
          </div>
          {!isAboutPage && (
            <div className="mt-4">
            <a 
              href="/about"
              className="text-gray-400 hover:underline hover:text-[#b2946f] text-md transition-colors duration-200"  
            >
              ▶︎ See more about my interests & hobbies 
            </a>
          </div>
          )}
        </div>
      </div>
    </section>
  );
}