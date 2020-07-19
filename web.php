<?php


$routeList = [
    'User' => [
      'namespace' => 'User',
      'middleware' => [],
      'prefix' => 'user',
      'routes' => [
          'main/index' => 'MainController@index',
          'main/login' => 'MainController@login'
      ]
    ],
];

$platform = app()->get('request')->get('system');
$version = app()->get('request')->get('version');
if ($platform === 'ios' && $version === 'v1.0.1') {
    $version = 'Ios_' . str_replace('.', '_', $version) . '\\';
} else {
    $version = 'Common\\';
}

array_walk($routeList, function (&$val, $key, $prefix) {
    $val = $prefix . $val;
}, $version);

Route::get('/', function () {
    return view('welcome');
});

Route::get('main/index', $routeList['main/index']);

Route::post('main/login', $routeList['main/login']);


?>