<template>
  <div id="app">
    <slide-bar/>
    <el-col :span="14" style="text-align: right; float: right; margin-top: 30px;">
      <el-card v-for="(adv, index) in advertisings"
        :key="adv.id"
        :index='index'
        shadow="hover">
        <p>عنوان شغل: {{adv.attributes.job_title}}</p>
        <p>توضیحات شغل: {{adv.attributes.job_description}}</p>
        <p>حقوق: {{adv.attributes.salary}}</p>

        <el-button
          type="success"
          size="small"
          @click="selectItem(index)">درخواست کار</el-button>
      </el-card>
    </el-col>
  </div>
</template>

<script>
  import slideBar from './slide_bar.vue';

  export default {
    data() {
      return {
        advertisings: [],
        demand: {
          job_title: '',
          job_description: '',
          salary: null
        }
      }
    },

    components: {
      slideBar
    },

    methods: {
      selectItem(id) {
        //create demand when user select an advertising
        this.demand.job_title = this.advertisings[id].attributes.job_title
        this.demand.job_description = this.advertisings[id].attributes.job_description
        this.demand.salary = this.advertisings[id].attributes.salary

        this.$demandResource.POST_demand( this.demand )
        this.$router.push({ name: 'submitted_request' })
      }
    },

    created() {
      this.advertisings = this.$advertisingResource.GET_advertisings()
    }
  };
</script>