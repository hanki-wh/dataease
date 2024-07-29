<template>
  <el-button
    v-if="propValue['url']"
    @click="downloadFile()"
    style="margin-right: 12px"
    type="primary"
  >
    Button1
  </el-button>
  <el-button v-else @click="queryAllReportInfo()" style="margin-right: 12px" type="primary">
    Button2
  </el-button>
</template>

<script setup lang="ts">
import { queryAllReportApi } from '@/api/visualization/visualizationBackground'
import { reactive, toRefs } from 'vue'
const props = defineProps({
  propValue: {
    type: String,
    required: true,
    default: ''
  },
  element: {
    type: Object,
    default() {
      return {
        propValue: null
      }
    }
  }
})
const { propValue } = toRefs(props)
const state = reactive({
  fileUrlList: {}
})
// const newComponent = componentName => {
//   eventBus.emit('handleNew', { componentName: componentName, innerType: componentName })
// }
const downloadFile = () => {
  const fileUrl = 'https://example.com/path/to/file.pdf'
  const link = document.createElement('a')
  link.href = fileUrl
  link.download = 'file.pdf'
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

const queryAllReportInfo = () => {
  queryAllReportApi().then(response => {
    state.fileUrlList = response.data
  })
  console.log('file:' + state.fileUrlList)
}
</script>

<style lang="less" scoped></style>
