<template>
	<div id="app">
		<slide-bar/>

		<el-col :span="16" style="float: right; margin: 30px 0 0 0;">
			<el-form ref="form" :model="advertising" label-width="120px">

				<el-form-item label="عنوان شغل">
					<el-input	v-model="advertising.job_title"></el-input>
				</el-form-item>

				<el-form-item label="توضیحات شغل">
					<el-input
						v-model="advertising.job_description"
						type="textarea"
						:rows="4"
						placeholder="About Job">
					</el-input>
				</el-form-item>

				<el-form-item label="حقوق">
						<el-input	v-model="advertising.salary"></el-input>
				</el-form-item>
				<router-link to="/company/advertising">
	      	<el-button type="success" @click="onSubmit" size="small">ذخیره</el-button>
	      </router-link>
	      <br>
	      <hr>
	      <p>آگهی ها</p>
			</el-form>
		</el-col>

		<el-col :span="16" style="text-align: right; float: right;">
			<el-card v-for="(adv, index) in advertisings"
				v-if="adv.type == 'advertising'"
				:index="index"
				:key="adv.id"
        shadow="hover">
        <p>عنوان شغل: {{adv.attributes.job_title}}</p>
        <p>توضیحات: {{adv.attributes.job_description}}</p>
        <p>حقوق: {{adv.attributes.salary}}</p>

        <el-button
        	type="success"
        	size="small"
        	@click="selectItem(index, adv.id)">ویرایش</el-button>

        <el-button
        	type="danger"
        	size="small"
        	@click="removeItem(adv.id)">حذف</el-button>
      </el-card>
    </el-col>
	</div>
</template>

<script>
	import slideBar from './slide_bar.vue';
	import axios from 'axios';

	export default {
    data() {
      return {
        current_user: null,
        flag: true,
        editItemId: null,
        advertising: {
          job_title: '',
          job_description: '',
          salary: ''
        },

        advertisings: []
      }
    },

    components: {
      slideBar
    },

    methods: {
      onSubmit() {
          this.flag ? this.createAdvertising() : this.updateItem()
        },

      createAdvertising() {
        this.$advertisingResource.POST_advertising( this.advertising )
        this.advertising = {}
      },

      selectItem(id, editId) {
        this.flag = false
        this.editItemId = editId
        this.advertising = this.current_user.data.included[id].attributes
      },

      removeItem(id) {
        this.$advertisingResource.DELETE_advertising( id )
        .then((response) => {
          this.advertisings = this.advertisings.filter(advertising => advertising.id !== id)
        })
      },

      updateItem() {
        this.$advertisingResource.PUT_advertising( this.editItemId, this.advertising )
        this.flag = true
        this.advertising = {}
      }
    },

    created() {
      this.current_user = this.$store.state.current_user
      this.advertisings = this.current_user.data.included
      console.log('advertising > ', this.advertisings)
    }
  };
</script>