<?php
return [

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'learners',
    ],

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'learners',
        ],

        'admin' => [
            'driver' => 'session',
            'provider' => 'admins',
        ],
    ],

    'providers' => [
        'learners' => [
            'driver' => 'eloquent',
            'model' => App\Models\Learner::class,
        ],

        'admins' => [
            'driver' => 'eloquent',
            'model' => App\Models\Admin::class,
        ],
    ],

    'passwords' => [
        'learners' => [
            'provider' => 'learners',
            'table' => 'password_reset_tokens',
            'expire' => 60,
            'throttle' => 60,
        ],

        'admins' => [
            'provider' => 'admins',
            'table' => 'password_reset_tokens',
            'expire' => 60,
            'throttle' => 60,
        ],
    ],

    'password_timeout' => 10800,

];
