<template>
  <div id="wrapper">
   <div class="progressContainer motai" v-if="downloadPercent > 0">
     <div class="progress" :style="{width:Speed+'%'}">
          <b>{{Speed}}</b>
     </div>
     <div>{{tip}}</div>
   </div>

  </div>
</template>

<script>
  export default {
    name: 'landing-page',

    data () {
      return {
        tip: '',
        downloadPercent: 0
      }
    },

    computed: {
      Speed() {
        return parseInt(this.downloadPercent);
      }
    },

    mounted () {
      const _this = this
      this.$electron.ipcRenderer.send('checkForUpdate')
      this.$electron.ipcRenderer.on('message', (event, text) => {
        // console.log(arguments);
        _this.tips = text
      })
      this.$electron.ipcRenderer.on('downloadProgress', (event, progressObj) => {
        console.log(progressObj)
        _this.downloadPercent = progressObj.percent || 0
      })
      this.$electron.ipcRenderer.on('isUpdateNow', () => {
        _this.$electron.ipcRenderer.send('isUpdateNow')
      })
  },

    methods: {
    }
  }
</script>

<style>
.progressContainer {
  overflow: hidden;
  height: 20px;
  width: 96%;
  border-radius: 10px;
  background-color: #ddd;
  margin-left: 2%;
}
.progress {
  background-color: #1c8de0;
  border-radius: 10px;
  height: 20px;
  line-height: 20px;
}
b {
  color: #fff;
  font-weight: 100;
  font-size: 12px;
  position: absolute;
  left: 40%;
}
.motai{

}
</style>
