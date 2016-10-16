<!doctype html>
<!--
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
-->

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Polymer Starter Kit">
    <title>Polymer Starter Kit</title>

    <!-- Place favicon.ico in the `app/` directory -->

    <!-- Chrome for Android theme color -->
    <meta name="theme-color" content="#2E3AA1">

    <!-- Web Application Manifest -->
    <link rel="manifest" href="manifest.json">

    <!-- Tile color for Win8 -->
    <meta name="msapplication-TileColor" content="#3372DF">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="PSK">
    <link rel="icon" sizes="192x192" href="images/touch/chrome-touch-icon-192x192.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Polymer Starter Kit">
    <link rel="apple-touch-icon" href="images/touch/apple-touch-icon.png">

    <!-- Tile icon for Win8 (144x144) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">

    <!-- build:css styles/main.css -->
    <link rel="stylesheet" href="styles/main.css">
    <!-- endbuild-->

    <!-- build:js bower_components/webcomponentsjs/webcomponents-lite.min.js -->
    <script src="bower_components/webcomponentsjs/webcomponents-lite.js"></script>
    <!-- endbuild -->

    <!-- Because this project uses vulcanize this should be your only html import
         in this file. All other imports should go in elements.html -->
    <link rel="import" href="elements/elements.html">

    <!-- For shared styles, shared-styles.html import in elements.html -->
    <style is="custom-style" include="shared-styles"></style>
</head>

<body unresolved>
<!-- build:remove -->
<span id="browser-sync-binding"></span>
<!-- endbuild -->

<template is="dom-bind" id="app">

    <paper-drawer-panel id="paperDrawerPanel">
        <!-- Drawer Scroll Header Panel -->
        <paper-scroll-header-panel drawer fixed>

            <!-- Drawer Toolbar -->
            <paper-toolbar id="drawerToolbar">
                <span class="menu-name">Menu</span>
            </paper-toolbar>

            <!-- Drawer Content -->
            <paper-menu class="app-menu" attr-for-selected="data-route" selected="[[route]]">
                <a data-route="vienna" href="{{baseUrl}}">
                    <iron-icon icon="info-outline"></iron-icon>
                    <span>Vienna, Austria</span>
                </a>

                <a data-route="zurich" href="{{baseUrl}}zurich">
                    <iron-icon icon="info-outline"></iron-icon>
                    <span>Zurich, Switzerland</span>
                </a>

                <a data-route="sopot" href="{{baseUrl}}sopot">
                    <iron-icon icon="info-outline"></iron-icon>
                    <span>Sopot, Poland</span>
                </a>
            </paper-menu>
        </paper-scroll-header-panel>

        <!-- Main Area -->
        <paper-scroll-header-panel main id="headerPanelMain" condenses keep-condensed-header>
            <!-- Main Toolbar -->
            <paper-toolbar id="mainToolbar" class="tall">
                <paper-icon-button id="paperToggle" icon="menu" paper-drawer-toggle></paper-icon-button>

                <span class="space"></span>

                <!-- Toolbar icons -->
                <paper-icon-button icon="refresh" on-tap="refreshWeatherData"></paper-icon-button>

                <!-- Application name -->
                <div class="middle middle-container">
                    <div class="app-name">Three day weather forecast</div>
                </div>

                <!-- Application sub title -->
                <div class="bottom bottom-container">
                    <div class="bottom-title">The future of the weather for the next three days ,)</div>
                </div>
            </paper-toolbar>

            <!-- Main Content -->
            <div class="content">
                <iron-pages attr-for-selected="data-route" selected="{{route}}">
                    <section data-route="vienna" tabindex="-1">
                        <weather-forecast id="viennaWeatherForecast" city="vienna,%20at" city-name="Vienna"></weather-forecast>
                    </section>

                    <section data-route="zurich" tabindex="-1">
                        <weather-forecast id="zurichWeatherForecast" city="zurich,%20ch" city-name="Zurich"></weather-forecast>
                    </section>

                    <section data-route="sopot" tabindex="-1">
                        <weather-forecast  id="sopotWeatherForecast" city="sopot,%20pl" city-name="Sopot"></weather-forecast>
                    </section>
                </iron-pages>
            </div>
        </paper-scroll-header-panel>
    </paper-drawer-panel>

    <paper-toast id="toast">
        <span class="toast-hide-button" role="button" tabindex="0" onclick="app.$.toast.hide()">Ok</span>
    </paper-toast>

    <!-- Uncomment next block to enable Service Worker support (1/2) -->
    <!--
    <paper-toast id="caching-complete"
                 duration="6000"
                 text="Caching complete! This app will work offline.">
    </paper-toast>

    <platinum-sw-register auto-register
                          clients-claim
                          skip-waiting
                          base-uri="bower_components/platinum-sw/bootstrap"
                          on-service-worker-installed="displayInstalledToast">
      <platinum-sw-cache default-cache-strategy="fastest"
                         cache-config-file="cache-config.json">
      </platinum-sw-cache>
    </platinum-sw-register>
    -->

</template>

<!-- build:js scripts/app.js -->
<script src="scripts/app.js"></script>
<!-- endbuild-->
</body>

</html>
