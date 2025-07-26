<?php

return [

    'paths' => [
      'api/*', 
      'sanctum/csrf-cookie',
    ],

    'allowed_methods' => ['*'],
  
    // 完全一致で両方のドメインを許可
    'allowed_origins' => [
      'https://www.owlione.com',
      'https://owlione.com',
    ],

    // 正規表現で許可
    'allowed_origins_patterns' => [
      'https:\/\/(www\.)?owlione\.com$',
    ],

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => true,

];