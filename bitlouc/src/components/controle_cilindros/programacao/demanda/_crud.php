<template id="item-crud">
  <div>
      
    <div>
      <copia :data="data.cilindro.cod_barras"></copia>
      <v-menu v-if="user.nivel > 1 && user.grupo == 'P'" bottom left  @click="">
        <v-btn slot="activator" small color="blue darken-2" dark fab>
          <v-icon>mdi-information-variant</v-icon>
        </v-btn>
          <v-list>
            <v-list-tile @click="modalTec = true">
              <v-list-tile-title>
                <span class="mdi mdi-worker"></span>Tecnicos
              </v-list-tile-title>
            </v-list-tile>
            <v-list-tile v-if="user.nivel > 2 && user.grupo == 'P'" @click="modalOs = true">
              <v-list-tile-title>
                <span class="mdi mdi-wrench"></span>Amarrar OS
              </v-list-tile-title>
            </v-list-tile>
            <v-list-tile v-if="user.nivel > 2 && user.grupo == 'P'" @click="modalEdt = true">
              <v-list-tile-title>
                <span class="mdi mdi-pencil"></span>Editar
              </v-list-tile-title>
            </v-list-tile>
            <v-list-tile v-if="data.status == '0' || user.nivel > 3" @click="modalDel = true">
              <v-list-tile-title>
                <span class="mdi mdi-delete"></span>Delete
              </v-list-tile-title>
            </v-list-tile>
            <v-list-tile v-if="user.nivel > 2 && user.grupo == 'P'" @click="modalGeo = true">
              <v-list-tile-title>
                <v-icon>mdi-map-marker-plus</v-icon>Geolocalização
              </v-list-tile-title>
            </v-list-tile>
          </v-list>
        </v-menu>
    </div>

    
    <div>
      <v-speed-dial             
        direction="left"
        :open-on-hover="hover"
        transition="slide-x-reverse-transition"
        >
        <v-btn slot="activator" small color="blue darken-2" dark fab>
          <v-icon>mdi-information-variant</v-icon>
          <v-icon>close</v-icon>
        </v-btn>
        <v-btn v-on:click="modEdt = true; selecItem(item)" fab dark small color="green">
          <v-icon>edit</v-icon>
        </v-btn>
        <v-btn fab dark small color="indigo">
          <v-icon>add</v-icon>
        </v-btn>
        <v-btn v-on:click="modDel(item)" fab dark small color="red" >
          <v-icon>delete</v-icon>
        </v-btn>
      </v-speed-dial>
    </div>
    
    <div>
      <os-tec     v-if="modalTec" v-on:close="close()" v-on:atualizar="atualizar()" :dialog="modalTec" :data="data"></os-tec>
      <os-edt     v-if="modalEdt" v-on:close="close()" v-on:atualizar="atualizar()" :dialog="modalEdt" :data="data"></os-edt>
      <os-del     v-if="modalDel" v-on:close="close()" v-on:atualizar="atualizar()" :dialog="modalDel" :data="data"></os-del>
      <os-amarrac v-if="modalOs"  v-on:close="close()" v-on:atualizar="atualizar()" :dialog="modalOs"  :data="data"></os-amarrac>
      <local-geo  v-if="modalGeo" v-on:close="close()" v-on:atualizar="atualizar()" :dialog="modalGeo" :data="data.local_id"></local-geo>
    </div>
  </div>
</template>

<?php require_once 'src/components/os/_edtOs.php';?>
<?php require_once 'src/components/os/_delOs.php';?>
<?php require_once 'src/components/os/_tecOs.php';?> 
<?php require_once 'src/components/os/_amarracOs.php';?>

<script>
Vue.component('item-crud', {
  template: '#item-crud',
  props: {
    data: Object
  },
  data: function () {
    return {
      
      fab: false,
      hover: false,
      modalTec: false,
      modalEdt: false,
      modalDel: false,
      modalOs: false,
      modalGeo: false,
    }
  },
  computed: {
    user()  {
      return store.state.user;
    },
  },
  methods: {
    close(){
      this.modalGeo = false;
      this.modalTec = false;
      this.modalEdt = false;
      this.modalDel = false;
      this.modalOs  = false;
    },
    atualizar(){
      this.modalGeo = false;
      this.modalTec = false;
      this.modalEdt = false;
      this.modalDel = false;
      this.modalOs  = false;
      this.$emit('atualizar');
    }
  }
});
</script>
