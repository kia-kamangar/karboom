<template>
	<div id="app">
		<slide-bar/>

		<el-col :span="14" style="float: right; margin: 30px 0 0 0;">
			<el-form ref="form" :model="form" label-width="120px">

				<el-form-item  label="عنوان مهارت">
					<el-input v-model="form.skill_title"></el-input>
				</el-form-item>

				<div class="block">
				  <span class="demonstration">سطح مهارت</span>
				  <el-rate v-model="form.skill_level"></el-rate>
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

		<el-col :span="14" style="float: right; margin: 30px 0 0 0;">
			<el-card
				v-for="(skill, index) in skills"
				v-if="skill.type == 'skill'"
				:key="skill.id"
				:index="index"
				shadow="hover">
				<p>عنوان مهارت: {{skill.attributes.skill_title}}</p>
				<el-rate
					v-model="skill.attributes.skill_level"
					disabled>
				</el-rate>

				<el-button
        	type="success"
        	size="small"
        	@click="selectItem(index, skill.id)">ویرایش
        </el-button>

        <el-button
        	type="danger"
        	size="small"
        	@click="removeItem(skill.id)">حذف
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

				form: {
					skill_title: '',
					skill_level: null,
				},
				skills: [],
			}
		},

		components: {
			slideBar,
		},

		methods: {
			onSubmit(id) {
				this.flag ? this.createSkill() : this.updateItem()
			},

			createSkill() {
				this.$skillResource.POST_skill( this.form )
				this.form = {}
			},

			removeItem(id) {
				this.$skillResource.DELETE_skill( id )
				.then((response) => {
					this.skills = this.skills.filter(skill => skill.id !== id)
				})
			},

			updateItem() {
				this.$skillResource.PUT_skill( this.editItemId , this.form )
				this.form = {}
				this.flag = true
			},

			selectItem(id, editId) {
				this.flag = false
				this.editItemId = editId
				this.form = this.current_user.data.included[id].attributes
			}
		},

		created() {
	    this.current_user = this.$store.state.current_user
	    this.skills = this.current_user.data.included
		}
	};
</script>
