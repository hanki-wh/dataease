<template>
  <el-dropdown v-if="editMode == 'edit'" trigger="hover">
    <el-button style="width: 100%; height: 100%" type="primary"> 外部报表导出 </el-button>
    <template #dropdown>
      <el-dropdown-menu class="drop-style">
        <el-dropdown-item v-for="item in fileUrlList" :key="item.id" @click="updateUrl(item)">
          {{ item.name }}
        </el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>

  <el-button v-else @click="downloadFile(propValue)" style="margin-right: 12px" type="primary">
    外部报表导出
  </el-button>
</template>

<script setup lang="ts">
import { downloadOneFile, queryAllReportApi } from '@/api/visualization/visualizationBackground'
import { dvMainStoreWithOut } from '@/store/modules/data-visualization/dvMain'
import { reactive, toRefs, onMounted } from 'vue'
import { storeToRefs } from 'pinia'
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
const dvMainStore = dvMainStoreWithOut()
const { editMode } = storeToRefs(dvMainStore)
let fileUrlList: any = reactive([])
const updateUrl = (item: any) => {
  propValue.value['url'] = item.apiUrl
  propValue.value['name'] = item.name
}
const downloadFile = (item: any) => {
  downloadOneFile(item.url).then(res => {
    const blob = new Blob([res], { type: 'text/plain' })
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
}
onMounted(() => {
  queryAllReportInfo()
})
</script>
<style lang="less" scoped>
.drop-style {
  width: 180px;
  :deep(.ed-dropdown-menu__item:not(.is_disabled):focus) {
    color: inherit;
    background-color: rgba(31, 35, 41, 0.1);
  }
}
</style>
