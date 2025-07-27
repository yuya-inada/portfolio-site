import React, { useEffect, useState, useRef } from 'react';
import axios from 'axios';
import { Trash } from 'lucide-react';
import { motion, AnimatePresence } from "framer-motion";

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

  function useIsMobile() {
    const [isMobile, setIsMobile] = useState(false);

    useEffect(() => {
      const checkMobile = () => setIsMobile(window.innerWidth < 640);
      checkMobile();
      window.addEventListener('resize', checkMobile);
      return () => window.removeEventListener('resize', checkMobile);
    }, []);
    return isMobile;
  }
  const isMobile = useIsMobile();

  const [imageIndices, setImageIndices] = useState({});
  const imageContainerRefs = useRef({});
  const [direction, setDirection] = useState('next');
  useEffect(() => {
    const initialIndices = {};
    projects.forEach(p => {
      initialIndices[p.id] =0;
    });
    setImageIndices(initialIndices);
  }, [projects]);
  const handleNext = (projectId, totalImages) => {
    setDirection('next');
    setImageIndices(prev => ({
      ...prev,
      [projectId]: (prev[projectId] + 1) % totalImages
    }));
  };
  const handlePrev = (projectId, totalImages) => {
    setDirection('prev');
    setImageIndices(prev => ({
      ...prev,
      [projectId]: (prev[projectId] - 1 + totalImages) % totalImages
    }));
  };

  return (
    <>
    <section className="py-20 mb-8" id="experience">
      <div className="max-w-4xl w-full mx-auto mb-7 px-4">
        {isAuthenticated ? (
          <div className="flex flex-wrap justify-between items-center gap-2">
            <h2 className="text-3xl font-playfair-display text-[#D4B08C] leading-none">
              Experiences
            </h2>
            <button
              onClick={() => {
                setFormData({
                  title: '',
                  company: '',
                  period: '',
                  description: '',
                  projects: [],
                });
                setEditingExperience(null);
                setIsExperienceModalOpen(true);
              }}
              className="bg-[#D4B08C] text-[#2A2A2A] px-4 py-2 rounded hover:bg-[#b2946f] text-sm self-center"
            >
              New Experience
            </button>
          </div>
        ) : (
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] text-center leading-none">
            Experiences
          </h2>
        )}
      </div>
      <div className="space-y-12 max-w-2xl mx-auto px-1">
        {experiences.length === 0 && (
          <p className="text-center text-gray-400  text-xl mt-10">
            経歴の登録はありません。
          </p>
        )}
        {[...experiences]
        .sort((a,b) => new Date(b.created_at) - new Date(a.created_at))
        .map(exp => (
          <div key={exp.id} className="bg-[#2A2A2A] p-6 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-[1.01] hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]">
            <div className="flex flex-row justify-between items-center w-full">
              <h3
                className={`text-xl sm:text-3xl font-playfair-display text-[#D4B08C] ${
                  isAuthenticated && isMobile ? 'truncate max-w-[100%-120%]' : ''
                }`}
              >
                {exp.title}
              </h3>
              {isAuthenticated && (
                //編集・削除ボタン
                <div className="flex gap-2 sm:mt-0 sm:ml-auto sm:self-center ml-auto">
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
                    <Trash className="w-4 h-4" />
                  </button>
                </div>
              )}
            </div>
            <p className="text-[#A8A8A8] italic mt-4">
              {exp.company} • {exp.period}
            </p>
            <p className="mt-4 text-lg text-white">
              {exp.description}
            </p>

            {exp.projects && exp.projects.length > 0 && (
              <div className="mt-6">
                <h4 className="text-lg text-[#D4B08C] font-semibold mb-4">Project during this period</h4>
                <ul className="space-y-2">
                  {exp.projects.map(project => {
                    const isOpen = expandedProjectIds.includes(project.id);
                    const latestProject = Array.isArray(projects) ? projects.find(p => p.id === project.id) || project : project;

                    return (
                      <React.Fragment key={project.id}>
                        {console.log('project:', project)}
                        <div className="mb-2 flex items-start gap-4">
                          <span
                            onClick={() => toggleProject(project.id)}
                            className="cursor-pointer flex items-center gap-1 text-gray-300 hover:text-[#D4B08C] hover:underline group"
                          >
                            <span className="group-hover:text-inherit">{isOpen ? '▼' : '▶︎'} {latestProject.title}</span>
                          </span>
                        </div>

                        {/* アコーディオン展開部分 */}
                        <AnimatePresence initial={false}>
                          {isOpen && (
                            <motion.div
                              key={`accordion-${latestProject.id}`}
                              initial={{ height: 0, opacity: 0 }}
                              animate={{ height: 'auto', opacity: 1 }}
                              exit={{ height: 0, opacity: 0 }}
                              transition={{ duration: 0.4, ease: 'easeInOut' }}
                              className="relative overflow-hidden bg-[#2A2A2A] mt-2 ml-0 text-sm text-white rounded-md border border-[#3D3D3D]"
                            >
                              <div className="p-4">
                                {/* 閉じるボタン */}
                                <button
                                  onClick={() => setExpandedProjectIds(prev => prev.filter(id => id !== project.id))}
                                  className="absolute top-2 right-2 px-2 py-1 text-md bg-[#D4B08C] text-[#2A2A2A] rounded hover:bg-[#b2946f]"
                                >
                                  ✕
                                </button>
                                {/* 画像の表示 */}
                                <div
                                  ref={e1 => imageContainerRefs.current[latestProject.id] = e1}
                                  className="flex space-x-4 overflow-x-auto scroll-smooth mb-4 mt-6"
                                >
                                  <div className="relative w-full flex justify-center items-center mb-4">
                                    {imageIndices[latestProject.id] > 0 && (
                                      <button
                                        onClick={() => handlePrev(latestProject.id, latestProject.image_urls.length)}
                                        className="absolute left-0 px-2 py-1 bg-gray-600 text-[fff] rounded hover:bg-black"
                                      >
                                        ◀︎
                                      </button>
                                    )}
                                    <AnimatePresence mode="wait" initial={false}>
                                      <motion.img
                                        key={imageIndices[latestProject.id] || 0}
                                        src={latestProject.image_urls[imageIndices[latestProject.id] || 0]}
                                        alt={`${latestProject.title} image`}
                                        className="h-auto w-auto rounded-lg border border-[#3D3D3D] object-contain"
                                        initial={{ opacity: 0, x: direction === 'next' ? 300 : -300 }}
                                        animate={{ opacity: 1, x: 0 }}
                                        exit={{ opacity: 0, x: direction === 'next' ? -300 : 300 }}
                                        transition={{ duration: 0.35 }}
                                      />
                                    </AnimatePresence>
                                    {imageIndices[latestProject.id] < latestProject.image_urls.length - 1 && (
                                      <button
                                        onClick={() => handleNext(latestProject.id, latestProject.image_urls.length)}
                                        className="absolute right-0 px-2 py-1 bg-gray-600 text-[fff] rounded hover:bg-black"
                                      >
                                        ▶︎
                                      </button>
                                    )}
                                  </div>
                                </div>
                                {/* スキルバッジ表示 */}
                                <div className="flex gap-2 flex-wrap mb-4 mr-5">
                                  {latestProject.skills?.length > 0 ? (
                                    latestProject.skills.map(skill => (
                                      <span key={skill.id} className="text-xs bg-[#1C1C1C] text-[#D4B08C] rounded-full px-2 py-1">
                                        {skill.name}
                                      </span>
                                    ))
                                  ) : (
                                    <span className="text-base text-gray-400 ml-3">スキル情報なし</span>
                                  )}
                                </div>
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
                                {/* 説明 */}
                                {latestProject.description ? (
                                  <p className="mb-2 mt-4 text-base">
                                    {latestProject.description.length > 150
                                      ? `${latestProject.description.slice(0, 150)}...`
                                      : latestProject.description
                                    }
                                  </p>
                                ) : (
                                  <p className="mb-2 text-gray-400">説明がありません。</p>
                                )}
                              </div>
                            </motion.div>
                          )}
                        </AnimatePresence>
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