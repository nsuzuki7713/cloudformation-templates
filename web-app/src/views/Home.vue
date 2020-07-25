<template>
  <div>
    ログイン中
    <v-btn color="primary" @click="getData">fetch api</v-btn>
    <div>
      {{ response }}
    </div>
  </div>
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
    }
  }
});
</script>
