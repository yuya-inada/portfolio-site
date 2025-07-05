import React, { useState, useEffect } from 'react';

export default function ProjectsSection({ projects: initialProjects, setSkills}) {
  const [projects, setProjects] = useState(initialProjects || []);
  const [editingProject, setEditingProject] = useState(null);
  const [isProjectModalOpen, setIsProjectModalOpen] = useState(false);
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    url: '',
    github_url: '',
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

  const handleSaveProject = async() => {
    try{
      if(editingProject){
        // 更新処理
        await axios.put(`/api/projects/${editingProject.id}`,{
          ...formData,
          skill_ids: selectedSkillIds,
        });
      }else{
        await axios.post(`/api/projects`, {
          ...formData,
          skill_ids: selectedSkillIds,
        });
      }
      // 共通処理：最新取得してリスト更新
      const resProject = await axios.get('/api/projects');
      setProjects(resProject.data.data || res.data);
      const resSkills = await axios.get('/api/skills/used');
      setSkills(resSkills.data);
      setIsProjectModalOpen(false);
      setEditingProject(null);
    }catch(error){
      console.error("保存失敗:", error);
      alert("保存に失敗しました。");
    }
  };
  return (
    <>
    <section className="py-20 mx-7" id="projects">
      <div className="relative max-w-6xl max-auto mb-6">
        <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-12 text-center">
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
          className="absolute right-0 top-1/2 transform -translate-y-1/2 bg-[#D4B08C] text-[#2A2A2A] rounded px-4 py-2 hover:bg-[b2946f]"
        >
          New Project
        </button>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-6xl mx-auto">
        {projects.map((project) => (
          <div
            key={project.id}
            className="bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D] transform transition-all duration-300 hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C] hover:shadow-[0_0_15px_rgba(212,176,140,0.3)]"
          >
            <div className="flex justify-between items-start">
              <h3 className="text-2xl font-playfair-display text-[#D4B08C]">
                {project.title}
              </h3>
              <button
                onClick={() => {
                  setEditingProject(project);
                  setIsProjectModalOpen(true);
                }}
                className="text-md bg-[#D4B08C] text-[#2A2A2A] rounded px-2 py-1 hover:bg-[#b2946f]"
              >
                Edit
              </button>
            </div>
            <p className="mt-4 text-lg text-white">{project.description}</p>
            {project.url && (
              <a
                href={project.url}
                target="_blank"
                rel="noreferrer"
                className="inline-block mt-4 text-[#D4B08C] hover:underline"
              >
                Visit site
              </a>
            )}
            {/* スキルアイコン表示部分 */}
            {project.skills?.length > 0 &&(
              <div className="mt-6 flex gap-3">
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
        <div className="relative bg-[#1C1C1C] p-6 rounded-lg max-w-md w-full text-white border border-white shadow-2xl shadow-white/60">
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
            className="w-full mb-4 px-3 py-2 bg-[#333] border border-[#555] rounded tex-white"
          />

          {/* Used Skills */}
          <div className="mb-4">
            <label className="block mb-2 text-sm text-gray-300">Skills</label>
            <div className="flex flex-wrap gap-2">
              {allSkills.map(skill => (
                <label
                  key={skill.id}
                  className="flex items-center space-x-2 text-sm text-white"
                >
                    <input 
                      type="checkbox"
                      style={{ accentColor: '#D4B08C' }}
                      className="text-[#D4B08C] w-4 h-4"
                      checked={selectedSkillIds.includes(skill.id)}
                      onChange={() => {
                        setSelectedSkillIds(prev => 
                          prev.includes(skill.id)
                            ? prev.filter(id => id !== skill.id)
                            : [...prev,skill.id]
                        );
                      }}
                    />
                  <span>{skill.name}</span>
                </label>
              ))}
            </div>
          </div>

          {/* Close Button */}
          <button
            onClick={() => setIsProjectModalOpen(false)}
            className="absolute top-7 right-5 text-sm bg-[#D4B08C] text-[#2A2A2A] rounded px-2 py-1 hover:bg-[#b2946f]"
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