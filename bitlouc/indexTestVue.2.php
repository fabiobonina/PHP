<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Vuetify</title>
    <link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32">
    <link href="indexTestVue.css" rel="stylesheet" type="text/css"-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.17.1/axios.js"></script>
    <!--script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script-->
    
  </head>
  <body>
  
    <div id="vue-map">
      <input id="autocompleteInput" type="text"placeholder="Enter a location">
      <div id="map_canvas2"></div>
      <button @click='addUluru'>Adicionar Uluru</button>
      <h2 v-if="noVisibleMarkers">Não há lojas no modo de exibição atual. Listagem de lojas em 400km RADIUS a partir de sua localização:</h2>
      <ul class="" id="results-list" v-if="currentZoom > zoomTreshold">
        <li v-for="(marker, i) in visibleMarkers">
          <strong>{{ marker.name }}</strong><br/>
          <span>é Boutique: {{ marker.boutique ? 'yes' : 'no'}}</span><br/>
          <span v-if="currentLocation">distância da sua localização: {{ Math.round(marker.distanceFromCenter / 1000) + ' km' }}<br/></span>
          <span>lat: {{ marker.position.lat() }}</span><br/>
          <span>lng: {{ marker.position.lng() }}</span>
          <button v-bind:data-id='marker.id' @click='centerMapToMarker'>show on map</button>
        </li>
      </ul>
      <h2 v-else>A sua porta de visualização contém {{ visibleMarkers.length }} lojas, se você quiser mostrar lojas específicas, por favor, amplie ou digite sua solicitação no campo de pesquisa.</h2>
    </div>
    <script src="lib/vue.js"></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlfHdTSE_d9zwwYKs5gbL01mHElMLCFgE&libraries=places,geometry"></script>
    <script src="indexTestVue2.js"></script>
  </body>
</html>