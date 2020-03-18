<template>
  <div id="app">
    <el-menu
      :default-active="activeMenu"
      class="el-menu-demo"
      mode="horizontal"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#3AFF00">
      <el-menu-item>Karboom</el-menu-item>
      <router-link to="/">
        <el-menu-item
          v-if="flag"
          index="2"
          class="pull_right">صفحه اصلی
      </el-menu-item>
      </router-link>
      <router-link to="/user">
        <el-menu-item
          v-if="flag"
          index="3"
          class="pull_right">کاربر
        </el-menu-item>
      </router-link>

      <el-menu-item
        v-if="flag"
        index="4"
        class="pull_right">تماس با ما
      </el-menu-item>
<!--       <router-link to="/login">
        <el-button
          v-if="!current_user"
          style="margin-top: 10px;"
          @click="openAuthPage"
          class="pull_right"
          type="primary"
          size="small">ورود
        </el-button>
      </router-link> -->

        <el-button
          v-if="flag"
          style="margin-top: 10px;"
          type="danger"
          @click="logOut"
          size="small">خروج
        </el-button>
    </el-menu>
  </div>
</template>

<script>

  export default {
    data() {
      return {
        flag: false,
        activeMenu: '2',
      }
    },
    methods: {

      logOut() {
        this.axios.delete('/users/sign_out')
        this.$store.state.current_user = null
        this.$router.push('/')
        window.location.href = '/'
      }
    },
    created() {
      this.$store.watch(
        (state, getters) => getters.flag,
        (newValue, oldValue) => {
          console.log(`Updating from ${oldValue} to ${newValue}`);
          this.flag = this.$store.state.flag
        }
      );
    }
  };
</script>

<style>
  .pull_right {
    float: right !important;
  }
</style>
