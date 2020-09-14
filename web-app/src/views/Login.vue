<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>ログインフォーム</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-form>
              <v-text-field
                label="Login"
                name="login"
                prepend-icon="mdi-account"
                type="text"
                v-model="username"
              ></v-text-field>

              <v-text-field
                id="password"
                label="Password"
                name="password"
                prepend-icon="mdi-lock"
                type="password"
                v-model="password"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="signIn">ログイン</v-btn>
          </v-card-actions>
          <v-card-actions>
            <v-spacer></v-spacer>
            <router-link to="/signup">新規登録</router-link>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
    <v-btn @click="onClick">クエリ</v-btn>
  </v-container>
</template>

<script lang="ts">
import Vue from "vue";
import { Auth, API, graphqlOperation } from "aws-amplify";

export default Vue.extend({
  data: () => ({
    username: "",
    password: ""
  }),
  methods: {
    async onClick(): Promise<void> {
      const none = `query MyQuery {
  none
}
`;
      try {
        const posts = await API.graphql(graphqlOperation(none));
        console.log("posts: ", posts);
      } catch (e) {
        console.log(e);
      }
    },
    async signIn(): Promise<void> {
      try {
        const user = await Auth.signIn(this.username, this.password);
        console.log(user);
        this.$router.push({ name: "home" });
      } catch (error) {
        console.log("error signing in", error);
      }
    }
  }
});
</script>
