import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { Trash } from 'lucide-react';

export default function ProjectsSection(props) {
  console.log('ProjectsSection props:', props);
  const { projects: initialProjects, setSkills, onProjectsUpdated } = props;
  const [projects, setProjects] = useState(initialProjects || []);
  useEffect(() => {
    setProjects(initialProjects || []);
  }, [initialProjects]);
  const [editingProject, setEditingProject] = useState(null);
  const [isProjectModalOpen, setIsProjectModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    url: '',
    github_url: '',
    image_url: '',
  });

  // useStateにスキル一覧と選択中のスキルIDを追加
  const [allSkills, setAllSkills] = useState([]);
  const [selectedSkillIds, setSelectedSkillIds] = useState([]);

  // useEffect でスキル一覧を取得
  useEffect(() => {
    axios.get('/api/skills')
    .then(res => setAllSkills(res.data || res.data.data))
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
        image_url: editingProject.image_url || '',
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
                    image_url: '',
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
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-6xl mx-1 overflow-visible">
        {[...projects]
        .sort((a,b) => new Date(b.created_at) - new Date(a.created_at))
        .map((project) => (
          <div
            key={project.id}
            className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-[1.01] hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
          >
            <div className="flex justify-between items-start">
              <h3 className={`text-xl sm:text-3xl font-playfair-display text-[#D4B08C] ${isAuthenticated ? 'truncate max-w-[70%]' : ''}`}>
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
                    <Trash className="w-4 h-4 mr-l" />
                  </button>
                </div>
              )}
            </div>
            <p className="mt-4 text-lg text-white">{project.description}</p>
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
          </div>
        ))}
      </div>
    </section>

    {/* モーダル画面 */}
    {isProjectModalOpen && (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div className="relative bg-[#1C1C1C] p-6 rounded-lg w-full max-w-3xl max-h-[90vh] overflow-y-auto text-white border border-white shadow-2xl shadow-white/60 sm:max-w-lg sm:p-4 sm:rounded-md sm:text-sm">
          <h2 className="text-xl mb-4 text-[#D4B08C]">
            {editingProject ? 'Editing Project' : 'Create Project'}
            </h2>

          {/* Title */}
          <label className="block mb-2 text-sm text-gray-300">Title</label>
          <input 
            type="text"
            name="title"
            value={formData.title}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* Description */}
          <label className="block mb-2 text-sm text-gray-300">Description</label>
          <textarea 
            name="description"
            value={formData.description}
            onChange={handleChange}
            rows={3}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* URL */}
          <label className="block mb-2 text-sm text-gray-300">URL</label>
          <input 
            type="url"
            name="url"
            value={formData.url}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* GitHub URL */}
          <label className="block mb-2 text-sm text-gray-300">GitHub URL</label>
          <input 
            type="url"
            name="github_url"
            value={formData.github_url}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* Image URL */}
          <label className="block mb-2 text-sm text-gray-300">Image URL</label>
          <input 
            type="url"
            name="image_url"
            value={formData.image_url}
            onChange={handleChange}
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded text-white"
          />

          {/* Used Skills or Select Skills (Accordion view) */}
          <div className="mb-4">
            <label className="block mb-2 text-sm text-gray-300">Skills</label>
            <div className="space-y-2">
            {Object.entries(groupedSkills).map(([category, skills]) => (
                <div key={category}>
                  {/* トグルボタン */}
                  <button
                    type="button"
                    onClick={() => toggleCategory(category)}
                    className="w-1/2 flex justify-between items-center px-4 py-2 bg-[#2A2A2A] text-[#D4B08C] font-semibold"
                  >
                    <span className="text-left">{category}</span>
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
    </>
  );
}