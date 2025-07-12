import React, { useState } from 'react';

export default function HobbiesSection() {
  const [selectedHobby, setSelectedHobby] = useState(null);
  const hobbies = [
    { id: 1, name: 'Dogs', icon: 'fas fa-dog', 
      description: '- 歴代いっぬ紹介🐶 -',
      images: [
        {src: 'images/bell_1.jpeg', name: 'ベル(キャバリア)'},
        // {src: '', name: 'カホ(トイプードル)'},
        // {src: '', name: 'ペロ(パピヨン)'},
        // {src: '', name: 'ミキ(チワワ)'},
        // {src: '', name: 'スティッチ(M・ダックス)'},
        // {src: '', name: 'ナツ(ヨークシャーテリア)'},
        // {src: '', name: 'リロ(M・ダックス)'}
      ]
    },
    { id: 2, name: 'Reading', icon: 'fas fa-book',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 3, name: 'Movies', icon: 'fas fa-film',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 4, name: 'Sports', icon: 'fas fa-baseball-ball',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 5, name: 'Papercraft', icon: 'fas fa-scissors',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 6, name: 'Hip-hop', icon: 'fas fa-headphones',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 7, name: 'Programming', icon: 'fas fa-code',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 8, name: 'Wine', icon: 'fas fa-wine-glass',
      description: '',
      images: [
        {src: ''}
      ]
    },
    { id: 9, name: 'Weight Training', icon: 'fas fa-dumbbell',
      description: '',
      images: [
        {src: ''}
      ]
    },
  ];

  return (
    <section className="py-20" id="hobbies">
      <h2 className="text-4xl font-playfair-display text-[#D4B08C] mb-7 text-center">
        Hobbies & Interests
      </h2>
  
      {/* 趣味カード */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-6xl mx-auto px-1">
        {hobbies.map((hobby) => (
          <div key={hobby.id} className="flex flex-col items-center ...">
            <i className={`${hobby.icon} text-3xl text-[#D4B08C]`}></i>
            <p className="mt-4 text-lg text-white">{hobby.name}</p>
            <button
              className="mt-2 text-sm text-gray-400 hover:text-[#D4B08C] underline transition-colors duration-300"
              onClick={() => setSelectedHobby(hobby)}
            >
              See more
            </button>
          </div>
        ))}
      </div>
  
      {/* ✅ モーダルを外に出して、全体の最前面に固定描画 */}
      {selectedHobby && (
        <div className="fixed inset-0 bg-black bg-opacity-50 z-[9999] flex justify-center items-center">
          <div className="bg-[#2A2A2A] w-full max-w-sm mx-4 md:px-4 p-6 rounded-xl relative text-white shadow-2xl border border-[#D4B08C]">
            <button
              onClick={() => setSelectedHobby(null)}
              className="absolute top-2 right-3 text-white text-3xl hover:text-[#D4B08C] transition-colors duration-300"
            >
              ×
            </button>
            <h3 className="text-2xl mb-3 text-[#D4B08C]">{selectedHobby.name}</h3>
            <p className="mb-4 text-2xl">{selectedHobby.description}</p>
            {selectedHobby.images?.map((img, idx) => (
              <div key={idx} className="mb-3">
                <p className="text-[#D4B08C] text-xl mb-2">・{img.name}</p>
                <img
                  src={img.src}
                  alt={img.name}
                  className="rounded-md max-h-48 object-contain mx-auto"
                />
              </div>
            ))}
          </div>
        </div>
      )}
    </section>
  );
}