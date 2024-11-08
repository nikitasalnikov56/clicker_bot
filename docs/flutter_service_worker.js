'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "70fba4fd5473d9c5381e7088edfbace0",
"assets/AssetManifest.bin.json": "3f83ca5829739b691bdd6479c2240e71",
"assets/AssetManifest.json": "5a6247a55ebafddd795f72098d37cc5a",
"assets/assets/3dmodel/character.glb": "9610d6528c0a212e0a50028a4f6a40cf",
"assets/assets/fonts/CourierPrime-Bold.ttf": "4acfa45d29d240044e0075a8e58f0862",
"assets/assets/fonts/CourierPrime-Regular.ttf": "fba4686ed1d1b4ef05ab14db78805dbe",
"assets/assets/fonts/Rajdhani-Bold.ttf": "62eb2a35acdf719d19b2598e8e5f69df",
"assets/assets/fonts/Rajdhani-Light.ttf": "e38f518cff0715ced49fb47f86c71d8a",
"assets/assets/fonts/Rajdhani-Medium.ttf": "5500ef6a4e84d3be9971dbb138c010e5",
"assets/assets/fonts/Rajdhani-Regular.ttf": "06b5e336b0842925676af9cb04dffe43",
"assets/assets/fonts/Rajdhani-SemiBold.ttf": "e0d3c6c674dff62764623979d6f67133",
"assets/assets/icons/arrow_icon.svg": "72d37a6a2a9cfcd5c94e918fab615de4",
"assets/assets/icons/basket.svg": "0b8db5ac4d944a53ac07124c49a1b0d6",
"assets/assets/icons/box.svg": "aaa16b27d69c3a315080044906d50fef",
"assets/assets/icons/card.svg": "63d42b86c84ca039f924dd38d81bc5bc",
"assets/assets/icons/map.svg": "3fb7bb878414dcb7e8e2c9271e42575d",
"assets/assets/icons/stat1.svg": "e91c1b9d270e9190492914a1c4e50b33",
"assets/assets/icons/stat2.svg": "3d4bfa48deacc97d3656e42c7311720c",
"assets/assets/icons/stat3.svg": "e640df164fce15ed782da0568d6e3f77",
"assets/assets/icons/stat4.svg": "151481f4b060cbb971cff53ab26b5ac4",
"assets/assets/icons/stat5.svg": "f0a0386d325ae21fef15bb05ee063659",
"assets/assets/icons/stat6.svg": "0cbec07f0206f1ce19f533fdc08ccc87",
"assets/assets/icons/stat7.svg": "d4bf6cf11930a49b8c34598733ff015c",
"assets/assets/icons/stat8.svg": "f72e338263398966268a4f469dbf4682",
"assets/assets/icons/stat9.svg": "092aa391a1ed0af9759fee6851d0e04e",
"assets/assets/icons/task.svg": "215e58530b7a288caf97f7cf800d4d8b",
"assets/assets/icons/user.svg": "533542f525a490fce9af8b6416aebe38",
"assets/assets/images/avatar.png": "9246e375a8bba5ba658e919e48f75810",
"assets/assets/images/bg.png": "1795df5a2e95c40d6aa119e73197d471",
"assets/assets/images/bottom_line.png": "b39fa9b1b6e9a45322b28cef55f21b6b",
"assets/assets/images/bottom_navbar_bg.png": "3a27d0f6c570df34f9ca38be58d8241e",
"assets/assets/images/buy_bg.png": "4305badc78118a14ee848063e740e44a",
"assets/assets/images/card.png": "458f28807618dec88619ebe6461b79e5",
"assets/assets/images/character.png": "a929d53826d8de2219f9b1518e27cfa6",
"assets/assets/images/code.png": "96bf937e119f9de3970c9c4090a02962",
"assets/assets/images/decor1.png": "bd29ccb04ec37d4b82ed610ea541f4c7",
"assets/assets/images/globe.png": "98cf6843bb627c2fbff2e114ff6432ae",
"assets/assets/images/gun.png": "2f8473d38efd8397af1547002d2fec6c",
"assets/assets/images/gun_bg.png": "194cc50089de7c06e3e22ac667f193ce",
"assets/assets/images/gun_border.png": "6fa8a894b22bf56fd1f74f913b9d9c73",
"assets/assets/images/gun_line.png": "b5228513cbbb52dce8ddda871112fd33",
"assets/assets/images/gun_menu.png": "e7e356ccbf9bb9560bff242ff49db679",
"assets/assets/images/key.png": "61f4e4fbb2873f3c41d39e455602f431",
"assets/assets/images/locked_card.png": "8132609819606699009bf367afd46189",
"assets/assets/images/locked_decor.png": "808980e8472fbcd718b7983a8f8d2dd7",
"assets/assets/images/locked_mask.png": "331ac0bf22f12bbf00962a368920b62b",
"assets/assets/images/menu_bg.png": "9c2ecdfdca1cf0649f5440ab486cccab",
"assets/assets/images/panel1.png": "969b85dcbbee053794464ba3ba927f89",
"assets/assets/images/panel2.png": "9fadd4a346927228305058b08e125be7",
"assets/assets/images/panel3.png": "b0079b34ae5aeaeb27384c4ff86964f3",
"assets/assets/images/panel4.png": "d3a1c154bce6d27ef8555d7cd20107e9",
"assets/assets/images/panel5.png": "5ad205004bb6059b2621d6f3480009e9",
"assets/assets/images/panel6.png": "180249e15ded2452d349ab8329f78520",
"assets/assets/images/qr.png": "bd574664a389b50be0f279ea3fb188b7",
"assets/assets/images/scene1.png": "64af813ab79e935fdb69281d8b4e3f57",
"assets/assets/images/shop_cards.png": "e4b0d0c1a82ab2e7381a6ba60e85bf9a",
"assets/assets/images/splash_loading.png": "ddf016bc19f1bda93be16d02109690da",
"assets/assets/images/tab_container.png": "13c6c195f633561cec4f2d0c4a2f9104",
"assets/assets/images/upgrade_bg.png": "db4d089a41b82444529aee20d7b6423c",
"assets/FontManifest.json": "3957d0f20dc8dbb29a1d3cb263003515",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "82773682e5cb0a1a5102d26505d195fa",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_3d_controller/assets/model_viewer.min.js": "11f3833db561a92ac9100cd43d28899b",
"assets/packages/flutter_3d_controller/assets/model_viewer_template.html": "a9989c356a88d3bb1f11c710ff2923de",
"assets/packages/model_viewer_plus/assets/model-viewer.min.js": "a9dc98f8bf360be897a0898a7395f905",
"assets/packages/model_viewer_plus/assets/template.html": "8de94ff19fee64be3edffddb412ab63c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "1fecda7eef6310ceada56fb0f22df613",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "99ef8a406d98b0ac02a1f2f1b7ee6c3d",
"/": "99ef8a406d98b0ac02a1f2f1b7ee6c3d",
"main.dart.js": "db66de4103e4c63e9110ec2f40435436",
"manifest.json": "5b8940129f0d962d63f54997156ff289",
"version.json": "9879d4f383d146eb989b41843ef4de77"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
