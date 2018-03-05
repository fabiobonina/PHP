Vue.component('local-cat', {
  name: 'local-cat',
  template: '#local-cat',
  props: {
    data: Object
  },
  data: function () {
    return {
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
      return store.getters.getLojaId(this.$route.params._id);
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
      if(this.checkForm()){
        this.isLoading = true
        var postData = {
          categorias: this.categoria,
          loja: this.data.id
        };
        //console.log(postData);
        this.$http.post('./config/api/apiLocal.php?action=catCadastrar', postData).then(function(response) {
          console.log(response);
          if(response.data.error){
            this.errorMessage = response.data.message;
            this.isLoading = false;
          } else{
            this.successMessage.push(response.data.message);
            this.isLoading = false;
            this.$store.dispatch("fetchIndex").then(() => {
              console.log("Atualizado locais!")
            });
            setTimeout(() => {
              this.$emit('close');
            }, 2000);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
      }
    },
    catDelete: function(data) {
      if(confirm('Deseja realmente deletar ' + data.name + '?')){
        this.isLoading = true
        var postData = {
          id: data.id
        };
        //console.log(postData);
        this.$http.post('./config/api/apiLocal.php?action=catDelete', postData).then(function(response) {
          console.log(response);
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
      }
    },
    catStatus: function(data) {
      this.isLoading = true
      if(data.ativo == 0) this.ativo = '1';
      if(data.ativo == 1) this.ativo = '0';
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
      if(!this.data.name) this.errorMessage.push("Nome necessário.");
      if(!this.data.nick) this.errorMessage.push("Nome Fantasia necessário.");
      if(!this.data.grupo) this.errorMessage.push("Grupo necessário.");
      if(!this.data.seguimento) this.errorMessage.push("Seguimento necessário.");
      if(!this.errorMessage.length) return true;
      e.preventDefault();
    },
    addNewTodo: function () {
      this.categoria.push(this.item)
      this.item = {}
    }
  }
});