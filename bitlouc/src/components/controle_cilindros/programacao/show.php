<template id="programacao-show">
  <div>
    <top></top>
    <v-content>
      <local-top></local-top>
      <v-container fluid>
      </v-container>
    </v-content>
    <rodape></rodape>
  </div>
</template>
<?php require_once 'src/components/includes/top.php';?>
<?php require_once 'src/components/includes/rodape.php';?>

<?php require_once 'src/components/local/local-top.php';?>

<script>
var ProgramacaoShow = Vue.extend({
  template: '#programacao-show',
  data: function () {
    return {
      unsupportedBrowser: false,
      searchQuery: '',
      modalBemAdd: false,
      active: '1'
    };
  },
  mounted: function() {
    //this.modalBemAdd = true;
  },
  created: function() {
    this.$store.dispatch('findCilProg', this.$route.params._programacao ).then(() => {
      console.log("Buscando dados da local")
    });
    //this.$store.dispatch('fetchEquipamentoLocal', this.$route.params._local).then(() => {
      //console.log("Buscando dados do equipamento!")
    //});
  },
  computed: {
    loja()  {
      return store.getters.getLojaId(this.$route.params._loja);
    },
    //store.state.lojas // filteredItems
  }, // computed
  methods: {

  },
});
</script>