<template>
  <div id="app">
    <el-menu
      style="margin: 0 0 55px 0;"
      :default-active="activeIndex1"
      class="el-menu-demo"
      mode="horizontal"
      @select="handleSelect"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#3AFF00">
      <el-menu-item>Karboom</el-menu-item>
    </el-menu>
  </div>
</template>

<script>
</script>

<style>
  .pull_right {
    float: right !important;
  }
</style>