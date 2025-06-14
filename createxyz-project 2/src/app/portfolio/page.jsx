"use client";
import React from "react";

function MainComponent() {
  const [isEmailCopied, setIsEmailCopied] = useState(false);
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const copyEmail = () => {
    navigator.clipboard.writeText("john.doe@example.com");
    setIsEmailCopied(true);
    setTimeout(() => setIsEmailCopied(false), 2000);
  };

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <div className="bg-[#1C1C1C] text-[#E0E0E0] font-crimson-text">
      {/* Header */}
      <header className="fixed top-0 left-0 right-0 bg-[#2A2A2A] border-b border-[#3D3D3D] z-50">
        <div className="max-w-6xl mx-auto px-4 py-6 flex justify-between items-center">
          <a
            href="/"
            className="text-3xl font-playfair-display text-[#D4B08C] italic"
          >
            JD
          </a>

          {/* Hamburger Menu Button */}
          <button
            onClick={toggleMenu}
            className="text-[#D4B08C] focus:outline-none"
          >
            <i
              className={`fas ${isMenuOpen ? "fa-times" : "fa-bars"} text-2xl`}
            ></i>
          </button>

          {/* Navigation Menu */}
          <nav
            className={`
            fixed top-[84px] right-0 bg-[#2A2A2A] w-72 h-screen transform transition-transform duration-500 ease-in-out border-l border-[#3D3D3D]
            ${isMenuOpen ? "translate-x-0" : "translate-x-full"}
          `}
          >
            <div className="p-8 space-y-6">
              <a
                href="#about"
                className="block text-xl hover:text-[#D4B08C] transition-colors duration-300"
                onClick={toggleMenu}
              >
                About
              </a>
              <a
                href="#skills"
                className="block text-xl hover:text-[#D4B08C] transition-colors duration-300"
                onClick={toggleMenu}
              >
                Skills
              </a>
              <a
                href="#experience"
                className="block text-xl hover:text-[#D4B08C] transition-colors duration-300"
                onClick={toggleMenu}
              >
                Experience
              </a>
              <a
                href="#projects"
                className="block text-xl hover:text-[#D4B08C] transition-colors duration-300"
                onClick={toggleMenu}
              >
                Projects
              </a>
              <a
                href="#hobbies"
                className="block text-xl hover:text-[#D4B08C] transition-colors duration-300"
                onClick={toggleMenu}
              >
                Hobbies
              </a>
              <a
                href="#contact"
                className="block text-xl hover:text-[#D4B08C] transition-colors duration-300"
                onClick={toggleMenu}
              >
                Contact
              </a>
            </div>
          </nav>
        </div>
      </header>

      {/* Main Content */}
      <div className="max-w-6xl mx-auto px-4 py-8 pt-32">
        {/* Hero Section */}
        <section className="mb-20">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center text-center">
            {/* Left side - Name and Social Links */}
            <div>
              <h1 className="text-5xl md:text-7xl font-playfair-display text-[#D4B08C] mb-6">
                John Doe
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

        <section className="py-20" id="skills">
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
            Skills
          </h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fab fa-react text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">React</p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fab fa-node-js text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">Node.js</p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fab fa-python text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">Python</p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fab fa-aws text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">AWS</p>
            </div>
          </div>
        </section>

        <section className="py-20" id="experience">
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
            Experience
          </h2>
          <div className="space-y-8 max-w-4xl mx-auto">
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <h3 className="text-2xl font-playfair-display text-[#D4B08C]">
                Senior Software Engineer
              </h3>
              <p className="text-[#A8A8A8] italic mt-2">
                Tech Corp • 2020 - Present
              </p>
              <p className="mt-4 text-lg">
                Led development of microservices architecture serving millions
                of users
              </p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <h3 className="text-2xl font-playfair-display text-[#D4B08C]">
                Software Engineer
              </h3>
              <p className="text-[#A8A8A8] italic mt-2">
                Innovation Labs • 2017 - 2020
              </p>
              <p className="mt-4 text-lg">
                Developed full-stack applications using React and Node.js
              </p>
            </div>
          </div>
        </section>

        <section className="py-20" id="projects">
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
            Projects
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-6xl mx-auto">
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <h3 className="text-2xl font-playfair-display text-[#D4B08C]">
                E-commerce Platform
              </h3>
              <p className="mt-4 text-lg">
                Built a scalable e-commerce platform using React, Node.js, and
                MongoDB
              </p>
              <div className="mt-6 flex gap-3">
                <span className="px-4 py-2 bg-[#1C1C1C] text-[#D4B08C] rounded-full text-sm">
                  React
                </span>
                <span className="px-4 py-2 bg-[#1C1C1C] text-[#D4B08C] rounded-full text-sm">
                  Node.js
                </span>
              </div>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <h3 className="text-2xl font-playfair-display text-[#D4B08C]">
                AI Chat Application
              </h3>
              <p className="mt-4 text-lg">
                Developed a real-time chat application with AI integration
              </p>
              <div className="mt-6 flex gap-3">
                <span className="px-4 py-2 bg-[#1C1C1C] text-[#D4B08C] rounded-full text-sm">
                  Python
                </span>
                <span className="px-4 py-2 bg-[#1C1C1C] text-[#D4B08C] rounded-full text-sm">
                  TensorFlow
                </span>
              </div>
            </div>
          </div>
        </section>

        <section className="py-20" id="hobbies">
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
            Hobbies & Interests
          </h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fas fa-camera text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">Photography</p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fas fa-hiking text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">Hiking</p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fas fa-book text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">Reading</p>
            </div>
            <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
              <i className="fas fa-chess text-3xl text-[#D4B08C]"></i>
              <p className="mt-4 text-lg">Chess</p>
            </div>
          </div>
        </section>

        <section className="py-20" id="contact">
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
            Contact
          </h2>
          <div className="flex justify-center space-x-8">
            <a
              href="https://instagram.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-instagram text-4xl"></i>
            </a>
            <a
              href="https://x.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-twitter text-4xl"></i>
            </a>
            <a
              href="https://github.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fab fa-github text-4xl"></i>
            </a>
            <button
              onClick={copyEmail}
              className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300"
            >
              <i className="fas fa-envelope text-4xl"></i>
            </button>
          </div>
        </section>
      </div>

      {/* Footer */}
      <footer className="bg-[#2A2A2A] border-t border-[#3D3D3D] py-16">
        <div className="max-w-6xl mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-12">
            <div>
              <h3 className="text-2xl font-playfair-display text-[#D4B08C] mb-6">
                John Doe
              </h3>
              <p className="text-[#A8A8A8]">Senior Software Engineer</p>
              <p className="text-[#A8A8A8] mt-4 italic">
                Building the future, one line of code at a time.
              </p>
            </div>
            <div>
              <h3 className="text-2xl font-playfair-display text-[#D4B08C] mb-6">
                Quick Links
              </h3>
              <ul className="space-y-4">
                <li>
                  <a
                    href="#about"
                    className="hover:text-[#D4B08C] transition-colors duration-300"
                  >
                    About
                  </a>
                </li>
                <li>
                  <a
                    href="#projects"
                    className="hover:text-[#D4B08C] transition-colors duration-300"
                  >
                    Projects
                  </a>
                </li>
                <li>
                  <a
                    href="#contact"
                    className="hover:text-[#D4B08C] transition-colors duration-300"
                  >
                    Contact
                  </a>
                </li>
              </ul>
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
              <p className="mt-8 text-[#A8A8A8] italic">
                © 2025 John Doe. All rights reserved.
              </p>
            </div>
          </div>
        </div>
      </footer>

      {/* Overlay for mobile menu */}
      {isMenuOpen && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm z-40"
          onClick={toggleMenu}
        ></div>
      )}
    </div>
  );
}

export default MainComponent;