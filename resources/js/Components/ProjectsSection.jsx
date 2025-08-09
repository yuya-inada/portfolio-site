import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { Trash } from 'lucide-react';
import { useRef } from "react";
import { motion, AnimatePresence, animate } from "framer-motion";

export default function ProjectsSection(props) {
  console.log('ProjectsSection props:', props);
  const { projects: initialProjects, setSkills, onProjectsUpdated } = props;
  const [projects, setProjects] = useState(initialProjects || []);
  const [editingProject, setEditingProject] = useState(null);
  const [isProjectModalOpen, setIsProjectModalOpen] = useState(false);
  const [isDetailModal, setIsDetailModal] = useState(false);
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    url: '',
    github_url: '',
    image_urls: [''],
  });
  useEffect(() => {
    setProjects(initialProjects || []);
  }, [initialProjects]);
  
  // useStateにスキル一覧と選択中のスキルIDを追加
  const [allSkills, setAllSkills] = useState([]);
  const [selectedSkillIds, setSelectedSkillIds] = useState([]);

  // useEffect でスキル一覧を取得
  useEffect(() => {
    axios.get('/api/skills')
    .then(res => {
      console.log('allSkills', res.data);
      setAllSkills(res.data || res.data.data)
      })
    .catch(err => console.error('スキル取得失敗', err));
  }, []);

  // モーダルが開かれた時に初期値を設定
  useEffect(() => {
    if(editingProject){
      setFormData({
        title: editingProject.title || '',
        description: editingProject.description || '',
        url: editingProject.url || '',
        github_url: editingProject.github_url || '',
        image_urls: editingProject.image_urls?.length > 0 ? editingProject.image_urls : [''],
      });
      setSelectedSkillIds(editingProject.skills?.map(skill => skill.id) || []);
    }
  }, [editingProject]);

  const handleChange = (e) => {
    setFormData(prev => ({
      ...prev,
      [e.target.name]: e.target.value
    }));
  }

  const handleSaveProject = async () => {
    try {
      if (editingProject) {
        // 更新処理
        await axios.put(`/api/admin/projects/${editingProject.id}`, {
          ...formData,
          skill_ids: selectedSkillIds,
        }, {
          validateStatus: status => status >= 200 && status < 300
        });
      } else {
        // 新規作成処理
        await axios.post(`/api/admin/projects`, {
          ...formData,
          skill_ids: selectedSkillIds,
        }, {
          validateStatus: status => status >= 200 && status < 300
        });
      }
  
      // プロジェクト再取得
      const resProject = await axios.get('/api/projects');
      setProjects(resProject.data.data || resProject.data);
  
      // 使用スキル再取得（setSkillsが渡されているときだけ呼ぶ）
      const resSkills = await axios.get('/api/skills/used');
      if (typeof setSkills === 'function') {
        setSkills(resSkills.data);
      } else {
        console.warn('setSkills is not a function, skipped updating skills.');
      }
  
      // コールバックがある場合は呼ぶ
      if (typeof onProjectsUpdated === 'function') {
        await onProjectsUpdated();
      }
  
      setIsProjectModalOpen(false);
      setEditingProject(null);
    } catch (error) {
      console.error('保存失敗:', error);
      console.error('レスポンス:', error.response?.data);
      alert('保存に失敗しました。');
    }
  };

  const groupedSkills = allSkills.reduce((acc, skill) => {
    const category = skill.category || 'Uncategorized';
    if(!acc[category]) acc[category] = [];
    acc[category].push(skill);
    return acc;
  }, {});

  const [openCategories, setOpenCategories] = useState({});
  const toggleCategory = (category) => {
    setOpenCategories(prev => ({
      ...prev,
      [category]: !prev[category],
    }));
  };

  const handleDeleteProject = async(id) => {
    const confirmed = window.confirm('このプロジェクトを本当に削除しますか？');
    if(!confirmed) return;
    try{
      await axios.delete(`/api/admin/projects/${id}`);
      // 最新のプロジェクト取得
      const res = await axios.get('/api/projects');
      setProjects(res.data.data || res.data);
      // onProjectsUpdated が渡されていたら実行
      if(typeof onProjectsUpdated === 'function'){
        await onProjectsUpdated();
      }
      alert('プロジェクトを削除しました');
    }catch(err){
      console.error('削除失敗:', err);
      alert('削除に失敗しました');
    }
  };

  const isAuthenticated = !!localStorage.getItem('auth_token');

  function useIsMobile(){
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

  const [currentIndexMap, setCurrentIndexMap] = useState({});
  const imageContainerRefs = useRef({});
  const scrollToIndex = (projectId,index) => {
    const container = imageContainerRefs.current[projectId];
    if(!container) return;

    const image = container.children[index];
    if(!image) return;

    const targetScrollLeft = image.offsetLeft;

    animate(container.scrollLeft, targetScrollLeft, {
      duration: 0.5,
      ease: "easeOut",
      onUpdate(value){
        container.scrollLeft = value;
      },
      onComplete(){
        setCurrentIndexMap(prev => ({
          ...prev,
          [projectId]: index
        }));
      }
    });
  };
  const scrollNext = (projectId, maxIndex) => {
    const currentIndex = currentIndexMap[projectId] || 0;
    if(currentIndex < maxIndex){
      scrollToIndex(projectId, currentIndex + 1);
    }
  };
  const scrollPrev = (projectId) => {
    const currentIndex = currentIndexMap[projectId] || 0;
    if(currentIndex > 0){
      scrollToIndex(projectId, currentIndex - 1);
    }
  };

  useEffect(() => {
    if (isDetailModal && editingProject) {
      setCurrentIndexMap(prev => ({
        ...prev,
        [editingProject.id]: 0
      }));
    }
  }, [isDetailModal, editingProject]);
  return (
    <>
    <section className="py-20 overflow-visible" id="projects">
      <div className="max-w-6xl max-auto mb-7 px-4">
        {isAuthenticated ? (
          <div className="flex justify-between items-center flex-wrap gap-2">
            <h2 className="text-4xl font-playfair-display text-[#D4B08C] leading-none">
              Projects
            </h2>
                <button
                onClick={() => {
                  setFormData({
                    title: '',
                    description: '',
                    image_urls: [''],
                    url: '',
                    github_url: '',
                  });
                  setSelectedSkillIds([]);
                  setEditingProject(null);
                  setIsProjectModalOpen(true);
                }}
                className="bg-[#D4B08C] text-[#2A2A2A] rounded px-4 py-2 hover:bg-[b2946f] text-sm"
              >
                New Project
              </button>
          </div>
        ) : (
          <h2 className="text-4xl font-playfair-display text-[#D4B08C] text-center leading-none">
            Projects
          </h2>
        )}
      </div>
      {projects.length === 0 ? (
          <p className="w-full text-center text-gray-400 text-xl mt-10">
            プロジェクトの登録はありません。
          </p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-3xl mx-auto px-4 sm:px-6 md:px-0 overflow-x-hidden">
          {[...projects]
            .sort((a,b) => new Date(b.created_at) - new Date(a.created_at))
            .map((project) => (
            <div
              key={project.id}
              className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-[1.01] hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
            >
              <div className="flex justify-between items-start">
                <h3 className={`text-xl sm:text-2xl font-playfair-display text-[#D4B08C] ${isAuthenticated ? 'truncate max-w-[70%]' : ''}`}>
                  {project.title}
                </h3>
                {isAuthenticated && (
                  <div className="flex gap-2 sm:mt-0 sm:ml-auto sm:self-center ml-auto">
                    <button
                      onClick={() => {
                        setEditingProject(project);
                        setIsProjectModalOpen(true);
                      }}
                      className="text-sm bg-[#D4B08C] text-[#2A2A2A] px-3 py-1 rounded hover:bg-[#b2946f]"
                    >
                      Edit
                    </button>
                    <button
                      onClick={() => handleDeleteProject(project.id)}
                      className="text-[#FF6B6B] border border-[#FF6B6B] px-3 py-1 rounded hover:bg-[#FF6B6B] hover:text-black transition"
                    >
                      <Trash className="w-4 h-4 mr-1" />
                    </button>
                  </div>
                )}
              </div>
              {Array.isArray(project.image_urls) && project.image_urls.length > 0 && (                
                <div className="relative mt-4 overflow-x-auto pb-2">
                  {/* 左に矢印 */}
                  {(currentIndexMap[project.id] ?? 0) > 0 && (
                    <button
                        onClick={() => scrollPrev(project.id)}
                        className="absolute left-0 top-1/2 -translate-y-1/2 pr-2 z-10 bg-black hover:bg-gray-600 hover:border px-2 py-1 rounded"
                      >
                        <span className="text-xl">◀︎</span>
                      </button> 
                    )}
                  {/* 右に矢印 */}
                  {(currentIndexMap[project.id] ?? 0) < project.image_urls.length - 1 && (
                    <button
                      onClick={() => scrollNext(project.id, project.image_urls.length - 1)}
                      className="absolute right-0 top-1/2 -translate-y-1/2 pr-2 z-10 bg-black hover:bg-gray-600 hover:border px-2 py-1 rounded"
                    >
                      <span className="text-xl">▶︎</span>
                    </button>
                  )}
                  {/* 画像リスト */}
                  <motion.div 
                    ref={e1 => imageContainerRefs.current[project.id] = e1}
                    className="flex space-x-6 overflow-x-auto"
                    // style={{ scrollLeft: scrollX}}
                  >
                    {project.image_urls.map((url,idx) => (
                      <img
                      key={idx}
                      src={url}
                      alt={`${project.title} image ${idx + 1}`}
                      className="h-auto w-auto rounded-lg border border-[#3D3D3D] object-contain"
                    />
                    ))}
                  </motion.div>
                </div>
              )}
              {/* スキルアイコン表示部分 */}
              {project.skills?.length > 0 &&(
                <div className="mt-6 flex flex-wrap gap-3">
                    {project.skills?.map((skill) =>(
                      <span
                        key={skill.id}
                        className="px-4 py-2 bg-[#1C1C1C] text-[#D4B08C] rounded-full text-sm"
                      >
                        {skill.name}
                      </span>
                    ))}
                </div>
              )}
              {project.url &&  project.url.trim() !== '' ?(
                <a
                  href={project.url}
                  target="_blank"
                  rel="noreferrer"
                  className="block mt-4 text-[#D4B08C] hover:underline"
                >
                  ・Visit site
                </a>
              ) : (
                <p className="text-gray-500 mt-4">URLなし</p>
              )}
              {project.github_url && project.github_url.trim() !== '' ? (
                <a
                  href={project.github_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="block mt-2 text-[#D4B08C] hover:underline"
                >
                  ・Visit GitHub
                </a>
              ) : (
                <span className="block text-gray-500 block mt-2">GitHubなし</span>
              )}
              <div className="mt-4 text-lg text-white line-clamp-5">
                {(project.description?.match(/[^。]+。?/g) || []).map((sentence, index) => (
                  <p key={index}>
                    {sentence}
                  </p>
                ))}
              </div>
              {project.description.length > 100 && (
                <div className="mt-2 flex justify-center">
                  <button
                    onClick={() => {
                      setEditingProject(project);
                      setIsDetailModal(true);
                    }}
                    className="text-sm text-[#D4B08C] hover:underline mt-2"
                  >
                    詳しく見る
                  </button>
                </div>
              )}
            </div>
          ))}
        </div>
      )}
    </section>

    {/* 登録or編集　モーダル画面 */}
    {isProjectModalOpen && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div className="relative bg-[#1C1C1C] p-6 rounded-lg w-full max-w-5xl max-h-[90vh] overflow-y-auto text-white border border-white shadow-2xl shadow-white/60 mx-4 sm:mx-0 sm:max-w-lg sm:p-4 sm:rounded-md sm:text-sm">
          <h2 className="text-xl mb-4 text-[#D4B08C]">
            {editingProject ? 'Editing Project' : 'Create Project'}
            </h2>

          {/* Title */}
          <label className="block mb-2 text-base text-gray-300">Title</label>
          <input 
            type="text"
            name="title"
            value={formData.title}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* Description */}
          <label className="block mb-2 text-base text-gray-300">Description</label>
          <textarea 
            name="description"
            value={formData.description}
            onChange={handleChange}
            rows={3}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* URL */}
          <label className="block mb-2 text-base text-gray-300">Site URL</label>
          <input 
            type="url"
            name="url"
            value={formData.url}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* GitHub URL */}
          <label className="block mb-2 text-base text-gray-300">GitHub URL</label>
          <input 
            type="url"
            name="github_url"
            value={formData.github_url}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* Images URLs */}
          <label className="block mb-2 text-base text-gray-300">Image urls</label>
          {formData.image_urls.map((url, index) => (
            <div key={index} className="flex items-center gap-2 mb-2 w-full">
              <input 
                type="url"
                value={url}
                onChange={(e) => {
                  const newUrls = [...formData.image_urls];
                  newUrls[index] = e.target.value;
                  setFormData(prev => ({ ...prev, image_urls: newUrls}));
                }}
                className="w-[100%] mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
              />
              {formData.image_urls.length > 1 && (
                <button
                  onClick={() => {
                    const newUrls = formData.image_urls.filter((_, i) => i !== index);
                    setFormData(prev => ({ ...prev,image_urls: newUrls}));
                  }}
                  className="text-[#FF6B6B] mb-4 px-2 py-3 rounded border border-[#FF6B6B] hover:bg-[#FF6B6B] hover:text-black text-xs"
                  style={{ minWidth: '4rem'}}
                >
                  削除
                </button>
              )}
            </div>
          ))}
          <div className="flex justify-end mr-1">
            <button
                onClick={() => {
                  setFormData(prev => ({
                    ...prev,
                    image_urls: [...prev.image_urls, '']
                  }));
                }}
                className="text-sm bg-[#D4B08C] text-[#2A2A2A] rounded px-1 py-1 hover:bg-[#b2946f]"
              >
                + Adding images
              </button>
            </div>
          {/* Used Skills or Select Skills (Accordion view) */}
          <div className="mb-4">
            <label className="block mb-2 text-base text-gray-300">Skills</label>
            <div className="space-y-2">
            {Object.entries(groupedSkills).map(([category, skills]) => (
                <div key={category}>
                  {/* トグルボタン */}
                  <button
                    type="button"
                    onClick={() => toggleCategory(category)}
                    className="w-full flex justify-between items-center px-4 py-2 bg-[#2A2A2A] text-[#D4B08C] font-semibold"
                  >
                    <span className="text-left text-base">{category}</span>
                    <span 
                      className={`ml-auto transform transition-transform duration-300 ${openCategories[category] ? 'rotate-180' : ''}`}
                    >
                      ▼
                    </span>
                  </button>

                  {/* アコーディオン本体 */}
                  <div
                    className={`transition-all duration-700 ease-in-out overflow-hidden px-3 bg-[#1C1C1C] flex flex-wrap gap-2 ${
                      openCategories[category]
                        ? 'max-h-[500px] opacity-100 py-3'
                        : 'max-h-0 opacity-0 py-0'
                    }`}
                  >
                    {skills.map(skill => (
                      <label
                        key={skill.id}
                        className="flex items-center space-x-2 text-sm text-white"
                      >
                        <input
                          type="checkbox"
                          style={{ accentColor: '#D4B08C' }}
                          className="w-4 h-4 text-[#D4B08C]"
                          checked={selectedSkillIds.includes(skill.id)}
                          onChange={() => {
                            setSelectedSkillIds(prev =>
                              prev.includes(skill.id)
                                ? prev.filter(id => id !== skill.id)
                                : [...prev, skill.id]
                            );
                          }}
                        />
                        <span>{skill.name}</span>
                      </label>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Close Button */}
          <button
            onClick={() => setIsProjectModalOpen(false)}
            className="absolute top-5 right-5 text-sm bg-[#D4B08C] text-[#2A2A2A] rounded px-2 py-1 hover:bg-[#b2946f]"
          >
            Close
          </button>
          {/* 編集保存ボタン */}
          <button
              onClick={handleSaveProject}
              className="mt-5 w-full bg-[#D4B08C] text-[#2A2A2A] rounded px-4 py-2 hover:bg-[#b2946f]"
            >
              {editingProject ? 'Save' : 'Create'}
          </button>
        </div>
        
      </div>
    )}
    {/* プロジェクト詳細　モーダル画面 */}
    {isDetailModal && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div className="relative bg-[#1C1C1C] rounded-lg w-full max-w-3xl max-h-[90vh] overflow-y-auto text-white border border-white shacow-2xl shadow-white/60 mx-4 sm:mx-0">
          {/* ヘッダー固定（タイトル　＋　Close） */}
          <div className="sticky top-0 z-10 bg-[#1C1C1C] px-6 py-4 pb-1 mb-5 border-b border-[#3D3D3D] flex justify-between items-start">
            <h2 className="text-3xl mb-4 text-[#D4B08C] font-playfair-display">
              {editingProject?.title}
            </h2>
            <button
              onClick={() => setIsDetailModal(false)}
              className="text-sm bg-[#D4B08C] text-[#2A2A2A] rounded px-2 py-1 hover:bg-[#b2946f]"
            >
              Close
            </button>
          </div>
          {/* スクロール可能部分 */}
          <div className="overflow-y-auto px-6 pb-6">
            {/* 画像スライダー */}
            {editingProject?.image_urls?.length > 0 && (
              <div className="relative">
                {/* 左ボタン */}
                {currentIndexMap[editingProject.id] > 0 && (
                  <button
                    onClick={() => scrollPrev(editingProject.id)}
                    className="absolute left-0 top-1/2 transform -translate-y-1/2 bg-black bg-opacity-50 text-[fff] px-2 py-1 z-5 hover:bg-gray-600 hover:border"
                  >
                    ◀︎
                  </button>
                )}
                {/* 画像リスト */}
                <div 
                  ref={(e1) => imageContainerRefs.current[editingProject.id] = e1}
                  className="flex space-x-6 overflow-x-auto scroll-smooth"
                >
                  {editingProject.image_urls.map((url,idx) => (
                    <img
                    key={idx}
                    src={url}
                    alt={`${editingProject.title} image ${idx + 1}`}
                    className="h-auto w-auto rounded-lg border border-[#3D3D3D] object-contain"
                  />
                  ))}
                </div>
                {/* 右ボタン */}
                {currentIndexMap[editingProject.id] < editingProject.image_urls.length - 1 && (
                  <button
                    onClick={() => scrollNext(editingProject.id, editingProject.image_urls.length - 1)}
                    className="absolute right-0 top-1/2 transform -translate-y-1/2 bg-black bg-opacity-50 text-[fff] px-2 py-1 z-5 hover:bg-gray-600 hover:border"
                  >
                    ▶︎
                  </button>
                )}
              </div>
            )}
            <div className="mt-6 flex flex-wrap gap-3">
              {editingProject?.skills?.map((skill) => (
                <span
                  key={skill.id}
                  className="px-4 py-2 bg-[#2A2A2A] text-[#D4B08C] rounded-full text-sm"
                >
                  {skill.name}
                </span>
              ))}
            </div>
            <div className="mt-6">
              {editingProject?.url && (
                <a
                  href={editingProject.url}
                  target="_blank"
                  rel="noreferrer"
                  className="block text-[#D4B08C] hover:underline"  
                >
                  ・Visit site
                </a>
              )}
              {editingProject?.github_url && (
                <a
                  href="{editingProject.github_url}"
                  target="_blank"
                  rel="noreferrer"
                  className="block text-[#D4B08C] hover:underline mt-2"
                >
                  ・GitHub
                </a>
              )}
            </div>
            <div className="mt-4 text-white whitespace-pre-line">
              {(editingProject?.description?.match(/[^。]+。?/g) || []).map((sentence, index) => (
                <p key={index}>
                  {sentence}
                  {"\n"}
                </p>
              ))}
            </div>
          </div>
        </div>
      </div>
    )}
    </>
  );
}