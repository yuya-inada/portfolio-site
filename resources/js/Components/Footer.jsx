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
                <a href="/" className="hover:text-[#D4B08C] transition-colors duration-300">
                  Top
                </a>
                <a href="/about" className="hover:text-[#D4B08C] transition-colors duration-300">
                  About Me
                </a>
                <a href="/skills" className="hover:text-[#D4B08C] transition-colors duration-300">
                  Skills
                </a>
              </div>
              {/* 2行目 */}
              <div className="flex justify-start gap-x-6">
                <a href="/experience" className="hover:text-[#D4B08C] transition-colors duration-300">
                  Experiences
                </a>
                <a href="/projects" className="hover:text-[#D4B08C] transition-colors duration-300">
                  Projects
                </a>
                <a href="/admin-login" className="hover:text-[#D4B08C] transition-colors duration-300">
                  Admin Login
                </a>
              </div>
            </div>
          </div>
          <div>
            <h3 className="text-2xl font-playfair-display text-[#D4B08C] mb-6">
              Connect
            </h3>
            <div className="flex space-x-6">
              <a
                href="https://instagram.com"
                target="_blank"
                rel="noopener noreferrer"
                className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
              >
                <i className="fab fa-instagram text-2xl"></i>
              </a>
              <a
                href="https://github.com"
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
            <p className="mt-8 text-[#A8A8A8] italic">
              © 2025 bell. All rights reserved.
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
}