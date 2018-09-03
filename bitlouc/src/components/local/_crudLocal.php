<template id="local-crud">
  <div>
    <v-menu v-if="user.nivel > 2 && user.grupo == 'P'" bottom left  @click="">
      <v-btn slot="activator" small color="blue darken-2" dark fab>
        <v-icon>mdi-information-variant</v-icon>
      </v-btn>
      <v-list>
        <v-list-tile @click="modalGeo = true">
          <v-list-tile-title>
            <v-icon>mdi-map-marker-plus</v-icon>Geolocalização
          </v-list-tile-title>
        </v-list-tile>
        <v-list-tile @click="modalCat = true">
          <v-list-tile-title>
            <v-icon>mdi-tag</v-icon>Categoria
          </v-list-tile-title>
        </v-list-tile>
        <v-list-tile @click="modalEdt = true">
          <v-list-tile-title>
            <v-icon>mdi-pencil</v-icon>Editar
          </v-list-tile-title>
        </v-list-tile>
        <v-list-tile v-if="user.nivel > 3" @click="modalDel = true">
          <v-list-tile-title>
            <v-icon>mdi-delete</v-icon>Delete
          </v-list-tile-title>
        </v-list-tile>
      </v-list>
    </v-menu>
    <div>
      <local-geo v-if="modalGeo" v-on:close="modalGeo = false" :dialog="modalGeo" :data="data"></local-geo>
      <local-edt v-if="modalEdt" v-on:close="modalEdt = false" :dialog="modalEdt" :data="data"></local-edt>
      <local-del v-if="modalDel" v-on:close="modalDel = false" :dialog="modalDel" :data="data"></local-del>
      <local-cat v-if="modalCat" v-on:close="modalCat = false" :dialog="modalCat" :data="data"></local-cat>
    </div>
  </div>
</template>
<?php require_once 'src/components/local/_geoLocal.php';?>
<?php require_once 'src/components/local/_edtLocal.php';?>
<?php require_once 'src/components/local/_delLocal.php';?>
<?php require_once 'src/components/local/_catLocal.php';?>

<script>
Vue.component('local-crud', {
  template: '#local-crud',
  props: {
    data: Object
  },
  data: function () {
    return {
      fab: false,
      hover: false,
      modalEdt: false,
      modalDel: false,
      modalCat: false,
      modalGeo: false,
    }
  },
  computed: {
    user()  {
      return store.state.user;
    },
  },
  methods: {  
  }
});
</script>

