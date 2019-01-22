<template id="gerencial">
  <div>

    <top></top>
    <proprietario-top></proprietario-top>
    <v-content>
      <v-container fluid>
        <router-view></router-view>
      </v-container>
    </v-content>
    <rodape></rodape>

  </div>
</template>

<script>
  var Gerencial = Vue.extend({
    template: '#gerencial',
    data: function () {
        return {
            errorMessage: '',
            successMessage: '',
        };
    },
    created() {
    },
    computed: {
        osLojas() {
            return store.state.osLojas;
        },
    },
    methods: {
        
    }
  });

</script>

<?php require_once 'src/components/includes/top.php';?>
<?php require_once 'src/components/includes/rodape.php';?>

<?php require_once 'src/components/gerencial/proprietario-top.php';?>
<?php require_once 'src/components/loja/lojas-plus.php';?>
<?php require_once 'src/components/local/locais-plus.php';?>
<?php require_once 'src/components/os/ossPlus.php';?>


