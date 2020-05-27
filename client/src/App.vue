<template>
  <div id="app">
    <div id="content">
      <Home msg="Social Login"/>
      <SocialLogin/>
    </div>
  </div>
</template>

<script>
import Home from './components/Home.vue'
import SocialLogin from './components/SocialLogin.vue'

export default {
  name: 'App',
  components: {
    Home,
    SocialLogin
  }
}
</script>

<style>
#content {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
