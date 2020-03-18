<template>
  <div id="app">
    <slide-bar />
      <el-col :span="16" style="float: right;">
        <el-card v-for="company in companies"
          :item="company"
          :key="company.id"
          shadow="hover"
          style="margin: 30px 0 10px 10px;">
            <p>نام شرکت: {{company.attributes.name}}</p><br>
            <p>درباره شرکت: {{company.attributes.about}}</p>

          <router-link to="/company/show_company">
            <el-button
              type="success"
              @click="show(company.id)"
              size="small">مشاهده
            </el-button>
          </router-link>

            <el-button
              type="danger"
              @click="removeCompany(company.id)"
              size="small">حذف
            </el-button>

        </el-card>
      </el-col>
    <!-- <show-company @inputData="showCompany"/> -->
  </div>
</template>

<script>
  import slideBar from './slide_bar.vue';
  import axios from 'axios';
  export default {
    data() {
      return {
        companies: [],
        Data: ""
      }
    },

    components: {
      slideBar,
      // showCompany
    },

    methods: {
      fetchAll() {
        this.axios.get('http://localhost:3000/api/v1/companies')
        .then(response => { this.companies = response.data.data
          console.log(response)})
      },

      show(id) {
        this.$router.push({ name: 'show_company', params: { id: id } })
      },

      showCompany(variable) {
        this.showCompany = variable;
      },

      removeCompany(id) {
        this.axios.delete('http://localhost:3000/api/v1/companies/' + id)
        .then((response) => {
          this.companies = this.companies.filter(company => company.id !== id)
        })
      }
    },

    created() {
      this.fetchAll()
    }
  };
</script>