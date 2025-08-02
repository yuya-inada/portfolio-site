import React, { useState, useEffect } from "react";

export default function TopIntroSection({ copyEmail }) {
  const isAboutPage = window.location.pathname === ('/about');
  const [showYuya, setShowYuya] = useState(false);

  useEffect(() => {
    const savedProfile = localStorage.getItem('profile');
    if(savedProfile === 'Yuya'){
      setShowYuya(true);
    }else{
      setShowYuya(false);
    }
  }, []);

  const toggleProfile = () => {
    const newValue = !showYuya;
    setShowYuya(newValue);
    localStorage.setItem('profile', newValue ? 'Yuya' : 'Bell');
    window.dispatchEvent(new Event('profileChanged'));
  }
  return (
    <section className="pt-14 pb-20 px-6 bg-[#1C1C1C]" id="about">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 sm:gap-12 items-center text-center">
        {/* Left side - Name and Social Links */}
        <div className="text-center">
          <div className="text-center mb-3">
          <button
            onClick={toggleProfile}
            className="px-5 py-2.5 rounded-full bg-[#2F2F2F] text-[#D4B08C] border border-[#5C5C5C] shadow-[0_2px_6px_rgba(212,176,140,0.25)] hover:bg-[#3c3c3c] hover:text-[#e0c7a6] transition-colors duration-300"
          >
              {showYuya ? 'Switch to Yuya Inada' : 'Switch to Bell'}
            </button>
          </div>
          {showYuya ? (
            <>
            <img 
              src="/images/bell_1.jpeg"
              alt="Bell chandesu"
              className="w-48 h-48 sm:w-60 sm:h-60 rounded-full mx-auto mb-4 object-cover shadow-[8px_8px_12px_rgba(212,176,140,0.3)]"
            />
            <h1 className="text-2xl md:text-4xl font-playfair-display text-[#D4B08C] mb-3">
              Bell
            </h1>
            <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
              Cavalier King Charles Spaniel
            </div>
          </>
          ) : (
            <>
            <img 
              src="/images/profile.jpeg"
              alt="Yua Inada"
              className="w-48 h-48 sm:w-60 sm:h-60 rounded-full mx-auto mb-4 object-cover shadow-[8px_8px_12px_rgba(212,176,140,0.3)]"
            />
            <h1 className="text-2xl md:text-4xl font-playfair-display text-[#D4B08C] mb-3">
              Yuya Inada
            </h1>
            <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
              Backend-oriented Full Stack Engineer
            </div>
            </>
          )}
          <p className="mb-2 text-center">Contact</p>
          <div className="flex flex-wrap justify-center gap-x-4 pag-y-4 mb-6">
            <div className="relative group inline-block">
                <a
                  href="https://www.instagram.com/owlione_with_obell/"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
                >
                  <i className="fab fa-instagram text-2xl"></i>
                </a>
              <div 
                className="absolute -top-6 left-1/2 -translate-x-1/2 bg-[#333] text-white text-md px-3 py-1 rounded shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none whitespace-nowrap z-10"
                style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5)'}}
              >
                Instagramへ
              </div>
            </div>
            <div className="relative group inline-block">
                <a
                  href="https://note.com/inashi_bel"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
                >
                  <i className="fas fa-sticky-note text-2xl"></i>
                </a>
              <div 
                className="absolute -top-6 left-1/2 -translate-x-1/2 bg-[#333] text-white text-md px-3 py-1 rounded shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none whitespace-nowrap z-10"
                style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5)'}}
              >
                note(アプリ)へ
              </div>
            </div>
            <div className="relative group inline-block">
              <a
                href="https://github.com/yuya-inada"
                target="_blank"
                rel="noopener noreferrer"
                className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
              >
                <i className="fab fa-github text-2xl"></i>
              </a>
              <div
                className="absolute -top-6 left-1/2 -translate-x-1/2 bg-[#333] text-white text-md px-3 py-1 rounded shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none whitespace-nowrap z-10"
                style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5)'}}
              >
                GitHubへ
              </div>
            </div>
            <div
              className="relative group inline-block"
            >
              <a
                href="mailto:obelu1001@gmail.com"
                className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
              >
                <i className="fas fa-envelope text-2xl"></i>
              </a>
              <div
                className="absolute -top-6 left-1/2 -translate-x-1/2 bg-[#333] text-white text-md px-3 py-1 rounded shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none whitespace-nowrap z-10"
                style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5)'}}
              >
                メールアプリを開く
              </div>
            </div>
          </div>
        </div>

        {/* Right side - About Me */}
        <div>
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-8">
            About Me
          </h2>
          {showYuya ? (
            <>
            {/* モデル：べるちゃんです */}
            <p className="mb-4 text-xl">
              キャバリア8歳女の子、ベルちゃんです🐶
            </p>
            <p className="mb-4 text-xl">
              （2016年10月1日生）
            </p>
            <p className="mb-4 text-xl">
              おっとり穏やかで、これまで一度も人を噛んだことのない心優しい子。
              でもおやつに関しては「おい、もっとくれよ！」と主張はできます。
            </p>
            <p className="mb-4 text-xl">
              「おすわり、お手、おかわり、待て」は教えてません。
            </p>
            <p className="mb-4 text-xl">
              だって、ぶちゃかわいいだけでいいんです🐶
            </p>
            </>
          ) : (
            <>
            {/* てめーのAbout Me */}
            <div className="text-xl leading-relaxed">
              <p className="mb-4">
                PHP/Laravelを中心としたWeb開発を得意とする、犬好きなバックエンド寄りのフルスタックエンジニア。
              </p>
              <p className="mb-4">
                "保守性・拡張性・セキュリティ" を重視し、責務分離や公式ドキュメントに基づいた設計で、堅牢なシステム構築を心がけています。
              </p>
              <p className="mb-4">
                ワインボトルメニューサイトや棚卸システム、
                本ポートフォリオサイトなどを開発、現在はAIを活用した個人プロジェクトにも取り組んでおり、技術の幅を広げ続けています。
              </p>
              <p className="mb-4">
                誰かの課題を解決できるサービスを実現していけるよう、日々研鑽しています。
              </p>
            </div>
            </>
          )}
          {!isAboutPage && (
            <div className="mt-4">
            <a 
              href="/about"
              className="text-gray-400 hover:underline hover:text-[#b2946f] text-md transition-colors duration-200"  
            >
              ▶︎ See more about my hobbies & interests
            </a>
          </div>
          )}
        </div>
      </div>
    </section>
  );
}