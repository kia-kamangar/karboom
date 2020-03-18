<template>
  <div id="app">
    <p>آدرس شرکت: <span>{{company.address}}</span></p>
    <p>شماره شرکت: <span>{{company.tel}}</span></p>
    <br>
    <hr>
    <h3>شرکت: {{company.name}}</h3>
    <p>درباره شرکت: {{company.about}}</p>
    <br>
    <hr>
    <p>آگهی ها</p>
    <el-col :span="24" style="text-align: right; float: right;">
      <el-card v-for="adv in advertisings"
        :key="adv.id"
        shadow="hover">
        <p>عنوان شغل: {{adv.attributes.job_title}}</p>
        <p>توضیحات شغل: {{adv.attributes.job_description}}</p>
        <p>حقوق: {{adv.attributes.salary}}</p>

        <el-button
          type="success"
          size="small"
          @click="selectItem(adv.id)">ویرایش</el-button>

        <el-button
          type="danger"
          size="small"
          @click="removeItem(adv.id)">حذف</el-button>
      </el-card>
    </el-col>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    data() {
      return {
        company: [],
        advertisings: []
      }
    },

    created() {
      const id = this.$route.params.id
      this.find(id)
      this.fetchAdvertising(id)
    },
    methods: {
      find(id) {
        this.axios.get('http://localhost:3000/api/v1/companies/' + id)
        .then(response => {
          this.company = response.data.data.attributes
        })
      },

      fetchAdvertising(id) {
        this.axios.get('http://localhost:3000/api/v1/advertisings')
        .then(response => {
          console.log(response)
          this.advertisings = response.data.data
        })
      }
    }
  };
</script>