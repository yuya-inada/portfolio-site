// resources/js/Components/Footer.jsx
import React from 'react';
function copyEmail(){
  navigator.clipboard.writeText('youremail@exsample.com')
  .then(() => {
    alert('Copyed mailaddress !!');
  })
  .catch((err) => {
    console.error('コピーに失敗しました', err);
  });
}

export default function Footer() {
  const isAuthenticated = !!localStorage.getItem('auth_token');
  return (
    // <footer className="bg-[#2A2A2A] border-t border-[#3D3D3D] py-16 text-center">
    //   <p>&copy; 2025 Yuya Inada. All rights reserved.</p>
    // </footer>
    <footer className="bg-[#2A2A2A] border-t border-[#3D3D3D] py-6">
      <div className="max-w-6xl mx-auto px-6">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-12">
          <div>
            <h3 className="text-2xl font-playfair-display text-[#D4B08C] mb-6">
              Bell
            </h3>
            <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
              Cavalier King Charles Spaniel
            </div>
            {/* <div className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-4">
              Backend-oriented Full Stack Engineer
            </div> */}
            <p className="text-[#A8A8A8] mt-4 italic">
              Building the future, one line of code at a time.
            </p>
          </div>
          <div>
            <h3 className="text-2xl font-playfair-display text-[#D4B08C] mb-6">
              Quick Links
            </h3>
            <div className="text-md text-[#A8A8A8] space-y-3 text-center">
              {/* 1行目 */}
              <div className="flex justify-start gap-x-6">
                <a href="/" className="hover:text-[#D4B08C] transition-colors duration-300 hover:underline">
                  Top
                </a>
                <a href="/about" className="hover:text-[#D4B08C] transition-colors duration-300 hover:underline">
                  About Me
                </a>
                <a href="/skills" className="hover:text-[#D4B08C] transition-colors duration-300 hover:underline">
                  Skills
                </a>
              </div>
              {/* 2行目 */}
              <div className="flex justify-start gap-x-6">
                <a href="/experiences" className="hover:text-[#D4B08C] transition-colors duration-300 hover:underline">
                  Experiences
                </a>
                <a href="/projects" className="hover:text-[#D4B08C] transition-colors duration-300 hover:underline">
                  Projects
                </a>
                {isAuthenticated ? (
                  <button
                    onClick={() => {
                      localStorage.removeItem('auth_token');
                      window.location.reload();
                    }}
                    className="text-red-400 hover:text-red-500 underline"
                  >
                    Logout
                  </button>
                ) : (
                  <a href="/admin-login" className="hover:text-[#D4B08C] transition-colors duration-300">
                    Admin Login
                  </a>
                )}
              </div>
            </div>
          </div>
          <div>
            <h3 className="text-2xl font-playfair-display text-[#D4B08C] mb-6">
              Connect
            </h3>
            <div className="flex space-x-6">
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
                  style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5'}}
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
                  style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5'}}
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
                  style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5'}}
                >
                  GitHubへ
                </div>
              </div>
              <div className="relative group inline-block">
                <a
                  href="mailto:obelu1001@gmail.com"
                  className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
                >
                  <i className="fas fa-envelope text-2xl"></i>
                </a>
                <div
                  className="absolute -top-6 left-1/2 -tanslate-x-1/2 bg-[#333] text-white text-md px-3 py-1 rounded shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none whitespace-nowrap z-10"
                  style={{boxShadow: '1px 1px 1px rgba(212, 176, 140, 0.5'}}
                >
                  メールアプリを開く
                </div>
              </div>
            </div>
            <p className="mt-8 text-[#A8A8A8] italic">
              © 2025 bell. All rights reserved.
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
}