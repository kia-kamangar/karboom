<template>
    <div id="app">
    <slide-bar/>
    <el-col :span="14" style="text-align: right; float: right; margin-top: 30px;">

      <el-card v-for="request in demands"
        v-if="request.type == 'request'"
        :key="request.id"
        shadow="hover">
        <p>عنوان شغل: {{request.attributes.job_title}}</p><br>
        <p>توضیحات شغل: {{request.attributes.job_description}}</p><br>
        <p>حقوق: {{request.attributes.salary}}</p>
        <br>

        <el-button
          type="danger"
          size="small"
          @click='removeItem(request.id)'>
          حذف
        </el-button>
      </el-card>
    </el-col>
  </div>
</template>

<script>
  import slideBar from './slide_bar.vue'
  export default{
    data() {
      return {
        demands: [],
        current_user: null,
      }
    },

    components: {
      slideBar
    },

    methods: {
      removeItem(id) {
        this.$demandResource.DELETE_demand( id )
        .then((response) => {
          this.demands = this.demands.filter(demand => demand.id !== id)
        })
      },
    },

    created() {
      this.current_user = this.$store.state.current_user
      this.demands = this.current_user.data.included
    }
  };
</script>