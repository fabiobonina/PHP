<template id="organizacao">
    <div>
        <top></top>
        <v-content>
              <router-view></router-view>
        </v-content>
        <rodape></rodape>
    </div>
</template>
<?php 
//require_once 'src/system/pages/dashboard.html';
require_once 'src/organizacao/organizacao/pages/home.html';
require_once 'src/organizacao/loja/index.html';
require_once 'src/organizacao/local/index.html';


require_once 'src/organizacao/organizacao/components/organizacao-top.html';
//require_once 'src/components/loja/lojas-plus.php';
//require_once 'src/components/local/locais-plus.php';
//require_once 'src/components/os/ossPlus.php';

//require_once 'src/components/os/maps.html';
//require_once 'src/components/os/osStatusTec.html';
?>

<script>
  var Organizacao = Vue.extend({
    template: '#organizacao',
    data: function () {
      return {
  
      };
    },
    created() {

    },
    computed: {

    },
    methods: {
    }
  });

</script>