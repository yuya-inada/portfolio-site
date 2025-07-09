import React from 'react';

export default function renderSkillExplanation(id){
  switch (id) {
    case 1: // HTML の場合
      return (
        <div className="space-y-6">
          <img
            src="/images/html-example.png"
            alt="HTML構造の例"
            className="rounded-lg shadow-md w-full max-w-md"
          />
          <p>
            <strong>HTML（HyperText Markup Language）</strong>は、Webページの骨組みを定義するマークアップ言語です。
            タグを使ってページ内の構造を記述します。
          </p>
          <p>
            主なタグ例：
            <ul className="list-disc ml-6 mt-2">
              <li><code>&lt;h1&gt;</code>〜<code>&lt;h6&gt;</code>：見出し</li>
              <li><code>&lt;p&gt;</code>：段落</li>
              <li><code>&lt;a&gt;</code>：リンク</li>
              <li><code>&lt;img&gt;</code>：画像</li>
            </ul>
          </p>
          <p>
            HTMLはCSSやJavaScriptと連携して、視覚的なデザインや動的な挙動を実現します。
          </p>
        </div>
      );
    case 2: // CSS の場合（例）
      return (
        <div className="space-y-6">
          <img
            src="/images/css-sample.png"
            alt="CSSの使用例"
            className="rounded-lg shadow-md w-full max-w-md"
          />
          <p>
            CSSはWebページの見た目を装飾するためのスタイルシート言語です。
            背景色、フォントサイズ、レイアウトなどを定義できます。
          </p>
        </div>
      );
    default:
    return (
      <p className="text-gray-400">このスキルの詳細説明は現在準備中です。</p>
    );
  }
}