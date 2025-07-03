// resources/js/Components/TopIntroSection.jsx
import React from 'react';

export default function TopIntroSection({ copyEmail }) {
  return (
    <section className="pt-32 pb-20 px-6 bg-[#1C1C1C]" id="about">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center text-center">
        {/* Left side - Name and Social Links */}
        <div>
          <h1 className="text-5xl md:text-7xl font-playfair-display text-[#D4B08C] mb-6">
            Yuya Inada
          </h1>
          <p className="text-xl md:text-2xl text-[#A8A8A8] font-crimson-text italic mb-8">
            Senior Software Engineer
          </p>
          <div className="space-x-8">
            <a
              href="https://instagram.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-instagram text-2xl"></i>
            </a>
            <a
              href="https://x.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-twitter text-2xl"></i>
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
        </div>

        {/* Right side - About Me */}
        <div>
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-8">
            About Me
          </h2>
          <p className="text-xl leading-relaxed text-[#A8A8A8]">
            With over 8 years of experience in software development, I
            specialize in building scalable web applications and
            microservices. I'm passionate about clean code, performance
            optimization, and creating exceptional user experiences.
          </p>
        </div>
      </div>
    </section>
  );
}