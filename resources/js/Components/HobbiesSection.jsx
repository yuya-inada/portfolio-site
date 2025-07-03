import React from 'react';

export default function HobbiesSection() {
  const hobbies = [
    { id: 1, name: 'Photography', icon: 'fas fa-camera' },
    { id: 2, name: 'Hiking', icon: 'fas fa-hiking' },
    { id: 3, name: 'Reading', icon: 'fas fa-book' },
    { id: 4, name: 'Chess', icon: 'fas fa-chess' },
  ];

  return (
    <section className="py-20" id="hobbies">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
        Hobbies & Interests
      </h2>
      <div className="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-6xl mx-auto px-6">
        {hobbies.map((hobby) => (
          <div
            key={hobby.id}
            className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
          >
            <i className={`${hobby.icon} text-3xl text-[#D4B08C]`}></i>
            <p className="mt-4 text-lg text-white">{hobby.name}</p>
          </div>
        ))}
      </div>
    </section>
  );
}