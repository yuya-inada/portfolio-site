import React, { useState } from 'react';

export default function HobbiesSection() {
  const [selectedHobby, setSelectedHobby] = useState(null);
  const hobbies = [
    { id: 1, name: 'Dogs', icon: 'fas fa-dog', 
      description: '- 歴代いっぬ紹介🐶 -',
      images: [
        {src: 'images/bell_1.jpeg', name: 'ベル(キャバリア)'},
        {src: 'images/kaho.jpeg', name: 'カホ(トイプードル)'},
        {src: 'images/pero.jpeg', name: 'ペロ(パピヨン)'},
        {src: 'images/miki.jpeg', name: 'ミキ(チワワ)'},
        {src: 'images/stitch.jpeg', name: 'スティッチ(M・ダックス)'},
        {src: 'images/natsu.jpeg', name: 'ナツ(ヨークシャーテリア)'},
        {src: 'images/rilo.jpeg', name: 'リロ(M・ダックス)'}
      ]
    },
    { id: 2, name: 'Reading', icon: 'fas fa-book',
      description: [
        { text: '小説（島田荘司、コナン・ドイル、池井戸潤など）を中心に、金融・経済といった知識系の実用書も好んで拝読。', className: 'text-xl'},
        { text: '20代中盤までは「ユダヤ人大富豪の教え」や「理想は現実化する」などの自己啓発書に触れ、考え方や価値観を磨くきっかけに。', className: 'text-xl'},
        { text: 'また、少年期にはハリーポッターのようなSFや、ワンピースなどの漫画を通して物語の世界観に没入し、空想力を育む。', className: 'text-xl'}
      ]
    },
    { id: 3, name: 'Movies', icon: 'fas fa-film',
      description: [
        {text: '- マイベスト 3 -', className: 'text-2xl text-[#D4B08C]'},
        {text: '1位：インターステラー', className: 'text-xl ml-4'},
        {text: '宇宙 × 愛 × 時間の哲学', className: 'text-base ml-16'},
        {text: '2位：インセプション', className: 'text-xl ml-4'},
        {text: '夢の中の夢の中のまた夢の中。', className: 'text-base ml-16'},
        {text: '3位：ショーシャンクの空に', className: 'text-xl ml-4'},
        {text: '自由であることの実感。', className: 'text-base ml-16'},
        {text: 'SF、実話、ミステリー、アクションなど幅広く見ていますが、ホラーだけは苦手👻', className: 'text-lg'}
      ]
    },
    { id: 4, name: 'Sports', icon: 'fas fa-baseball-ball',
      description: [
        {text: '・野球', className: 'text-xl'},
        {text: '大学まで野球部所属（現在は草野球）', className: 'text-base ml-6'},
        {text: '・フットサル', className: 'text-xl'},
        {text: '社会人から友人達とラモスフィールドで。', className: 'text-base ml-6'},
        {text: '・バドミントン', className: 'text-xl'},
        {text: '両親の影響で趣味程度。', className: 'text-base ml-6'},
        {text: '・ランニング',className: 'text-xl'},
        {text: '気分転換と健康意識。', className: 'text-base ml-6'},
      ],
    },
    { id: 5, name: 'Weight Training', icon: 'fas fa-dumbbell',
      description: [
        { text: '筋トレは「自分との戦い」…という名の自己満です。', className: 'text-xl text-[#D4B08C]' },
        { text: '分割して鍛えてます💪'},
        { text: '・脚（ふくらはぎ＆太もも）＊現在怪我中', className: 'text-base ml-6' },
        { text: '・背中（広背筋など）', className: 'text-base ml-6' },
        { text: '・胸（ダンベルプレスが定番）', className: 'text-base ml-6' },
        { text: '・腕（二頭＆三頭）', className: 'text-base ml-6' },
        { text: '・肩（ショルダープレスなど）', className: 'text-base ml-6' },
        { text: '追い込んだ後のプロテインは、もちろん飽きてます。', className: 'text-base mt-4' }
      ]
    },
    { id: 6, name: 'Papercraft', icon: 'fas fa-scissors',
      description: '- ジブリ系 -',
      images: [
        {src: 'images/totoro.jpeg', name: 'トトロ’s'},
        {src: 'images/mononoke.jpeg', name: 'もののけ姫'},
        {src: 'images/ziburi_1.jpeg', name: '千と千尋の神隠し with トトロ’s'}
      ]
    },
    { id: 7, name: 'Hip-hop / Rappers', icon: 'fas fa-headphones',
      description: [
        {text: 'よく聞くRapper一覧', className: 'text-2xl mb-4 text-[#D4B08C]'},
        {text: '🇯🇵Japanease Hip-Hop', className: 'text-2xl ml-4'},
        {text: '・Basi', className: 'text-xl ml-8'},
        {text: '・Gadoro', className: 'text-xl ml-8'},
        {text: '・Zoon', className: 'text-xl ml-8'},
        {text: '・舐達磨 etc', className: 'text-xl ml-8'},
        {text: '🇺🇸US Hip-Hop', className: 'text-2xl ml-4'},
        {text: '・Eminem', className: 'text-xl ml-8'},
        {text: '・Snoop Dogg', className: 'text-xl ml-8'},
        {text: '・Dax etc', className: 'text-xl ml-8'},
      ],
    },
    { id: 8, name: 'Wine', icon: 'fas fa-wine-glass',
      description: '元々、ワインバーでバーテンダーをやっていたため、必然的にワイン好きに。',
      images: [
        {src: 'images/stack_house.jpeg', name: 'Stack House (USA)'},
        {src: 'images/montelena.jpeg', name: 'Chateau Montelena (USA)'},
        {src: 'images/puligny.jpeg', name: 'Puligny-Montrachet (FRA)'},
        {src: 'images/meursault.jpeg', name: 'Meursault Genevrieres Premier Cru (FRA)'}
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
          <div key={hobby.id} 
          className="flex flex-col items-center justify-center 
                     bg-[#2A2A2A] p-8 rounded-lg border border-[#3D3D3D]
                     text-center transition-all duration-300 
                     hover:scale-105 hover:bg-[#4A4A4A] hover:border-[#D4B08C]
                     hover:shadow-[0_0_15px_rgba(212,176,140,0.3)] cursor-pointer"
          >
            <i className={`${hobby.icon} text-3xl text-[#D4B08C]`}></i>
            <p className="mt-4 text-xl text-white">{hobby.name}</p>
            <button
              className="mt-2 text-sm text-gray-400 hover:text-[#D4B08C] underline transition-colors duration-300"
              onClick={() => setSelectedHobby(hobby)}
            >
              ▶︎ See more
            </button>
          </div>
        ))}
      </div>
  
      {/* ✅ モーダルを外に出して、全体の最前面に固定描画 */}
      {selectedHobby && (
        <div className="fixed inset-0 bg-black bg-opacity-50 z-[9999] flex justify-center items-center px-4">
          <div className="bg-[#2A2A2A] w-full max-w-sm mx-4 max-h-[90vh] overflow-y-auto md:px-4 pt-0 pb-6 px-6 rounded-xl relative text-white shadow-2xl border border-[#D4B08C]">
            
            {/* ヘッダー部分 */}
            <div className="sticky top-0 bg-[#2A2A2A] z-10 px-6 py-4 pb-1 mb-5 border-b border-[#D4B08C] flex justify-between items-start">
              <h3 className="text-2xl text-[#D4B08C] mb-3">{selectedHobby.name}</h3>
              <button
                onClick={() => setSelectedHobby(null)}
                className="text-white text-3xl hover:text-[#D4B08C] transition-colors duration-300"
              >
                ×
              </button>
            </div>

            {/* 内容部分（画像あり／なしで切り替え） */}
            {selectedHobby.images?.length > 0 && selectedHobby.images.some(img => img.src) ? (
              <>
                <p className="mb-8 text-xl text-[#D4B08C]">{selectedHobby.description}</p>
                {selectedHobby.images.map((img, idx) => (
                  <div key={idx} className="mb-10">
                    <p className="text-white text-xl mb-2">・{img.name}</p>
                    <img
                      src={img.src}
                      alt={img.name}
                      className="rounded-md h-70 w-70 object-contain mx-auto"
                    />
                  </div>
                ))}
              </>
            ) : Array.isArray(selectedHobby.description) ? (
              selectedHobby.description.map((para, idx) => (
                <p
                  key={idx}
                  // className="mb-4 text-2xl leading-relaxed text-white whitespace-pre-line"
                  className={`mb-4 ${
                    typeof para === 'object' && para.className ? para.className : 'text-white'
                  }`}
                >
                  {typeof para === 'object' ? para.text : para}
                </p>
              ))
            ) : (
              <p className="text-white text-4xl leading-relaxed">
                {selectedHobby.description}
              </p>
            )}
          </div>
        </div>
      )}
    </section>
  );
}