<template>
  <div id="app">
    <slide-bar/>

    <el-col :span="10" style="float: right; margin: 30px 0 0 0;">
      <el-form ref="form" :model="company" label-width="120px">

        <el-form-item label="نام شرکت">
          <el-input v-model="company.name"></el-input>
        </el-form-item>

        <el-form-item label="درباره شرکت">
          <el-input v-model="company.about"></el-input>
        </el-form-item>

        <el-form-item label="لوگوی شرکت">
          <el-upload
					  class="upload-demo"
					  action="https://jsonplaceholder.typicode.com/posts/">
					  <el-button
					  	size="small"
					  	type="primary">Upload
					  </el-button>
					  <div slot="tip" class="el-upload__tip">jpg/png files with a size less than 500kb</div>
					</el-upload>
        </el-form-item>

        <el-form-item label="تلفن">
          <el-input
            v-model="company.tel"
            placeholder="Enter you telephone">
          </el-input>
        </el-form-item>

        <el-form-item label="آدرس">
          <el-input
            v-model="company.address"
            placeholder="Your address">
          </el-input>
        </el-form-item>


        <el-button
          type="success"
          size="small"
          @click="onSubmit">ذخیره
        </el-button>
      </el-form>
    </el-col>
  </div>
</template>

<script>
  import slideBar from './slide_bar.vue'

  export default {
    data() {
      return {
      	current_user: null,
        company: {
          name: '',
          about: '',
          image: '',
          background_image: '',
          address: '',
          tel: '',
        }
      }
    },

    components: {
      slideBar
    },

    methods: {
      onSubmit() {
        // this.axios.put('http://localhost:3000/api/v1/companies/' +
        // 	this.current_user.data.included[0].id, this.company)
        this.$companyResource.PUT_company(this.current_user.data.included[0].id, this.company)
      },
    },

    created() {
    	this.current_user = this.$store.state.current_user
    	this.company = this.current_user.data.included[0].attributes
    	console.log('company > ', this.current_user)
    }
  };
</script>
