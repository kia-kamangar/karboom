<template>
  <div style="float: right">
    <el-row>
      <el-col :span="24">
        <el-menu
          style="height: 565px; margin: 30px 0 0 80px;"
          default-active="2"
          class="el-menu-vertical-demo"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#3AFF00">

          <el-menu-item index="1" disabled>
            <span>{{current_user.name}}</span>
          </el-menu-item>

          <router-link to="/user">
            <el-menu-item index="2">
              <i class="el-icon-user-solid"></i>
              <span>مشخصات</span>
            </el-menu-item>
          </router-link>

          <router-link to="/user/skill">
            <el-menu-item index="3">
              <i class="el-icon-menu"></i>
              <span>مهارت ها</span>
            </el-menu-item>
          </router-link>

          <router-link to="/user/resume">
            <el-menu-item index="4">
              <i class="el-icon-tickets"></i>
              <span>سوابق کاری</span>
            </el-menu-item>
          </router-link>

          <router-link to="/user/submitted_request">
            <el-menu-item index="5">
              <i class="el-icon-finished"></i>
              <span>درخواست های ارسال شده</span>
            </el-menu-item>
          </router-link>

          <router-link to="/works">
            <el-menu-item >
              <i class="el-icon-suitcase"></i>
              <span>جدید ترین کارها</span>
            </el-menu-item>
          </router-link>
        </el-menu>

      </el-col>
    </el-row>
  </div>
</template>

<script>
  export default{
    data() {
      return {
        current_user: null
      }
    },

    created() {
      this.current_user = this.$store.state.current_user.data.data.attributes
    }
  };
</script>