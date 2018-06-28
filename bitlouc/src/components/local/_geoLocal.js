Vue.component('local-geo', {
  name: 'local-geo',
  template: '#local-geo',
  $_veeValidate: {
    validator: 'new'
  },
  props: {
    dialog: Boolean,
    data: {}
  },
  data() {
    return {
      errorMessage: [],
      successMessage: [],
      coordenadas:'',
      isLoading: false
    };
  },
  computed: {
    temMessage () {
      if(this.errorMessage.length > 0) return true
      if(this.successMessage.length > 0) return true
      return false
    }
  },
  methods: {
    saveItem: function(){
      this.$validator.validateAll().then((result) => {
        if (result) {
      this.errorMessage = []
      if(this.formValido()){
        this.isLoading = true
        //const data = {'id': this.data.id, 'geolocalizacao': this.geolocalizacao
        //'cadastro': new Date().toJSON() }
        var geoposicao = this.coordenadas .split(",");
        var postData = {
          id: this.data.id,
          latitude: geoposicao[0],
          longitude: geoposicao[1]
        };        
        this.$http.post('./config/api/apiLocal.php?action=coordenadas', postData)
          .then(function(response) {
            //console.log(response);
            if(response.data.error){
              this.errorMessage.push(response.data.message);
              this.isLoading = false;
            } else{
              this.successMessage.push(response.data.message);
              this.isLoading = false;
              this.$store.dispatch('fetchLocais', this.$route.params._id).then(() => {
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
      }}
    });
    },
    ehVazia () {
      if(this.coordenadas.length == 0){
          this.errorMessage.push('Por favor, preencha todos os campos')
          return true
      }
      if(this.coordenadas.length < 17){
        this.errorMessage.push('Coordenadas incorretas')
        return true
      }
      return false
    },
    formValido(){
        if(this.ehVazia()){
            return false
        }
        return true
    }
  },
});