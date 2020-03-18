<template>
  <div id="app">
    <slide-bar/>

    <el-col :span="10" style="float: right; margin: 30px 0 0 0;">
      <el-form ref="form" :model="form" label-width="120px">

        <el-form-item label="نام">
          <el-input v-model="form.user.name"></el-input>
        </el-form-item>

        <el-form-item label="نام خانوادگی">
          <el-input v-model="form.user.last_name"></el-input>
        </el-form-item>

        <el-form-item label="email">
          <el-input
            v-model="form.user.email"
            placeholder="Enter email">
          </el-input>
        </el-form-item>

        <el-form-item label="password">
          <el-input
            v-model="form.user.password"
            show-password
            placeholder="Enter password">
          </el-input>
        </el-form-item>

        <el-form-item label="confirm password">
          <el-input
            v-model="form.user.confirmPassword"
            show-password
            placeholder="confirm password">
          </el-input>
        </el-form-item>


        <el-button
          type="success"
          @click="onSubmit">ذخیره
        </el-button>
      </el-form>
    </el-col>
  </div>
</template>

<script>
  import slideBar from './slide_bar.vue'
  import axios from 'axios'

  export default {
    data() {
      return {
        form: {
          user: {
            name: '',
            last_name: '',
            email: '',
            password: '',
            role: 'customer'
          }
        },
      }
    },

    components: {
      slideBar
    },

    methods: {
      onSubmit() {
        this.axios.post('http://localhost:3000/api/v1/users', this.form)
        this.form = {}
      },
    },
  };
</script>
