<template>
	<div class="demo-image__placeholder">
		<div class="block">
	    <el-image :src="src">
	    </el-image>
	    <div>
	    	<el-input
	    		class="search"
	    		placeholder="جستجو"
	    		v-model="search">
	    		<i slot="suffix" class="el-input__icon el-icon-search"></i>
	    	</el-input>
	    </div>
		</div>

    <hr>
    <p>تازه ترین افراد</p>
    <el-row :gutter="12" style="margin: 20px 0 20px 0;">
      <el-col :span="6" v-for="user in users"
          :key="user.id">
        <el-button
          @click="showUser(user.id)">
          <el-card shadow="always">
            {{user.attributes.name}}
          </el-card>
        </el-button>
      </el-col>
    </el-row>

    <hr>
    <p>تازه ترین آگهی ها</p>
    <el-row :gutter="12" style="margin: 20px 0 20px 0;">
      <el-col
        :span="6"
        v-for="adv in advertisings"
        :key="adv.id">
        <el-card shadow="always">
          {{adv.attributes.job_title}}
        </el-card>
      </el-col>
    </el-row>

    <hr>
    <p>تازه ترین شرکت ها</p>
    <el-row :gutter="12" style="margin: 20px 0 20px 0;">
      <el-col :span="6" v-for="company in companies"
        :key="company.id">
        <!-- <router-link to="/show_company"> -->
          <el-button
            @click="showCompany(company.id)">
            <el-card shadow="always">
              {{company.attributes.name}}
            </el-card>
          </el-button>
        <!-- </router-link> -->
      </el-col>
    </el-row>
	</div>

</template>


<script>
  export default {
    data() {
      return {
      	src: 'https://www.sobelins.com/wp-content/uploads/2014/08/homepage-categories-background.jpg',
      	search: '',
      	// src: '../../assets/images/background.jpg',
        users: [],
        advertisings: [],
        companies: []
      }
    },

    methods: {
      fetchUsers() {
        this.$userResource.GET_users()
          .then(response => {
            this.users = response.data.data
            // console.log(response)
        })
      },

      showCompany(id) {
        // console.log("id>>>",id)
        this.$router.push({name: 'show_company', params: { id: id }} )
      },

      showUser(id) {
        this.$router.push({name: 'show_user', params: { id: id }})
      },

      fetchAdvertising() {
        this.$advertisingResource.GET_advertisings()
        .then(response => {
          this.advertisings = response.data.data
            // console.log(response)
        })
      },

      fetchCompany() {
        this.$companyResource.GET_companies()
          .then(response => {
            this.companies = response.data.data
          })
      }
    },

    created() {
      this.fetchUsers()
      this.fetchAdvertising()
      this.fetchCompany()
    }
  };
</script>

<style>
  img {
    width: 100%;
    height: 450px;
  }

  .header {
    text-align: center;
    position: relative;
    display: inline-block;
  }

  .search {
		width: 30%;
	  position: absolute;
	  top: 0;
	  left: 0;
	  margin: 250px 0 0 500px;
	  display: flex;
	  align-items: center;
  }
</style>