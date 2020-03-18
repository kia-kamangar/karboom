<template>
  <div>
    <slide-bar/>

    <el-col :span="10" style="float: right; margin: 30px 0 0 0;">
      <el-form ref="form" :model="user" label-width="120px">

        <el-form-item label="نام">
          <el-input v-model="user.name"></el-input>
        </el-form-item>

        <el-form-item label="نام خانوادگی">
          <el-input v-model="user.last_name"></el-input>
        </el-form-item>

        <el-form-item label="سن">
          <el-input v-model="user.age"></el-input>
        </el-form-item>

        <el-form-item label="جنسیت">
          <el-radio-group v-model="user.gender">
            <el-radio label="زن"></el-radio>
            <el-radio label="مرد"></el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="تلفن">
          <el-input v-model="user.tel"></el-input>
        </el-form-item>

        <el-form-item label="عکس پرسنلی">
          <el-upload
            v-model="user.image"
            ref="uploadImage"
            class="upload-demo"

            action="https://jsonplaceholder.typicode.com/posts/api/v1/users">
            <el-button size="small" type="primary">Upload</el-button>
            <div slot="tip" class="el-upload__tip">jpg/png files with a size less than 500kb</div>
          </el-upload>
        </el-form-item>

        <el-form-item label="عکس پس زمینه">
          <el-upload
            v-model="user.background_image"
            class="upload-demo"
            action="https://jsonplaceholder.typicode.com/posts/">
            <el-button size="small" type="primary">Upload</el-button>
            <div slot="tip" class="el-upload__tip">jpg/png files with a size less than 500kb</div>
          </el-upload>
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

  export default {
    data() {
      return {
        current_user: null,
          user: {
            name: '',
            last_name: '',
            age: '',
            gender: '',
            tel: '',
            image: {
              'url': null
            },
            email: '',
            password: '',
            role: ''
          },

      }
    },

    components: {
      slideBar
    },

    methods: {
      onSubmit() {
        // this.axios.put('http://localhost:3000/api/v1/users/' +
          // this.current_user.data.data.id , this.user)
        this.$userResource.PUT_user(this.current_user.data.data.id, this.user)
      },
    },

    created() {
      this.current_user = this.$store.state.current_user
      this.user = this.$store.state.current_user.data.data.attributes
    }
  };
</script>
