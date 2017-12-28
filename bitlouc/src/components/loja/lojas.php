<template id="list">
  <div>
      <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Lojas
        <small>Lista</small>
      </h1>
      <ol class="breadcrumb">
        <li class="active"><i class="fa fa-dashboard"></i> Home</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="box box-default">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
            <!-- Widget: user widget style 1 -->
              <div class="box box-widget widget-user">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header bg-aqua-active">
                  <p class="successMessage" v-if="successMessage">{{successMessage}}</p>
                  <p class="errorMessage" v-if="errorMessage">{{errorMessage}}</p>
                  <h3 class="widget-user-username">{{ proprietario.nick }}<span class="pull-right badge bg-blue">
                        Locais: <i class="fa fa-fw fa-building-o"></i> {{ proprietario.locaisQt }} /<i class="fa fa-fw fa-map-marker"></i> {{ proprietario.locaisGeoStatus }}% ({{ proprietario.locaisGeoQt }})</span></h3>
                  <h5 class="widget-user-desc">{{ proprietario.name  }}</h5>
                  <h5 class="widget-user-desc">Seguimento: {{  }}
                    <div class="pull-right box-tools">
                      <div class="input-group input-group-sm" style="width: 150px;">
                        <input v-model="searchQuery" name="table_search" class="form-control pull-right" placeholder="Search">
                        <span class="input-group-btn">
                          <button class="btn btn-teal btn-flat"> <i class="fa fa-building"></i></button>
                        </span>
                      </div>
                    </div>
                  </h5>
                </div>
                <!--div class="widget-user-image">
                  <img class="img-circle" src="../dist/img/user1-128x128.jpg" alt="User Avatar">
                </div-->
                <div class="box-footer">
                  <div class="row">
                    <div class="col-sm-3 border-right">
                      <div class="description-block">
                        <h5 class="description-header">3,200</h5>
                        <span class="description-text">SALES</span>
                      </div>
                      <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-3 border-right">
                      <div class="description-block">
                        <h5 class="description-header">13,000</h5>
                        <span class="description-text">FOLLOWERS</span>
                      </div>
                      <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-3 border-right">
                      <div class="description-block">
                        <h5 class="description-header">13,000</h5>
                        <span class="description-text">FOLLOWERS</span>
                      </div>
                      <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-3">
                      <div class="description-block">
                        <h5 class="description-header">35</h5>
                        <span class="description-text">PRODUCTS</span>
                      </div>
                      <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                  </div>
                  <!-- /.row -->
                </div>
                <div class="box-footer">
                  <a v-on:click="modalLocalAdd = true; selecItem(dados)" class="btn btn-app">
                    <i class="fa fa-plus"></i> LOCAL
                  </a>
                  <a v-on:click="modalLocalAdd = true; selecItem(dados)" class="btn btn-app">
                    <i class="fa fa-plus"></i> LOCAL
                  </a>
                  <a class="btn btn-default" ><span class="glyphicon glyphicon-plus"></span>
                    Add
                  </a>
                  <!-- /.row -->
                </div>
              </div>
            <!-- /.widget-user -->
            </div>
            <!-- /.col -->
            <grid-lojas
              :data="lojas"
              :columns="gridColumns"
              :filter-key="searchQuery">
            </grid-lojas>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </section>
      <!-- /.content -->
  </div>
</template>