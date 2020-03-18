<template>
  <div id="app">
    <p>نام کاربر: <span>{{user.name}}</span></p>
    <p>نام خانوادگی کاربر: <span>{{user.last_name}}</span></p>
    <br>
    <hr>
    <p>مهارت ها</p>
    <el-col :span="24" style="text-align: right; float: right;">
      <el-card v-for="skill in skills"
        :key="skill.id"
        shadow="hover">
        <p>عنوان مهارت: {{skill.attributes.skill_title}}</p>
        <el-rate
          v-model="skill.attributes.skill_level"
          disabled>
        </el-rate>
      </el-card>
    </el-col>
    <br>
    <br>
    <hr>
    <p>سابقه ها</p>
    <el-col :span="24" style="text-align: right; float: right;">
      <el-card v-for="resume in resumes"
        :key="resume.id"
        show="hover">
        <p>عنوان سابقه: {{resume.attributes.resume_title}}</p>
        <p>تاریخ شروع: {{resume.attributes.start_date}}</p>
        <p>تاریخ پایان: {{resume.attributes.end_date}}</p>
      </el-card>
    </el-col>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    data() {
      return {
        user: [],
        skills: [],
        resumes: []
      }
    },

    methods: {
      findUser(id) {
        this.$userResource.GET_user( id )
        .then(response => {
          this.user = response.data.data.attributes
        })
      },

      fetchSkills(id) {
        this.$skillResource.GET_skills()
        .then(response => {
          console.log(response)
          this.skills = response.data.data
        })
      },

      fetchResumes(id) {
        this.$resumeResource.GET_resumes()
        .then(response => {
          this.resumes = response.data.data
        })
      }
    },

    created() {
      const id = this.$route.params.id
      this.findUser(id)
      this.fetchSkills(id)
      this.fetchResumes(id)
    },
  };
</script>