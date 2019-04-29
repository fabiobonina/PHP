<template id="demanda-list">
<div>
    <v-toolbar flat color="white">
      <v-toolbar-title>Expandable Table</v-toolbar-title>
      <v-spacer></v-spacer>
      <!--amarar-cilindro :dialog-add="expand" v-on:close="close()"></amarar-cilindro-->
    </v-toolbar>

    <template>
  <v-layout row>
    <v-flex>
      <v-card>
        <!--v-toolbar color="teal" dark>
          <v-toolbar-side-icon></v-toolbar-side-icon>
          <v-toolbar-title>Topics</v-toolbar-title>
          <v-spacer></v-spacer>
          <v-btn icon>
            <v-icon>more_vert</v-icon>
          </v-btn>
        </v-toolbar-->

        <v-list>
          <v-list-group v-for="item in data" :key="item.id" v-model="item.active" :prepend-icon="item.action" no-action>
            <template v-slot:activator>
              <v-list-tile>
                <v-list-tile-content>
                  <v-list-tile-title>{{ item.cil_tipo.name }}</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
            </template>
            <list-cilindro :data="item.items" :item="item"></list-cilindro>
          </v-list-group>
        </v-list>
      </v-card>
    </v-flex>
  </v-layout>
</template>
    <!--v-data-table
      :headers="headers"
      :items="data"
      :expand="expand"
      item-key="name"
    >
      <template v-slot:items="props">
        
      <template v-for="subItem in props.item.items">
        <tr @click="props.expanded = !props.expanded">
          <td>{{ props.item.cil_tipo.name }}</td>
          <td class="text-xs-right">{{ subItem.cilindro.numero }}</td>
          <td>{{ subItem.cilindro.fabricante }}</td>
          <td>{{ subItem.cilindro.cod_barras }}</td>
          <td class="text-xs-right">
            <copia :data="subItem.cilindro.cod_barras"></copia>
          </td>
          
        </tr>
        </template>
      </template>
      <template v-slot:expand="props">
        <v-card flat>
          <v-card-text>Peek-a-boo!</v-card-text>
        </v-card>
      </template>
    </v-data-table-->
    
  </div>
</template>

<?php require_once 'src/components/controle_cilindros/programacao/demanda/_amararCilindro.php';?>
<?php require_once 'src/components/controle_cilindros/programacao/demanda/_crud.php';?>
<script>
  var VueClipboards = window['vue-clipboards'].default;

  Vue.use(VueClipboards);

  Vue.component('demanda-list', {
    template: '#demanda-list',
    name: 'demanda-list',
    props: {
      data: {},
    },
    data: function () {
      return {
        expand: false,
        headers: [
          {
            text: 'Tipo',
            align: 'left',
            sortable: false,
            value: 'name'
          },
          { text: 'N.Serie', value: 'numero' },
          { text: 'Fabricante', value: 'fabricante' },
          { text: 'Cod_Barras', value: 'cod_barras' },
          { text: 'Info', value: 'info' },
        ],
      }
    },
    computed: {
      filteredHeroes: function () {
        var sortKey = this.sortKey
        var filterKey = this.filterKey && this.filterKey.toLowerCase()
        var order = this.sortOrders[sortKey] || 1
        var heroes = this.heroes
        if (filterKey) {
          heroes = heroes.filter(function (row) {
            return Object.keys(row).some(function (key) {
              return String(row[key]).toLowerCase().indexOf(filterKey) > -1
            })
          })
        }
        if (sortKey) {
          heroes = heroes.slice().sort(function (a, b) {
            a = a[sortKey]
            b = b[sortKey]
            return (a === b ? 0 : a > b ? 1 : -1) * order
          })
        }
        return heroes
      },
    },
    filters: {
      capitalize: function (str) {
        return str.charAt(0).toUpperCase() + str.slice(1)
      },
    },
    methods: {
      handleSuccess(e) {
        console.log('success!', e.text);
      },
      sortBy: function (key) {
        this.sortKey = key
        this.sortOrders[key] = this.sortOrders[key] * -1
      },
    },
  })

</script>


