<template>
  <div id="app">
    <Nav />
    <router-view />
    <!-- <Footer /> -->
  </div>
</template>

<script>
  import Nav from "./navMenu.vue"
  import Footer from "./footer.vue"

  export default {
    data() {
      return {

      }
    },

    components: {
      Nav,
      Footer
    }
  };
</script>

