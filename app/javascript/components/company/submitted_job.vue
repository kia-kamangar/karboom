<template>
  <div id='app'>
    <slide-bar/>
    <el-col :span="14" style="text-align: right; float: right; margin-top: 30px;">

      <el-card v-for="request in requests"
        :key="request.id"
        shadow="hover">
        <p>عنوان شغل: {{request.attributes.job_title}}</p>
        <p>نام کاربر: {{users.name}}</p>
        <br>

        <el-button
          type="primary"
          size="small"
          @click="showUser()">
          مشاهده کاربر
        </el-button>
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
        requests: [],
        users: [],
      }
    },

    components: {
      slideBar,
    },

    methods: {
      fetchDemands() {
        this.$demandResource.GET_demands()
        .then(response => {
          console.log('demand > ',response)
          this.requests = response.data.data
        })
      },

      fetchUser() {
        this.axios.get('http://localhost:3000/api/v1/users/' + 2)
        .then(response => {
          this.users = response.data.data.attributes
        })
      },

      removeItem(id) {
        this.axios.delete('http://localhost:3000/api/v1/demands/' + id)
        .then((response) => {
          this.requests = this.requests.filter(demand => demand.id !== id)
          this.fetchRequests()
        })
      },

      showUser() {
        this.$router.push({ name: 'show_user', params: { id: 2 }})
      }
    },

    created() {
      this.fetchDemands()
      this.fetchUser()
    }
  };
</script>