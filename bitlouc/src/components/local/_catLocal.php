<template id="local-cat">
  <div>
  <div>
  <v-dialog v-model="dialog" persistent scrollable max-width="500px">
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
          {{ loja.nick }} / {{ local.tipo }} {{ local.name }} 
        </v-card-title>
        <v-card-text>
          <message :success="successMessage" :error="errorMessage" v-on:close="errorMessage = []; successMessage = []"></message>
          <loader :dialog="isLoading"></loader>
          <v-form>
            <div>
              <v-chip small v-for="item in local.categoria" close @input="catDelete(item)" :key="item.id"
              :color="item.ativo =='0'? 'green' : '' " text-color="white">
                <v-avatar>
                  <v-btn flat small icon color=""
                    @click.stop="catStatus(item); item.ativo == '0'? item.ativo = '1' : item.ativo = '0' ">
                    <v-icon v-if="item.ativo == '0'" dark>label</v-icon>
                    <v-icon v-else dark>label</v-icon>
                  </v-btn>
                </v-avatar>
                <strong>{{ item.name }}</strong>
              </v-chip>
            </div>
            <v-autocomplete
              v-model="categoria"
              :items="categorias"
              box
              chips
              color="blue-grey lighten-2"
              label="Categorias"
              item-text="name"
              multiple
              :error-messages="errors.collect('categoria')"
              v-validate="'required'"
              data-vv-name="categoria"
              return-object
            >
              <template slot="selection" slot-scope="data">
                <v-chip
                  :selected="data.selected"
                  close
                  class="chip--select-multi"
                  @input="remove(data.item)"
                >
                  {{ data.item.name }}
                </v-chip>
              </template>
              <template slot="item" slot-scope="data">
                <template v-if="typeof data.item !== 'object'">
                  <v-list-tile-content v-text="data.item"></v-list-tile-content>
                </template>
                <template v-else>
                  <v-list-tile-content>
                    <v-list-tile-title v-html="data.item.name"></v-list-tile-title>
                    <v-list-tile-sub-title v-html="data.item.tag"></v-list-tile-sub-title>
                  </v-list-tile-content>
                </template>
              </template>
            </v-autocomplete>
          </v-form>
        </v-card-text>
      </v-card>
    </v-dialog>
    <div>
  </div>
</template>
<script>
  Vue.component('local-cat', {
    name: 'local-cat',
    template: '#local-cat',
    $_veeValidate: {
      validator: 'new'
    },
    props: {
      data: Object,
      dialog: Boolean
    },
    data: function () {
      return {
        title: 'Categoria(s) Local',
        errorMessage: [],
        successMessage: [],
        isLoading: false,
        categoria: [],
        ativo:'',
        item:{},
      }
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
      local()  {
        return store.getters.getLocalId(this.data.id);
      },
      categorias() {
        return store.state.categorias;
      },
    },
    methods: {
      saveItem: function() {
        this.$validator.validateAll().then((result) => {
          if (result) {
        if(this.checkForm()){
          this.isLoading = true
          var postData = {
            categoria: this.categoria,
            local_id: this.data.id
          };
          //console.log(postData);
          this.$http.post('./config/api/apiLocal.php?action=catCadastrar', postData).then(function(response) {
            //console.log(response);
            if(response.data.error){
              this.errorMessage = response.data.message;
              this.isLoading = false;
            } else{
              this.successMessage.push(response.data.message);
              this.isLoading = false;
              this.$store.dispatch('fetchLocalLoja', this.loja.id).then(() => {
                console.log("Atulizando dados das localidades!")
              });
              setTimeout(() => {
                //this.$emit('close');
              }, 2000);
            }
          })
          .catch(function(error) {
            console.log(error);
          });
        }}
      });
      },
      catDelete: function(data) {
        if(confirm('Deseja realmente deletar ' + data.name + '?')){
          this.isLoading = true
          var postData = {
            id: data.id
          };
          //console.log(postData);
          this.$http.post('./config/api/apiLocal.php?action=catDelete', postData).then(function(response) {
            //console.log(response);
            if(response.data.error){
              this.errorMessage = response.data.message;
              this.isLoading = false;
            } else{
              this.successMessage.push(response.data.message);
              this.isLoading = false;
              this.$store.dispatch('fetchLocalLoja', this.loja.id).then(() => {
                console.log("Atulizando dados das localidades!")
              });
              setTimeout(() => {
                //this.$emit('close');
              }, 2000);
            }
          })
          .catch(function(error) {
            console.log(error);
          });
        }
      },
      catStatus: function(data) {
        this.isLoading = true
        if(data.ativo == '0') this.ativo = '1';
        if(data.ativo == '1') this.ativo = '0';
        var postData = {
          ativo: this.ativo,
          id: data.id
        };
        //console.log(postData);
        this.$http.post('./config/api/apiLocal.php?action=catStatus', postData).then(function(response) {
          //console.log(response);
          if(response.data.error){
            this.errorMessage = response.data.message;
            this.isLoading = false;
          } else{
            this.successMessage.push(response.data.message);
            this.isLoading = false;
            this.$store.dispatch("fetchIndex").then(() => {
              console.log("Atualizado lojas!")
            });
            setTimeout(() => {
              //this.$emit('close');
            }, 2000);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
      },
      checkForm:function(e) {
        this.errorMessage = [];
        if(!this.categoria) this.errorMessage.push("Categoria necessário.");
        if(!this.errorMessage.length) return true;
        e.preventDefault();
      },
      addNewTodo: function () {
        this.categoria.push(this.item)
        this.item = {}
      }
    }
  });
</script>