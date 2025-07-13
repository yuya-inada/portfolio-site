import React from 'react';
// import { Link } from '@inertiajs/react';

export default function SkillsSection({ skills }) {
  return (
    <section className="py-20" id="skills">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-7 text-center">
        Used skills
      </h2>
      <div className="px-1">
        <div className="grid grid-cols-3 sm:grid-cols-4 lg:grid-cols-4 lg:max-w-7xl gap-4 sm:gap-6 mx-auto max-w-7xl">
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
                {skill.name === 'Next.js' ? (
                  <img
                    src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nextjs/nextjs-original.svg"
                    alt="Next.js"
                    className="w-16 h-16 bg-[#D4B08C] rounded p-3 shadow-md"
                    style={{ filter: 'none' }}
                  />
                ) : skill.name === 'Nginx' ? (
                  <img
                    src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg"
                    alt="Nginx"
                    className="w-16 h-16 object-contain filter invert sepia saturate-100 hue-rotate-[30deg] brightness-[1.2] contrast-[1.1]"
                  />
                ) : (
                  <i className={`${skill.icon} text-5xl text-[#D4B08C]`}></i>
                )}
                <p className="mt-4 text-lg text-center">{skill.name}</p>
                {/* // 詳しく見る（リリース後に再開） */}
                {/* // <p className="text-sm text-[#aaa] mt-2">詳しく見る</p> */}
                {/* // </Link> */}

                {/* 使用プロジェクト名表示
                {skill.projects && skill.projects.length > 0 && (
                  <div className="w-full mt-4">
                    <p className="text-md text-center text-gray-400 mb-1">[ Related projects ]</p>
                    <ul className="text-sm text-gray-300 list-disc">
                      {skill.projects.map(project => (
                        <li 
                          key={project.id}
                          className="flex flex-row items-center justify-center gap-x-2 mb-1 text-center tex-left"  
                        >
                          <span className="break-words">•{project.title}</span>
                          {project.github_url && (
                            <a
                              href={project.github_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="text-[#D4B08C] hover:underline text-sm mt-1 sm:mt-0"
                            >
                              [GitHub]
                            </a>
                          )}
                        </li>
                      ))}
                    </ul>
                  </div>
                )} */}
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