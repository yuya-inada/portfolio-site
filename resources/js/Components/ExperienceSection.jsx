import React, { useEffect, useState, useRef } from 'react';
import axios from 'axios';

export default function ExperienceSection() {
  const [experiences, setExperiences] = useState([]);
  const [expandedProjectIds, setExpandedProjectIds] = useState([]);
  const contentRefs = useRef({});

  const toggleProject = (projectId) => {
    setExpandedProjectIds(prev => 
      prev.includes(projectId)
      ? prev.filter(id => id !== projectId)
      : [...prev,projectId]
    );
  };

  useEffect(() => {
    axios.get('/api/experiences')
      .then(res => setExperiences(res.data.data || res.data))
      .catch(err => console.error('経験取得エラー:', err));
  }, []);

  return (
    <section className="py-20" id="experience">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">Experience</h2>
      <div className="space-y-12 max-w-4xl mx-auto px-4">
        {experiences.map(exp => (
          <div key={exp.id} className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
            <h3 className="text-2xl font-playfair-display text-[#D4B08C]">{exp.title}</h3>
            <p className="text-[#A8A8A8] italic mt-2 ml-5">{exp.company} • {exp.period}</p>
            <p className="mt-4 text-lg text-white ml-5">{exp.description}</p>

            {exp.projects && exp.projects.length > 0 && (
              <div className="mt-6">
                <h4 className="text-lg text-[#D4B08C] font-semibold mb-4 ml-5">Project during this period</h4>
                <ul className="space-y-2">
                  {exp.projects.map(project => {
                    const isOpen = expandedProjectIds.includes(project.id);

                    // 各projectにrefをセット（初回のみ）
                    if (!contentRefs.current[project.id]) {
                      contentRefs.current[project.id] = React.createRef();
                    }

                    return (
                      <React.Fragment key={project.id}>
                        {console.log('project:', project)}
                        <div className="mb-2 flex items-start ml-5 gap-4">
                          <span
                            onClick={() => toggleProject(project.id)}
                            className="cursor-pointer hover:text-[#D4B08C]"
                          >
                            ・{project.title}
                          </span>

                          <div className="flex gap-2 flex-wrap">
                            {project.skills?.length > 0 ? (
                              project.skills.map(skill => (
                                <span key={skill.id} className="text-xs bg-[#1C1C1C] text-[#D4B08C] rounded-full px-2 py-1">
                                  {skill.name}
                                </span>
                              ))
                            ) : (
                              <span className="text-xs text-gray-400 ml-3">スキル情報なし</span>
                            )}
                          </div>
                        </div>

                        {/* アコーディオン展開部分 */}
                        <div
                          ref={contentRefs.current[project.id]}
                          className={`relative transition-all duration-500 ease-in-out overflow-hidden bg-[#2A2A2A] mt-2 ml-8 text-sm text-white rounded-md border border-[#3D3D3D] ${
                            isOpen ? 'max-h-[300px] opacity-100 p-4' : 'max-h-0 opacity-0 p-0'
                          }`}
                          >
                          {/* 閉じるボタン（右上に配置） */}
                          <button
                            onClick={() => 
                              setExpandedProjectIds(prev => prev.filter(id => id !== project.id))
                            }
                            className="absolute top-2 right-2 px-2 py-1 text-md bg-[#D4B08C] text-[#2A2A2A] rounded hover:bg-[#b2946f]"
                          >
                            ✕
                          </button>
                          {/* 説明 */}
                          {project.description ? (
                            <p className="mb-2">{project.description}</p>
                          ) : (
                            <p className="mb-2 text-gray-400">説明がありません。</p>
                          )}

                          {/* URLリンク */}
                          {project.url && project.url.trim() !== '' ? (
                            <a
                              href={project.url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="text-[#D4B08C] underline mr-4 block"
                            >
                              Visit site
                            </a>
                          ) : (
                            <span className="text-gray-500 block">URLなし</span>
                          )}

                          {/* GitHubリンク */}
                          {typeof project.github_url === 'string' && project.github_url.trim() !== '' ? (
                            <a
                              href={project.github_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="text-[#D4B08C] underline block mt-1"
                            >
                              GitHub
                            </a>
                          ) : (
                            <span className="text-gray-500 block mt-1">GitHubなし</span>
                          )}
                        </div>
                      </React.Fragment>
                    );
                  })}
                </ul>
              </div>
            )}
          </div>
        ))}
      </div>
    </section>
  );
}