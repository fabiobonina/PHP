Vue.component('os-grid', {
  template: '#os-grid',
  props: {
    data: Array,
    columns: Array,
    filterKey: String
  },
  data: function () {
    return {
      sortKey: '',
      sortOrders: '',
      showModal: false,
      modalItem: {},
      geolocalizacao: '',
      selectedCategoria: 'All',
      active: 4
    }
  },
  computed: {
    filteredData: function () {
      var sortKey = this.sortKey
      var filterKey = store.state.search && store.state.search.toLowerCase()
      var order = this.sortOrders[sortKey] || 1
      var data = this.data
      if (filterKey) {
        data = data.filter(function (row) {
          return Object.keys(row).some(function (key) {
            return String(row[key]).toLowerCase().indexOf(filterKey) > -1
          })
        })
      }
      if (sortKey) {
        data = data.slice().sort(function (a, b) {
          a = a[sortKey]
          b = b[sortKey]
          return (a === b ? 0 : a > b ? 1 : -1) * order
        })
      }
      return data
    }
  },
  filters: {
    capitalize: function (str) {
      return str.charAt(0).toUpperCase() + str.slice(1)
    }
  },
  methods: {
    sortBy: function (key) {
      this.sortKey = key
      this.sortOrders[key] = this.sortOrders[key] * -1
    },
    onClose: function(){
      this.showModal = false;
    },
    selecItem: function(data){
      this.modalItem = data;
    },
    onAtualizar: function(){
      this.$store.dispatch('fetchLocais', this.$route.params._id).then(() => {
        this.showModal = false;
      });
    },
  }
});