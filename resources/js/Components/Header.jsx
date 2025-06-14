import React, { useState } from 'react';
import { Menu, X } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Link, usePage } from '@inertiajs/react'; // <- Inertia.js 用

export default function Header() {
  const [menuOpen, setMenuOpen] = useState(false);
  const toggleMenu = () => setMenuOpen(!menuOpen);
  const closeMenu = () => setMenuOpen(false);

  return (
    <header className="bg-gray-800 text-white shadow relative z-50">
      <div className="container mx-auto flex justify-between items-center py-4 px-6">
        <h1 className="text-xl font-bold">My Portfolio</h1>

        {/* モバイル用メニューアイコン */}
        <button onClick={toggleMenu} className="lg:hidden z-50">
          {menuOpen ? <X size={28} /> : <Menu size={28} />}
        </button>

        {/* PCナビゲーション */}
        <nav className="hidden lg:flex space-x-4">
          <NavLinks />
        </nav>
      </div>

      {/* モバイル用スライドメニュー */}
      <AnimatePresence>
        {menuOpen && (
          <>
            {/* オーバーレイ */}
            <motion.div
              className="fixed inset-0 bg-black bg-opacity-50 z-40"
              onClick={closeMenu}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
            />

            {/* 右からスライドするパネル */}
            <motion.div
              className="fixed top-0 right-0 h-full w-2/3 sm:w-1/3 bg-gray-900 text-white p-6 z-50"
              initial={{ x: '100%' }}
              animate={{ x: 0 }}
              exit={{ x: '100%' }}
              transition={{ type: 'tween', duration: 0.3 }}
            >
              <button onClick={closeMenu} className="mb-6">
                <X size={24} />
              </button>
              <nav className="flex flex-col space-y-4">
                <NavLinks onClick={closeMenu} />
              </nav>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </header>
  );
}

// メニューリンク：現在ページなら下線強調
function NavLinks({ onClick = () => {} }) {
  const { url } = usePage(); // <- Insertia で現在パスを取得

  const links = [
    { label: 'About', href: '/' },
    { label: 'Skills', href: '/skills' },
    { label: 'Experience', href: '/experience' },
    { label: 'Projects', href: '/projects' },
    { label: 'Hobbies', href: '/hobbies' },
    { label: 'Contact', href: '/contact' },
  ];

  return (
    <>
      {links.map(({ label, href }) => (
        <Link
          key={href}
          href={href}
          onClick={onClick}
          className={`hover:underline ${
            url === href ? 'underline font-bold text-blue-300' : ''
          }`}
        >
          {label}
        </Link>
      ))}
    </>
  );
}