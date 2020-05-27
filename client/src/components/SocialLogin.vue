<template>
  <div class="sociallogin">
    <p>
      Login here:
    </p>
    <el-button
      type="primary"
      icon="fas fa-edit"
      @click="handleClickSignIn"
      v-if="!isSignIn"
      :disabled="!isInit"
    >sign in</el-button>
    <el-button
      type="primary"
      icon="fas fa-edit"
      @click="handleClickSignOut"
      v-if="isSignIn"
      :disabled="!isInit"
    >sign out</el-button>
  </div>
</template>

<script>
import api from "@/services/api";
export default {
  name: "SocialLogin",
  data() {
    return {
      isInit: false,
      isSignIn: false
    };
  },
  methods: {
    async handleClickSignIn() {
      const authCode = await this.$gAuth.getAuthCode()
      const { token } = await api.googleCallback(authCode)
      const res = await api.secret(token)
      this.isSignIn = this.$gAuth.isAuthorized;
      console.log(res)
    },

    handleClickSignOut() {
      this.$gAuth
        .signOut()
        .then(() => {
          //on success do something
          this.isSignIn = this.$gAuth.isAuthorized;
          console.log("isSignIn", this.$gAuth.isAuthorized);
        })
        .catch(error => {
          //on fail do something
          console.error(error);
        });
    },
  },

  created() {
    let that = this;
    let checkGauthLoad = setInterval(function() {
      that.isInit = that.$gAuth.isInit;
      that.isSignIn = that.$gAuth.isAuthorized;
      if (that.isInit) clearInterval(checkGauthLoad);
    }, 1000);
  }
};
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
</style>
