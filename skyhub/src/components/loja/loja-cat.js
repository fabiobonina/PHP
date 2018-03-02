Vue.component('loja-cat', {
  name: 'loja-cat',
  template: '#loja-cat',
  props: {
    data: Object
  },
  data: function () {
    return {
      errorMessage: [],
      successMessage: [],
      isLoading: false,
      categoria: [],
      ativo:''
    }
  },
  computed: {
    temMessage () {
      if(this.errorMessage.length > 0) return true
      if(this.successMessage.length > 0) return true
      return false
    },
    proprietario() {
      return store.state.proprietario;
    },
    seguimentos() {
      return store.state.seguimentos;
    },
    grupos() {
      return store.state.grupos;
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
          nick: this.data.nick,
          name: this.data.name,
          grupo: this.data.grupo,
          seguimento: this.data.seguimento,
          ativo: this.data.ativo,
          id: this.data.id
        };
        //console.log(postData);
        this.$http.post('./config/api/apiLoja.php?action=editar', postData).then(function(response) {
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
              this.$emit('close');
            }, 2000);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
      }
    },
    catDeletete: function() {
      if(this.checkForm()){
        this.isLoading = true
        var postData = {
          id: this.data.id
        };
        //console.log(postData);
        this.$http.post('./config/api/apiLoja.php?action=catDelete', postData).then(function(response) {
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
              this.$emit('close');
            }, 2000);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
      }
    },
    catStatus: function() {
      if(this.checkForm()){
        this.isLoading = true
        var postData = {
          ativo: this.ativo,
          id: this.data.id
        };
        //console.log(postData);
        this.$http.post('./config/api/apiLoja.php?action=catStatus', postData).then(function(response) {
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
              this.$emit('close');
            }, 2000);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
      }
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