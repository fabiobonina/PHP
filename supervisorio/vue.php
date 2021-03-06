<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  <script src="dist/vue/vue-resource.js"></script>
  
</head>
<body>
<link rel="import" href="teste.html">
  <div id="app">
    <v-app>
      <v-content>
        <v-container>Hello world
            <app-modal></app-modal>
          <app-tooltip></app-tooltip>
        </v-container>
      </v-content>
    </v-app>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify/dist/vuetify.js"></script>
  <script>
    new Vue({ 
      el: '#app' 
      components: {
        appModal: Modal,
        appTooltip: ToolTip
      }
    })
  </script>
</body>
</html>