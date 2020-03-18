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
            <span>نام شرکت</span>
          </el-menu-item>

          <router-link to="/company">
            <el-menu-item index="2">
              <i class="el-icon-office-building"></i>
              <span> مشخصات شرکت </span>
            </el-menu-item>
          </router-link>

          <router-link to="/company/advertising">
            <el-menu-item index="3">
              <i class="el-icon-data-analysis"></i>
              <span>آگهی ها</span>
            </el-menu-item>
          </router-link>

          <router-link to="/company/submitted_job">
            <el-menu-item index="4">
              <i class="el-icon-tickets"></i>
              <span>درخواست شغل ها</span>
            </el-menu-item>
          </router-link>

          <router-link to="/company/companies_list">
            <el-menu-item index="5">
              <i class="el-icon-office-building"></i>
              <span>شرکت ها</span>
            </el-menu-item>
          </router-link>

          <router-link to="/company/user">
            <el-menu-item index="6">
              <i class="el-icon-user-solid"></i>
              <span>کاربر جدید</span>
            </el-menu-item>
          </router-link>
        </el-menu>
      </el-col>
    </el-row>
  </div>
</template>