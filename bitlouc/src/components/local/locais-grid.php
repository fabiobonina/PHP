<template id="grid-local">
  <div>
    <v-card>
      <v-card-title>
        <v-toolbar-title>Locais</v-toolbar-title>
        <v-divider class="mx-2" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-text-field  v-model="search" append-icon="search" label="Search" single-line hide-details></v-text-field>
        <v-btn v-if="user.nivel > 2 && user.grupo == 'P'"  @click="modalAdd=true" color="pink" fab small dark>
          <v-icon>add</v-icon>
        </v-btn>
      </v-card-title>
      <v-data-table :headers="headers" :items="data" :search="search">
        <template slot="items" slot-scope="props">
          <td>
            <v-list>
              <v-list-tile :to="'/loja/' +  props.item.loja + '/local/' + props.item.id" :key="props.item.id" @click="" append activator slot>
              <v-list-tile-content>
                <v-list-tile-title> {{ props.item.tipo }} {{ props.item.name }} </v-list-tile-title>
                <v-list-tile-sub-title class="text--primary">Regional: {{ props.item.regional }} </v-list-tile-sub-title>
                </v-list-tile-content>
              </v-list-tile>
            </v-list>
          </td>
          <td>{{ props.item.municipio }}/ {{ props.item.uf }}</td>
          <td>
            <v-btn icon dark large color="primary" 
              :disabled=" 0.000000 == props.item.latitude" 
              :href="'https://maps.google.com/maps?q='+ props.item.latitude + ',' + props.item.longitude" target="_blank">
              <v-icon dark>directions</v-icon>
            </v-btn>
          </td>
          <td> {{ props.item.latitude }},{{ props.item.longitude }} </td>
          <td>
            <v-chip v-for="categoria in props.item.categoria" :key="categoria.id" small  color="green" text-color="white">
              {{ categoria.tag }}
            </v-chip>
          </td>
          <td class="text-xs-right"> 
            <local-crud :data="props.item"/>
          </td>
        </template>
        <v-alert slot="no-results" :value="true" color="error" icon="warning">
          Your search for "{{ search }}" found no results.
        </v-alert>
      </v-data-table>
    </v-card>
    <div>
      <local-add v-if="modalAdd" v-on:close="modalAdd = false" :dialog="modalAdd"></local-add>
    </div>
  </div>
</template>

<?php require_once 'src/components/local/_addLocal.php';?>
<?php require_once 'src/components/local/_crudLocal.php';?>

<script>
  Vue.component('grid-local', {
    template: '#grid-local',
    props: {
      data: Array
    },
    data: function () {
      return {
        modalAdd: false,
        search: '',
        headers: [
          { text: 'Nome', align: 'left', value: 'name' },
          { text: 'Municipio/UF', value: 'municipio' },
          { text: 'Rota', sortable: false, value: 'latitude' },
          { text: 'Lat&Long', sortable: false, value: 'latitude' },
          { text: 'Categoria', sortable: false, value: 'categoria' },
          { text: 'Info', sortable: false, value: 'info' }
        ],
        configs: {
          orderBy: { name: 'Nome', state: 'name' },
          order: 'asc',
          search: ''
        },
        itens: [
          { name: 'Nome', state: 'name' },
          { name: 'Regional', state: 'regional' }
        ],
      }
    },
    computed: {
      user()  {
        return store.state.user;
      },
      filteredData() {
        const filter = this.configs.search && this.configs.search.toLowerCase(); 
        const list = _.orderBy(this.data, this.configs.orderBy.state, this.configs.order);
        if (_.isEmpty(filter)) {
          return list;
        }
        return _.filter(list, function (row) {
          return Object.keys(row).some(function (key) {
            return String(row[key]).toLowerCase().indexOf(filter) > -1
          })
        })
      }
    },
    methods: {   
    }
  });
</script>
