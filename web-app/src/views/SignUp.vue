<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>新規登録</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-form>
              <v-text-field
                label="ユーザ名"
                name="username"
                prepend-icon="mdi-account"
                type="text"
                v-model="username"
              ></v-text-field>

              <v-text-field
                label="メールアドレス"
                name="address"
                prepend-icon="mdi-gmail"
                type="text"
                v-model="address"
              ></v-text-field>

              <v-text-field
                id="password"
                label="Password"
                name="password"
                prepend-icon="mdi-lock"
                :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                :type="showPassword ? 'text' : 'password'"
                v-model="password"
                @click:append="showPassword = !showPassword"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="signUp">新規登録</v-btn>
          </v-card-actions>

          <v-card-text>
            <v-form>
              <v-text-field
                label="確認コード"
                name="code"
                prepend-icon="mdi-checkbox-marked"
                type="text"
                v-model="code"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="confirmSignUp">承認</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from "vue";
import { Auth, API } from "aws-amplify";

export default Vue.extend({
  data: () => ({
    username: "",
    password: "",
    address: "",
    showPassword: false,
    code: ""
  }),
  methods: {
    async signUp(): Promise<void> {
      try {
        const user = await Auth.signUp({
          username: this.username,
          password: this.password,
          attributes: {
            email: this.address
          }
        });
        console.log({ user });
        alert("登録アドレスに確認コードを送付しました。");
      } catch (error) {
        console.log(error);
        alert("新規登録に失敗しました。");
      }
    },
    async confirmSignUp(): Promise<void> {
      try {
        await Auth.confirmSignUp(this.username, this.code);
        alert("新規登録できました");
      } catch (error) {
        console.log(error);
        alert("失敗しました。");
      }
    }
  }
});
</script>
