<template>
	<div id="app">
		<slide-bar/>

		<el-col :span="14" style="float: right; margin: 30px 0 0 0;">
			<el-form ref="form" :model="resume" label-width="180px">
				<div class="block">
					<el-form-item>
					<span class="demonstration">عنوان سابقه</span>
						<el-input	v-model="resume.resume_title"></el-input>
					</el-form-item>
				</div>

				<div class="block">
					<span class="demonstration">تاریخ شروع</span>
					<el-date-picker
						v-model="resume.start_date"
						type="date"
						placeholder="Start date">
					</el-date-picker>
				</div>

				<div>
					<span class="demonstration">تاریخ پایان</span>
					<el-date-picker
						v-model="resume.end_date"
						type="date"
						placeholder="End date">
					</el-date-picker>
				</div>

			  <el-button
			  	type="success"
			  	@click="onSubmit"
			  	style="float: left;"
			  	size="small">ذخیره
			  </el-button>

			</el-form>
			<br>
			<br>
			<hr>
		</el-col>

		<el-col :span="14" style="float: right;">
			<el-card
				v-for="(resume, index) in resumes"
				v-if="resume.type == 'resume'"
				:key="resume.id"
				:index="index"
				shadow="hover">

				<p><span>عنوان مهارت: </span>{{resume.attributes.resume_title}}</p>
				<p><span>تاریخ شروع: </span>{{resume.attributes.start_date}}
					 <span>تاریخ پایان: </span>{{resume.attributes.end_date}}</p>

				<el-button
        	type="success"
        	size="small"
        	@click="selectItem(index, resume.id)">ویرایش
        </el-button>

        <el-button
        	type="danger"
        	size="small"
        	@click="removeItem(resume.id)">حذف
        </el-button>
      </el-card>
		</el-col>
	</div>
</template>

<script>
	import slideBar from './slide_bar.vue'

	export default {
		data() {
			return {
				flag: true,
				editItemId: null,
				current_user: null,

				resume: {
					resume_title: '',
					start_date: '',
					end_date: '',
				},

				resumes: []
			}
		},

		components: {
			slideBar
		},

		methods: {
			onSubmit() {
				this.flag ? this.createResume() : this.updateItem()
			},

			selectItem(id, editId) {
				this.flag = false
				this.editItemId = editId
				this.resume = this.current_user.data.included[id].attributes
			},

			createResume() {
				this.$resumeResource.POST_resume( this.resume )
				this.resume = {}
			},

			updateItem() {
				// console.log('id > ', this.editItemId)
				// console.log('resume > ',this.resume)
				this.$resumeResource.PUT_resume( this.editItemId, this.resume)
				this.resume = {}
				this.flag = true
			},

			removeItem(id) {
				this.$resumeResource.DELETE_resume( id )
				.then((response) => {
					this.resumes = this.resumes.filter(resume => resume.id !== id)
				})
			}
		},

		created() {
			this.current_user = this.$store.state.current_user
			this.resumes = this.current_user.data.included
		}
	};
</script>