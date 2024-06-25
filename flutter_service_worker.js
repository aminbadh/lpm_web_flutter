'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "1575b04c4f991ae71601b3d1ea2c08ce",
"assets/assets/lpm_logo.png": "cce688d2cdd18dd687e5c353845d77a5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "ccb95553b3e2476ddeb9af0c0df0cc2a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"icons/android-icon-144x144.png": "2a996b19ac5d4a67928c1610eedb2473",
"icons/android-icon-192x192.png": "f66aa3f76d40f1b39ca7da11dbd250b9",
"icons/android-icon-36x36.png": "006b21c55f1543f0faf6d9f2b3b73ca4",
"icons/android-icon-48x48.png": "46317bb65041c542a8c3eda863d16bca",
"icons/android-icon-72x72.png": "cce688d2cdd18dd687e5c353845d77a5",
"icons/android-icon-96x96.png": "ce78266705728a40b006adc9ba0a2d7d",
"icons/apple-icon-114x114.png": "367fe9b32a352c0b04a8849a75506569",
"icons/apple-icon-120x120.png": "456f51e0158d5beaa737aed39b8d43bc",
"icons/apple-icon-144x144.png": "2a996b19ac5d4a67928c1610eedb2473",
"icons/apple-icon-152x152.png": "b7c6217d91b40d1d47e810d25ebef545",
"icons/apple-icon-180x180.png": "51c2c0d40e79dbdda72e17371ace370e",
"icons/apple-icon-57x57.png": "8f8e621a049d59d1bd36700d8812572a",
"icons/apple-icon-60x60.png": "27b0604bd0216b2cdc0c5d29fa573a28",
"icons/apple-icon-72x72.png": "cce688d2cdd18dd687e5c353845d77a5",
"icons/apple-icon-76x76.png": "90b1537a7f347802d522be248241b13d",
"icons/apple-icon-precomposed.png": "2e6a0dd1717ea8a3434c9fe6f6e58136",
"icons/apple-icon.png": "2e6a0dd1717ea8a3434c9fe6f6e58136",
"icons/favicon-16x16.png": "f1dad29bf5f16231bc5b1130ca280d8a",
"icons/favicon-32x32.png": "312370eb787a1df38135eb9a45405c3c",
"icons/favicon-96x96.png": "ce78266705728a40b006adc9ba0a2d7d",
"icons/favicon.ico": "85af8feebbafcc75b9047a5831041522",
"icons/ms-icon-144x144.png": "2a996b19ac5d4a67928c1610eedb2473",
"icons/ms-icon-150x150.png": "cafbcd9f1025a35b94bd01b4a4b0e011",
"icons/ms-icon-310x310.png": "ba091866088133846647cc63dbde6c27",
"icons/ms-icon-70x70.png": "c0b46bf64749c30177930515a8887398",
"index.html": "4918673a6643dc2f6c728b4183fee166",
"/": "4918673a6643dc2f6c728b4183fee166",
"main.dart.js": "c79dc73b49225aaeefe74539a179d718",
"manifest.json": "2fb13076d67a71f2d79fb1612c2854c0",
"version.json": "44ee7099d83581bb4a53c9070d41e157"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
