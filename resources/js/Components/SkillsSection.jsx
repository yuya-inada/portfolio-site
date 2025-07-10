import React from 'react';
// import { Link } from '@inertiajs/react';

export default function SkillsSection({ skills }) {
  return (
    <section className="py-20" id="skills">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
        Used skills
      </h2>
      <div className="px-4">
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-6 mx-auto max-w-5xl">
          {Array.isArray(skills) && skills.length > 0 ? (
            skills.map(skill => (
              // <Link
              // href={`/skills/${skill.id}`}
              //   key={skill.id}
              //   className="flex flex-col items-center justify-center bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] 
              //             transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] 
              //             hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
              //   style={{ flexBasis: '200px', flexGrow: 0, flexShrink: 0 }}
              // >
              <div 
                key={skill.id}
                className="flex flex-col items-center justify-center bg-[#2A2A2A] p-6 rounded-lg border border-[#3D3D3D]"
                          // transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A]
                          // hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
              >
                <i className={`${skill.icon} text-6xl text-[#D4B08C]`}></i>
                <p className="mt-4 text-xl text-center">{skill.name}</p>
                {/* // 詳しく見る（リリース後に再開） */}
                {/* // <p className="text-sm text-[#aaa] mt-2">詳しく見る</p> */}
                {/* // </Link> */}

                {/* 使用プロジェクト名表示 */}
                {skill.projects && skill.projects.length > 0 && (
                  <div className="w-full mt-4">
                    <p className="text-md text-center text-gray-400 mb-1">[ Related projects ]</p>
                    <ul className="text-sm text-gray-300 list-disc text-left pl-10">
                      {skill.projects.map(project => (
                        <li key={project.id}>{project.title}</li>
                      ))}
                    </ul>
                  </div>
                )}
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