<template id="os-edt">
  <div>
    <v-dialog v-model="dialog" persistent scrollable  max-width="500px">
      <v-card>
        <v-card-title>
          <span class="headline">{{ data.local.tipo }} - {{ data.local.name }} - Editar OS</span>
        </v-card-title>
        <v-card-text>
          <message :success="successMessage" :error="errorMessage"></message>
          <loader :dialog="isLoading"></loader>
          <v-container grid-list-md>
            <v-layout wrap>
              <v-flex xs12>
                <div v-if="data.bem">
                <p>{{ data.bem.name }} - {{ data.bem.modelo }} <i class="fa fa-qrcode"></i> {{ data.bem.numeracao }} <i class="fa fa-fw fa-barcode"></i>{{ data.bem.plaqueta }}</p>
                </div>
                <div v-else>
                  <v-autocomplete
                    :items="categorias"
                    v-model="data.categoria"
                    item-text="name"
                    label="Cagetoria"
                    :error-messages="errors.collect('categoria')"
                    v-validate="'required'"
                    data-vv-name="categoria"
                    return-object
                    required
                  ></v-autocomplete>
                </div>
              </v-flex>
              <v-flex xs12 sm6 md5>
                <v-text-field
                  type="date"
                  v-model="data.data"
                  label="Data"
                  :error-messages="errors.collect('data')"
                  v-validate="'required'"
                  data-vv-name="data"
                  item-text="name"
                  required
                ></v-text-field>
              </v-flex>
              <v-flex xs12 sm6 md7>
                <v-autocomplete
                  :items="servicos"
                  v-model="data.servico"
                  item-text="name"
                  label="Serviços"
                  :error-messages="errors.collect('servico')"
                  v-validate="'required'"
                  data-vv-name="servico"
                  return-object
                  required
                ></v-autocomplete>
              </v-flex>
              
              <v-flex xs12>
                <v-autocomplete
                  :items="tecnicos"
                  v-model="data.tecnicos"
                  label="Tecnico"
                  item-text="userNick"
                  multiple
                  chips
                  return-object
                  max-height="auto"
                  :error-messages="errors.collect('tecnico')" v-validate="'required'" data-vv-name="tecnico"
                  required
                >
                  <template slot="selection" slot-scope="data">
                    <v-chip
                      :selected="data.selected"
                      :key="JSON.stringify(data.item)"
                      close
                      class="chip--select-multi"
                      @input="data.parent.selectItem(data.item)"
                    >
                      <v-avatar>
                        <img :src="data.item.avatar">
                      </v-avatar>
                      {{ data.item.userNick }}
                    </v-chip>
                  </template>
                  <template slot="item" slot-scope="data">
                    <template v-if="typeof data.item !== 'object'">
                      <v-list-tile-content v-text="data.item"></v-list-tile-content>
                    </template>
                    <template v-else>
                      <v-list-tile-avatar>
                        <img :src="data.item.avatar">
                      </v-list-tile-avatar>
                      <v-list-tile-content>
                        <v-list-tile-title v-html="data.item.userNick"></v-list-tile-title>
                        <v-list-tile-sub-title v-html="data.item.email"></v-list-tile-sub-title>
                      </v-list-tile-content>
                    </template>
                  </template>
                </v-autocomplete>
              </v-flex>
              <v-flex xs12 sm3>
                <v-subheader v-text="'Ativo?'"></v-subheader>
              </v-flex>
              <v-flex xs12 sm9>
                <v-radio-group v-model="data.ativo" row>
                  <v-radio label="Sim" value="0"></v-radio>
                  <v-radio label="Não" value="1"></v-radio>
                </v-radio-group>
              </v-flex>
            </v-layout>
          </v-container>
          <small>*indica campo obrigatório</small>

        </v-card-text>
        <v-card-actions>
            <v-btn flat @click.stop="$emit('close')">Fechar</v-btn>
            <v-spacer></v-spacer>
            <v-btn color="primary" flat @click.stop="saveItem()">Salvar</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>
<script src="src/components/os/_edtOs.js"></script>