<template>
  <v-container>
    <v-row>
      ログイン中
    </v-row>
    <v-row>
      <v-btn color="primary" @click="getData">fetch api</v-btn>
    </v-row>
    <v-row>
      {{ response }}
    </v-row>
    <v-row class="mt-2">
      <v-btn color="primary" @click="changePassword">パスワード変更</v-btn>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from "vue";
import { Auth, API } from "aws-amplify";

export default Vue.extend({
  data: () => ({
    response: undefined
  }),
  methods: {
    async getData(): Promise<void> {
      const apiName = "sample";
      const path = "/pets";
      const myInit = {
        headers: {
          Authorization: `Bearer ${(await Auth.currentSession())
            .getIdToken()
            .getJwtToken()}`
        },
        response: true
      };
      try {
        const res = await API.get(apiName, path, myInit);
        this.response = res.data;
      } catch (err) {
        console.log(err);
      }
    },
    changePassword(): void {
      this.$router.push({ name: "changePassword" });
    }
  }
});
</script>
