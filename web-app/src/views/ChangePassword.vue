<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>パスワード変更</v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-form>
              <v-text-field
                id="oldPassword"
                label="現在のパスワード"
                name="oldPassword"
                prepend-icon="mdi-lock"
                :append-icon="showOldPassword ? 'mdi-eye' : 'mdi-eye-off'"
                :type="showOldPassword ? 'text' : 'password'"
                v-model="oldPassword"
                @click:append="showOldPassword = !showOldPassword"
              ></v-text-field>
              <v-text-field
                id="newPassword"
                label="新しいパスワード"
                name="newPassword"
                prepend-icon="mdi-lock"
                :append-icon="showNewPassword ? 'mdi-eye' : 'mdi-eye-off'"
                :type="showNewPassword ? 'text' : 'password'"
                v-model="newPassword"
                @click:append="showNewPassword = !showNewPassword"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="changePassword"
              >パスワード変更</v-btn
            >
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
    oldPassword: "",
    newPassword: "",
    address: "",
    showOldPassword: false,
    showNewPassword: false
  }),
  methods: {
    async changePassword(): Promise<void> {
      try {
        const user = await Auth.currentAuthenticatedUser();
        await Auth.changePassword(user, this.oldPassword, this.newPassword);
        alert("パスワードを変更しました。");
      } catch (err) {
        console.log(err);
      }
    }
  }
});
</script>
