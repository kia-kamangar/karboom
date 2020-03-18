<template>
  <div id="app">
    <el-col :span="14" style=" margin: 40px 0 0 180px;">
      <el-form ref="form" :model="login" label-width="140px">
        <el-form-item label="email">
          <el-input
            v-model="login.user.email"
            placeholder="Enter email">
          </el-input>
        </el-form-item>

        <el-form-item label="password">
          <el-input
            v-model="login.user.password"
            show-password
            placeholder="Password">
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="success"
            @click="loginSubmit"
            size="small">ورود
          </el-button>
        </el-form-item>
      </el-form>
      <br>
      <hr>
      <br>

      <el-form ref="form" :model="signIn" label-width="140px">
        <el-form-item label="name">
          <el-input
            v-model="signIn.user.name">
          </el-input>
        </el-form-item>

        <el-form-item label="last name">
          <el-input
            v-model="signIn.user.last_name">
          </el-input>
        </el-form-item>

        <el-form-item label="email">
          <el-input
            v-model="signIn.user.email"
            placeholder="Enter email">
          </el-input>
        </el-form-item>

        <el-form-item label="password">
          <el-input
            v-model="signIn.user.password"
            show-password
            placeholder="Enter password">
          </el-input>
        </el-form-item>

        <el-form-item label="confirm password">
          <el-input
            v-model="signIn.user.confirmPassword"
            show-password
            placeholder="confirm password">
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-radio v-model="signIn.user.role" label="admin"> Admin</el-radio>
        </el-form-item>
        <el-form-item>
          <el-radio v-model="signIn.user.role" label="customer"> User</el-radio>
        </el-form-item>

        <el-form-item>
          <el-button
            type="primary"
            @click="signInSubmit"
            size="small">sigin
          </el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        login: {
          user: {
            email: '',
            password: '',
          }
        },
        signIn: {
          user: {
            name: '',
            last_name: '',
            email: '',
            password: '',
            confirmPassword: '',
            role: ''
          }
        }
      }
    },

    methods: {
      loginSubmit() {
        this.axios.post('/users/sign_in', this.login)
        .then(response => {
          this.$store.dispatch('updateCurrentUser', response)
          switch(response.data.data.attributes.role) {
            case 'admin' : this.$router.push("/company"); break
            case 'customer' : this.$router.push ("/user"); break
          }
        })
      },

      signInSubmit() {
        this.axios.post('http://localhost:3000/api/v1/users', this.signIn)
        console.log(this.signIn)
      },
    }
  };
</script>
<style>
  .el-select .el-input {
    width: 110px;
  }
  .input-with-select .el-input-group__prepend {
    background-color: #fff;
  }
</style>