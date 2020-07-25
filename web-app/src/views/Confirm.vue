<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="8" md="4">
        <v-card class="elevation-12">
          <v-toolbar color="primary" dark flat>
            <v-toolbar-title>Confirm</v-toolbar-title>
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
                id="code"
                label="code"
                name="code"
                prepend-icon="mdi-lock"
                type="text"
                v-model="code"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="confirmSignUp">確認</v-btn>
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
    code: ""
  }),
  methods: {
    async confirmSignUp(): Promise<void> {
      try {
        await Auth.confirmSignUp(this.username, this.code);
      } catch (error) {
        console.log("error confirming sign up", error);
      }
    }
  }
});
</script>
