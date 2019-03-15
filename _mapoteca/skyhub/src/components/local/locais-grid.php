<template id="grid-local">
  <div>
    <section class="container">      
      <div class="box content">
        <div class="field has-addons">
          <div class="control">
            <input v-model="configs.search" class="input" type="text" placeholder="Search">
          </div>
          <div class="control">
            <a class="button is-info"><span class="mdi mdi-magnify"></span></a>
          </div>
          &nbsp;
          <div class="control">
            <a @click="configs.order == 'asc'? configs.order = 'desc': configs.order = 'asc'" class="button is-info">
              <span :class="configs.order == 'asc'? 'mdi mdi-sort-ascending': 'mdi-sort-descending'"class="mdi mdi-magnify"></span>
            </a>
          </div>
          &nbsp;
          <div class="control">
            <div class="field is-horizontal">
              <div class="field-body">
                <p class="control"><a class="button is-static">Ordernar por:</a></p>
                <span class="select">
                  <select v-model="configs.orderBy">
                    <option value="name">Nome</option>
                    <option value="regional">Regional</option>
                  </select>
                </span>
              </div>
            </div>
          </div>
        </div>

        <article class="post" v-for="entry in filteredData">
          <div class="columns">
            <div class="column is-6">
              <a :href="'#/loja/' + $route.params._id + '/local/' + entry.id" ><p class="title is-5"> {{entry.tipo}} - {{entry.name}}</p></a>
              <p class="subtitle is-6" style="margin-bottom: 0;"> {{entry.municipio}} /{{entry.uf}}
                <span class="pull-right"  v-for="categoria in entry.categoria"> <span class="tag">{{ categoria.tag }}</span> &nbsp;  </span>
              </p>
              <p>Regional:  &nbsp; <a>#{{entry.regional}} </a></p>
            </div>
            <div class="column is-6">
              <nav class="level">
                <div class="level-item has-text-centered">
                  <div>
                    <p class="heading">Local: <i class="fa fa-building-o"></i> {{ entry.locaisQt }}</p>
                    <p><i class="fa fa-map-marker"></i> {{ entry.locaisGeoStatus }}% ({{ entry.locaisGeoQt }})</span></p>
                  </div>
                </div>
                <div class="level-item has-text-centered">
                  <div>
                    <p class="heading">Following</p>
                    <p class="title">123</p>
                  </div>
                </div>
                <div class="level-item has-text-centered">
                  <div>
                    <p class="heading">Rota</p>
                    <a v-if=" 0.000000 != entry.latitude"
                    :href="'https://maps.google.com/maps?q='+ entry.latitude + ',' + entry.longitude"
                    target="_blank">
                      <span class="title is-3 has-text-info mdi mdi-directions"></span>
                    </a>
                  </div>
                </div>
                <div class="level-item has-text-centered">
                  <div>
                    <p class="heading">Ação</p>
                    <div class="dropdown is-right is-hoverable">
                      <div class="dropdown-trigger">
                        <a aria-haspopup="true" aria-controls="dropdown-menu1">
                          <span class="title is-3 mdi mdi-apps"></span>
                        </a>
                      </div>
                      <div class="dropdown-menu" id="dropdown-menu1" role="menu">
                        <div class="dropdown-content">
                          <a @click="modalGeo = true; selecItem(entry)" class="dropdown-item">
                            <span class="mdi mdi-map-marker"></span>Geoposição
                          </a>
                          <a @click="modalCat = true; selecItem(entry)" class="dropdown-item">
                            <span class="mdi mdi-tag-multiple"></span>Categoria
                          </a>
                          <a @click="modalEdt = true; selecItem(entry)" class="dropdown-item">
                            <span class="mdi mdi-pencil"></span>Edit
                          </a>
                          <a @click="modalDel = true; selecItem(entry)" class="dropdown-item">
                            <span class="mdi mdi-delete"></span>Delete
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </article>
      </div>
    </section>
    <div>
      <local-geo v-if="modalGeo" v-on:close="modalGeo = false" :data="modalItem"></local-geo>
      <local-edt v-if="modalEdt" v-on:close="modalEdt = false" :data="modalItem"></local-edt>
      <local-del v-if="modalDel" v-on:close="modalDel = false" :data="modalItem"></local-del>
      <local-cat v-if="modalCat" v-on:close="modalCat = false" :data="modalItem"></local-cat>
    </div>
  </div>
</template>