import Home from "../components/home.vue"
import User from "../components/user/Users.vue"
import Work from "../components/user/works.vue"
import Skill from "../components/user/skill.vue"
import Resume from "../components/user/resume.vue"
import AdminUser from '../components/company/user.vue'
import Company from "../components/company/company.vue"
import ShowUser from "../components/user/show_user.vue"
import LogIn_SignIn from "../components/logIn_signIn.vue"
import Advertising from "../components/company/advertising.vue"
import ShowCompany from "../components/company/show_company.vue"
import SubmittedJob from '../components/company/submitted_job.vue'
import CompaniesList from "../components/company/companies_list.vue"
import SubmittedRequest from '../components/user/submitted_request.vue'

const routes = [
	{
		path: '/home',
		name: 'home',
		component: Home
	}, {
		path: '/user',
		name: 'user',
		component: User
	}, {
		path: '/user/skill',
		name: 'skill',
		component: Skill
	}, {
		path: '/user/resume',
		name: 'resume',
		component: Resume
	}, {
		path: '/company',
		name: 'company',
		component: Company
	}, {
		path: '/company/advertising',
		name: 'advertising',
		component: Advertising
	}, {
		path: '/company/companies_list',
		name: 'companies_list',
		component: CompaniesList
	}, {
		path: '/',
		name: '/login',
		component: LogIn_SignIn
	}, {
		path: '/works',
		name: 'works',
		component: Work
	}, {
		path: '/company/show_company',
		name: 'show_company',
		component: ShowCompany
	}, {
		path: '/user/show_user',
		name: 'show_user',
		component: ShowUser,
	}, {
		path: '/user/submitted_request',
		name: 'submitted_request',
		component: SubmittedRequest,
	}, {
		path: '/company/user',
		name: 'admin_user',
		component: AdminUser,
	}, {
		path: '/company/submitted_job',
		name: 'submitted_job',
		component: SubmittedJob,
	}
]

export default routes