// resources/js/Components/ContactSection.jsx
import React from 'react';

export default function ContactSection() {
  const copyEmail = () => {
    navigator.clipboard.writeText('your.email@example.com');
    alert('メールアドレスをコピーしました！');
  };

  return (
    <section className="py-20" id="contact">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
        Contact
      </h2>
      <div className="flex justify-center space-x-8">
        <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300">
          <i className="fab fa-instagram text-4xl"></i>
        </a>
        <a href="https://x.com" target="_blank" rel="noopener noreferrer" className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300">
          <i className="fab fa-twitter text-4xl"></i>
        </a>
        <a href="https://github.com" target="_blank" rel="noopener noreferrer" className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300">
          <i className="fab fa-github text-4xl"></i>
        </a>
        <button onClick={copyEmail} className="text-[#E0E0E0] hover:text-[#D4B08C] transition-colors duration-300">
          <i className="fas fa-envelope text-4xl"></i>
        </button>
      </div>
    </section>
  );
}