<template id="local-edt">
  <div>
    <v-dialog v-model="dialog" persistent scrollable  max-width="500px">
      <v-card>
        <v-toolbar dark color="primary">
          <v-btn icon dark @click="$emit('close')">
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-toolbar-title>{{ title }}</v-toolbar-title>
          <v-spacer></v-spacer>
          <v-toolbar-items>
            <v-btn icon flat @click.native="saveItem()">
              <v-icon>mdi-content-save</v-icon>
            </v-btn>
          </v-toolbar-items>
        </v-toolbar>
        <v-card-title>
          <span class="headline">{{ loja.nick }} - Editar Local</span>
        </v-card-title>
        <v-card-text>
          
          <v-container grid-list-md>
            <v-layout wrap>
              <v-flex xs12>
                <v-text-field
                  v-model="data.regional"
                  label="Regional"
                  :error-messages="errors.collect('regional')"
                  v-validate="''"
                  data-vv-name="regional"
                ></v-text-field>
              </v-flex>
              <v-flex xs12 sm6 md4>
                <v-select
                  :items="tipos"
                  v-model="data.tipo"
                  item-text="name"
                  item-value="id"
                  label="Tipo"
                  :error-messages="errors.collect('tipo')"
                  v-validate="'required'"
                  data-vv-name="tipo"
                  required
                ></v-select>
              </v-flex>
              <v-flex xs12 sm6 md8>
                <v-text-field
                  v-model="data.name"
                  label="Nome"
                  :error-messages="errors.collect('name')"
                  v-validate="'required'"
                  data-vv-name="name"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs12 sm6 md8>
                <v-text-field
                  v-model="data.municipio"
                  label="Municipio"
                  :error-messages="errors.collect('municipio')"
                  v-validate="'required'"
                  data-vv-name="municipio"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs12 sm6 md4>
                <v-text-field
                  v-model="data.uf"
                  label="UF"
                  :error-messages="errors.collect('uf')"
                  v-validate="'required'"
                  data-vv-name="uf"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs12>
                <v-text-field
                  v-model="coordenadas"
                  label="Coordenadas"
                  :error-messages="errors.collect('coordenadas')"
                  v-validate="''"
                  data-vv-name="coordenadas"
                ></v-text-field>
              </v-flex>
              <v-flex xs12 sm6 md2>
                <small class="subheading">Ativo?</small>
              </v-flex>
              <v-flex xs12 sm6 md10>
                <v-radio-group v-model="data.ativo" row>
                  <v-radio label="Sim" value="0" ></v-radio>
                  <v-radio label="Não" value="1"></v-radio>
                </v-radio-group>
              </v-flex>
            </v-layout>
          </v-container>
          <small>*indica campo obrigatório</small>
          <message :success="successMessage" :error="errorMessage" v-on:close="errorMessage = []; successMessage = []"></message>
          <loader :dialog="isLoading"></loader>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>
<script>
  Vue.component('local-edt', {
    name: 'local-edt',
    template: '#local-edt',
    $_veeValidate: {
      validator: 'new'
    },
    props: {
      data: Object,
      dialog: Boolean
    },
    data() {
      return {
        title: 'Editar Local',
        errorMessage: [],
        successMessage: [],
        coordenadas: this.data.latitude +','+ this.data.longitude,
        isLoading: false
      };
    },
    computed: {
      temMessage () {
        if(this.errorMessage.length > 0) return true
        if(this.successMessage.length > 0) return true
        return false
      },
      loja()  {
        return store.getters.getLojaId(this.data.loja_id);
      },
      tipos() {
        return store.state.tipos;
      },
    },
    methods: {
      saveItem: function(){
        this.$validator.validateAll().then((result) => {
          if (result) {
        this.errorMessage = []
        if(this.checkForm()){
          this.isLoading = true
          if(this.coordenadas.length < 16){
            this.coordenadas = '0.000000,0.000000'
          };
          var geoposicao = this.coordenadas .split(",");
          var postData = {
            id: this.data.id,
            loja_id: this.loja.id,
            proprietario_id: this.loja.proprietario_id,
            tipo: this.data.tipo,
            regional: this.data.regional,
            name: this.data.name,
            municipio: this.data.municipio,
            uf: this.data.uf,
            latitude: geoposicao[0],
            longitude: geoposicao[1],
            ativo: this.data.ativo
          };
          //console.log(postData);
          this.$http.post('./config/api/apiLocal.php?action=publish', postData)
            .then(function(response) {
              console.log(response);
              if(response.data.error){
                this.errorMessage.push(response.data.message);
                this.isLoading = false;
              } else{
                this.successMessage.push(response.data.message);
                this.$store.dispatch('fetchLocalLoja', this.loja.id).then(() => {
                  console.log("Atulizando dados das localidades!")
                });
                this.isLoading = false;
                setTimeout(() => {
                  this.$emit('close');
                }, 2000);  
              }
            })
            .catch(function(error) {
              console.log(error);
            });
            //this.$store.state.create(data)
        }}
      });
      },
      checkForm:function(e) {
        this.errorMessage = [];
        if(!this.data.tipo) this.errorMessage.push("Tipo necessário.");
        if(!this.data.name) this.errorMessage.push("Nome necessário.");
        if(!this.data.municipio) this.errorMessage.push("Municipio necessário.");
        if(!this.data.uf) this.errorMessage.push("Grupo necessário.");
        if(!this.errorMessage.length) return true;
        e.preventDefault();
      },
      addNewTodo: function () {
        this.categoria.push(this.item)
        this.item = {}
      }
    },
  });

</script>