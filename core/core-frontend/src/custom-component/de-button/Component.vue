<template>
  <el-button
    v-if="propValue['url']"
    @click="downloadFile(propValue)"
    style="margin-right: 12px"
    type="primary"
  >
    Button1
  </el-button>
  <el-dropdown v-else trigger="hover">
    <el-button @click="queryAllReportInfo()" style="margin-right: 12px" type="primary">
      Button2
    </el-button>
    <template #dropdown>
      <el-dropdown-menu class="drop-style">
        <el-dropdown-item v-for="item in fileUrlList" :key="item.id" @click="updateUrl(item)">
          {{ item.name }}
        </el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
</template>

<script setup lang="ts">
import { downloadOneFile, queryAllReportApi } from '@/api/visualization/visualizationBackground'
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
let fileUrlList: any = reactive([])
const updateUrl = (item: any) => {
  propValue.value['url'] = item.apiUrl
  propValue.value['name'] = item.name
}
const downloadFile = (item: any) => {
  downloadOneFile(item.url).then(res => {
    const blob = new Blob([res], { type: 'application/vnd.ms-excel' })
    const link = document.createElement('a')
    link.style.display = 'none'
    link.href = URL.createObjectURL(blob)
    link.download = item.name
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
  })
}

const queryAllReportInfo = () => {
  queryAllReportApi().then(response => {
    fileUrlList = response.data
  })
  console.log('file:' + fileUrlList)
}
</script>

<style lang="less" scoped></style>
