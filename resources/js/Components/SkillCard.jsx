// resources/js/Components/SkillCard.jsx
import React from 'react';

export default function SkillCard({ iconClass, name }) {
  return (
    <div className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] text-center transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
      <i className={`${iconClass} text-3xl text-[#D4B08C]`}></i>
      <p className="mt-4 text-lg">{name}</p>
    </div>
  );
}