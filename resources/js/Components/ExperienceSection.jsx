import React, { useEffect, useState, useRef } from 'react';
import axios from 'axios';
import { Trash } from 'lucide-react';

export default function ExperienceSection({ 
  projects = [],
  experiences: initialExperiences,
  reloadExperiences,
 }){
  const [experiences, setExperiences] = useState(initialExperiences || []);
  useEffect(() => {
    setExperiences(initialExperiences || []);
  },[initialExperiences]);
  const [expandedProjectIds, setExpandedProjectIds] = useState([]);

  const contentRefs = useRef({});

  const toggleProject = (projectId) => {
    setExpandedProjectIds(prev => 
      prev.includes(projectId)
      ? prev.filter(id => id !== projectId)
      : [...prev,projectId]
    );
  };

  const [editingExperience, setEditingExperience] = useState(null);
  const [isExperienceModalOpen, setIsExperienceModalOpen] = useState(false);
  const [experienceFormData, setFormData] = useState({
    title: '',
    company: '',
    period: '',
    description: '',
    projects: [],
  });
  useEffect(() => {
  if (isExperienceModalOpen) {
    console.log('モーダルが開きました');
    console.log('projects:', projects);
    console.log('experienceFormData.projects:', experienceFormData.projects);
  }
}, [isExperienceModalOpen]);
  const [experienceSkillIds, setExperienceSkillIds] = useState([]);

  const handleSaveExperience = async() => {
    try{
      const payload = {
        title: experienceFormData.title,
        company: experienceFormData.company,
        period: experienceFormData.period,
        description: experienceFormData.description,
        projects: experienceFormData.projects,
      };
      if(editingExperience){
        // 編集モード：PUTで更新
        await axios.put(`/api/admin/experiences/${editingExperience.id}`, payload);
      }else{
        // 新規モード：POSTで作成
        await axios.post(`/api/admin/experiences`, payload);
        await reloadExperiences();
      }

      // 再取得して状態更新
      if(typeof reloadExperiences === 'function'){
        await reloadExperiences();
      }
      setIsExperienceModalOpen(false);
      setEditingExperience(null);
    }catch(err){
      console.error('保存エラー:', err);
      alert('保存に失敗しました。');
    }
  }

  // Experience 削除
  const handleDeleteExperience = async(id) => {
    const confirmed = window.confirm('本当にこの経歴を削除しますか？');
    if(!confirmed) return;
    try{
      await axios.delete(`/api/admin/experiences/${id}`);
      const res = await axios.get('/api/experiences');
      setExperiences(res.data.data || res.data);
      alert('削除しました');
    }catch(err){
      console.error('削除失敗:', err);
      alert('削除に失敗しました');
    }
  };
 
  const isAuthenticated = !!localStorage.getItem('auth_token');

  return (
    <>
    <section className="py-20" id="experience">
      <div className="relative max-w-4xl mx-auto mb-12 px-4">
        <h2 className="text-4xl font-playfair-display text-[#D4B08C] text-center">
          Experience
        </h2>
        {isAuthenticated && (
          <button
            onClick={() => {
              setFormData({
                title: '',
                company: '',
                period: '',
                description: '',
                projects: [],
              });
              setEditingExperience(null); // 新規作成なのでnull
              setIsExperienceModalOpen(true);
            }}
            className="absolute right-0 top-1/2 transform -translate-y-1/2 bg-[#D4B08C] text-[#2A2A2A] px-4 py-2 rounded hover:bg-[#b2946f]"
          >
            New Experience
          </button>
        )}
      </div>
        <div className="space-y-12 max-w-4xl mx-auto px-4">
        {experiences.map(exp => (
          <div key={exp.id} className=" relative bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
            {isAuthenticated && (
              //編集・削除ボタン
              <div className="absolute top-7 right-4 flex gap-2">
                <button
                  onClick={() => {
                    setEditingExperience(exp);
                    setFormData({
                      title: exp.title,
                      company: exp.company,
                      period: exp.period,
                      description: exp.description,
                      projects: exp.projects?.map(p => p.id) || [],
                    });
                    setIsExperienceModalOpen(true);
                  }}
                  className="text-sm bg-[#D4B08C] text-[#2A2A2A] px-3 py-1 rounded hover:bg-[#b2946f]"
                >
                  Edit
                </button>
                <button
                  onClick={() => handleDeleteExperience(exp.id)}
                  className="text-[#FF6B6B] border border-[#FF6B6B] px-3 py-1 rounded hover:bg-[#FF6B6B] hover:text-black transition"
                >
                  <Trash className="w-4 h-4 mr-l" />
                </button>
              </div>
            )}
            <h3 className="text-2xl font-playfair-display text-[#D4B08C]">{exp.title}</h3>
            <p className="text-[#A8A8A8] italic mt-2 ml-5">{exp.company} • {exp.period}</p>
            <p className="mt-4 text-lg text-white ml-5">{exp.description}</p>

            {exp.projects && exp.projects.length > 0 && (
              <div className="mt-6">
                <h4 className="text-lg text-[#D4B08C] font-semibold mb-4 ml-5">Project during this period</h4>
                <ul className="space-y-2">
                  {exp.projects.map(project => {
                    const isOpen = expandedProjectIds.includes(project.id);
                    const latestProject = Array.isArray(projects) ? projects.find(p => p.id === project.id) || project : project;

                    return (
                      <React.Fragment key={project.id}>
                        {console.log('project:', project)}
                        <div className="mb-2 flex items-start ml-5 gap-4">
                          <span
                            onClick={() => toggleProject(project.id)}
                            className="cursor-pointer hover:text-[#D4B08C]"
                          >
                            ・{latestProject.title}
                          </span>

                          <div className="flex gap-2 flex-wrap">
                            {latestProject.skills?.length > 0 ? (
                              latestProject.skills.map(skill => (
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
                          {latestProject.description ? (
                            <p className="mb-2">{latestProject.description}</p>
                          ) : (
                            <p className="mb-2 text-gray-400">説明がありません。</p>
                          )}

                          {/* URLリンク */}
                          {latestProject.url && latestProject.url.trim() !== '' ? (
                            <a
                              href={latestProject.url}
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
                          {typeof latestProject.github_url === 'string' && latestProject.github_url.trim() !== '' ? (
                            <a
                              href={latestProject.github_url}
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
    {/* モーダル */}
    {isExperienceModalOpen && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div className="relative bg-[#1C1C1C] p-6 rounded-lg max-w-md w-full text-white border border-white shadow-2xl shadow-white/60">
          <h2 className="text-xl mb-4 text-[#D4B08C]">
            {editingExperience ? 'Editing Experience' : 'Create Experinece'}
          </h2>

          {/* フォーム */}
          {/* Title */}
          <label className="block mb-2 text-sm text-gray-300">Title</label>
          <input
            type="text"
            value={experienceFormData.title}
            onChange={e => setFormData({ ...experienceFormData, title: e.target.value })}
            className="w-full mb-4 px-3 p-2 bg-[#333] border border-[#555] rounded text-white focus:outline-none focus:ring-2 focus:ring-[#D4B08C]"
          />
          {/* Company */}
          <label className="block mb-2 text-sm text-gray-300">Company</label>
          <input
            type="text"
            value={experienceFormData.company}
            onChange={e => setFormData({ ...experienceFormData, company: e.target.value })}
            className="w-full mb-4 px-3 p-2 bg-[#333] border border-[#555] rounded text-white focus:outline-none focus:ring-2 focus:ring-[#D4B08C]"
          />
          {/* Period */}
          <label className="block mb-2 text-sm text-gray-300">Period</label>
          <input
            type="text"
            value={experienceFormData.period}
            onChange={e => setFormData({ ...experienceFormData, period: e.target.value })}
            className="w-full mb-4 px-3 p-2 bg-[#333] border border-[#555] rounded text-white focus:outline-none focus:ring-2 focus:ring-[#D4B08C]"
          />
          {/* Description */}
          <label className="block mb-2 text-sm text-gray-300">Description</label>
          <input
            type="text"
            value={experienceFormData.description}
            onChange={e => setFormData({ ...experienceFormData, description: e.target.value })}
            className="w-full mb-4 px-3 p-2 bg-[#333] border border-[#555] rounded text-white focus:outline-none focus:ring-2 focus:ring-[#D4B08C]"
          />
          {/* Select Projects */}
          <label className="block mb-2 text-sm text-gray-300 mt-4">Related Projects</label>
          <div className="max-h-40 overflow-y-auto bg-[#1C1C1C] p-2 rounded border border-[#444] space-y-1">
            {projects.map(project => {
              const isChecked = experienceFormData.projects.includes(project.id);
              return (
                <label key={project.id} className="block text-sm text-white">
                  <input
                    type="checkbox"
                    checked={isChecked}
                    onChange={e => {
                      if (e.target.checked) {
                        setFormData(prev => ({
                          ...prev,
                          projects: [...prev.projects, project.id],
                        }));
                      } else {
                        setFormData(prev => ({
                          ...prev,
                          projects: prev.projects.filter(id => id !== project.id),
                        }));
                      }
                    }}
                    className="mr-2 text-[#D4B08C]"
                  />
                  {project.title}
                </label>
              );
            })}
          </div>
          {/* Button */}
            {/* Save button */}
            <button
              onClick={handleSaveExperience}
              className="mt-5 w-full bg-[#D4B08C] text-[#2A2A2A] rounded px-4 py-2 hover:bg-[#b2946f]"
            >
              {editingExperience ? 'Save' : 'Create'}
            </button>
            {/* Close button */}
            <button
              onClick={() => setIsExperienceModalOpen(false)}
              className="absolute top-7 right-5 text-sm bg-[#D4B08C] text-[#2A2A2A] rounded px-2 py-1 hover:bg-[#b2946f]"
            >
              Close
            </button>
        </div>
      </div>
    )}
  </>
  );
}