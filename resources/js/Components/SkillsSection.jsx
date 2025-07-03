import React from 'react';

export default function SkillsSection({ skills }) {
  return (
    <section className="py-20" id="skills">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
        Skills
      </h2>

      <div className="px-4">
        <div className="mx-auto max-w-5xl flex flex-wrap justify-start md:justify-center gap-6">
          {Array.isArray(skills) && skills.length > 0 ? (
            skills.map(skill => (
              <div
                key={skill.id}
                className="flex flex-col items-center justify-center bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] 
                          transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] 
                          hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
                style={{ flexBasis: '200px', flexGrow: 0, flexShrink: 0 }}
              >
                <i className={`${skill.icon} text-3xl text-[#D4B08C]`}></i>
                <p className="mt-4 text-lg text-center">{skill.name}</p>
              </div>
            ))
          ) : (
            <p className="text-center text-gray-400">使用スキルはまだ登録されていません。</p>
          )}
        </div>
      </div>
    </section>
  );
}