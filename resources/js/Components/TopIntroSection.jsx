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
            src="/images/bell_1.jpeg"
            alt="Bell chandesu"
            className="w-60 h-60 rounded-full mx-auto mb-4 object-cover shadow-[8px_8px_12px_rgba(212,176,140,0.3)]"
          />
          <h1 className="text-2xl md:text-4xl font-playfair-display text-[#D4B08C] mb-3">
            Bell
          </h1>
          <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
            Cavalier King Charles Spaniel
          </div>
          {/* <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
            Backend-oriented Full Stack Engineer
          </div> */}
          <p className="mb-2 text-center">Contact</p>
          <div className="space-x-8 mb-6">
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
          {/* モデル：べるちゃんです */}
          <p className="mb-4 text-xl">
            キャバリア・キング・チャールズ・スパニエルの女の子、ベルちゃんです。
          </p>
          <p className="mb-4 text-xl">
            2017年10月1日生まれの8歳。
          </p>
          <p className="mb-4 text-xl">
            おっとり穏やかで、これまで一度も人を噛んだことのない優しい性格。
            でも実はちょっぴり食いしん坊で、おやつは「もうちょっと…！」と満足するまでおねだりします。
          </p>
          <p className="mb-4 text-xl">
            寝るのが大好きで、好きな場所でゴロゴロするのが至福の時間。
            お散歩も好きだけど、気分が乗らない日は「今日はいいや」とその場から動かなくなることも。
          </p>
          <p className="mb-4 text-xl">
            そんなマイペースな性格も含めて、もうたまりません🐶
          </p>
          {/* てめーのAbout Me */}
          {/* <div className="text-lg leading-relaxed text-[#A8A8A8]">
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
          </div> */}
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