
<template id="loja">
  <div>
    <nav class="breadcrumb is-right" aria-label="breadcrumbs">
      <ul>
        <li><router-link to="/"> Home</router-link></li>
        <li class="is-active"><a aria-current="page">Loja</a></li>
      </ul>
    </nav>
    <section class="section">
      <div class="container">
        <div class="columns">
          <div class="column is-three-fifths">
            <h1 class="title"> {{ loja.nick }} </h1>
            <p class="subtitle"> {{ loja.seguimento }} - {{ loja.name }} <span class="pull-right tag" v-for="categoria in loja.categoria">{{ categoria.tag }}</span></p>
          </div>
          <div class="column">
            <nav class="level">
              <div class="level-item has-text-centered">
                <div>
                  <p class="heading">Local: <i class="fa fa-building-o"></i> {{ loja.locaisQt }}</p>
                  <p><i class="fa fa-map-marker"></i> {{ loja.locaisGeoStatus }}% ({{ loja.locaisGeoQt }})</span></p>
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
                  <p class="heading">Followers</p>
                  <p class="title">456K</p>
                </div>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <section class="container">
      <div>
        <div class="tabs is-toggle">
          <ul>
            <li :class="active==1 ? 'is-active' : ''" @click="active=1">
              <a>
                <span class="icon is-small"><i class="fa fa-building-o"></i></span>
                <span>Locais</span>
              </a>
            </li>
            <li :class="active==2 ? 'is-active' : ''" @click="active=2">
              <a>
                <span class="icon is-small"><i class="fa fa-music"></i></span>
                <span>Bens Ocioso</span>
              </a>
            </li>
            <li>
              <a>
                <span class="icon is-small"><i class="fa fa-film"></i></span>
                <span>Videos</span>
              </a>
            </li>
            <li>
              <a>
                <span class="icon is-small"><i class="fa fa-file-text-o"></i></span>
                <span>Documents</span>
              </a>
            </li>
          </ul>
        </div>
        <section class="container">
          <div  v-if="active==1">
            <div class="widget-user-header bg-aqua-active">
              <p class="successMessage" v-if="successMessage">{{successMessage}}</p>
              <p class="errorMessage" v-if="errorMessage">{{errorMessage}}</p>
            </div>
            <div>
              <a v-on:click="modalLocalAdd = true" class="button is-primary is-al">
                <i class="fa fa-building-o"></i> Local Add
              </a>
            </div>
            <br>
            <grid-local
                :data="locais"
                :columns="gridColumns"
                :filter-key="searchQuery">
            </grid-local>
          </div>
        </section>
          <!--nav class="panel">
            <p class="panel-heading">
              repositories
            </p>
            <div class="panel-block">
              <p class="control has-icons-left">
                <input class="input is-small" type="text" placeholder="search">
                <span class="icon is-small is-left">
                  <i class="fa fa-search"></i>
                </span>
              </p>
            </div>
            <p class="panel-tabs">
              <a class="is-active">all</a>
              <a>public</a>
              <a>private</a>
              <a>sources</a>
              <a>forks</a>
            </p>
            <a class="panel-block is-active">
              <span class="panel-icon">
                <i class="fa fa-book"></i>
              </span>
              bulma
            </a>
            <a class="panel-block">
              <span class="panel-icon">
                <i class="fa fa-code-fork"></i>
              </span>
              mojs
              <h1>teste</h1>
            </a>
            <label class="panel-block">
              <input type="checkbox">
              remember me
            </label>
            
          </nav-->
          <local-add v-if="modalLocalAdd" v-on:close="modalLocalAdd = false" :data="loja" @atualizar="onAtualizar"></local-add>
      </div>
      <!-- /.box -->
    </section>
  </div>
</template>