<template>
  <el-drawer
    title="数据表"
    v-model="drawer"
    :direction="direction"
    :before-close="handleClose"
    size="600px"
  >
    <div class="modal-container">
      <div class="continer">
        <div class="middle-continer">
          <div class="gap"></div>
          <div>
            <span class="font">基础信息</span>
            <div class="gap"></div>
            <div>
              <span>名称</span>
              <el-input placeholder="请输入名称" v-model="nameInput" clearable> </el-input>
            </div>
            <div class="url">
              <div>请求</div>
              <div class="url-input">
                <el-select v-model="desUrl" placeholder="请选择">
                  <el-option label="GET" value="GET"></el-option>
                  <el-option label="POST" value="POST"></el-option>
                  <el-option label="PUT" value="PUT"></el-option>
                  <el-option label="DELETE" value="DELETE"></el-option>
                </el-select>
                <el-input placeholder="请输入完整地址" v-model="apiUrl"></el-input>
              </div>
            </div>
          </div>
          <div class="gap btndiv">
            <el-button @click="handleSave" class="btn" type="primary">保存</el-button>
          </div>
          <el-table :data="tableData" stripe style="width: 100%">
            <el-table-column prop="name" label="名称" width="100"></el-table-column>
            <el-table-column prop="description" label="method"></el-table-column>
            <el-table-column label="地址" width="280"
              ><template #default="scope">
                https://localhost:8100{{ scope.row.apiUrl }}
              </template></el-table-column
            >
          </el-table>
          <div></div>
        </div>
      </div>
    </div>
  </el-drawer>
</template>

<script setup>
import { ref } from 'vue'
import { saveReportApi, getReportApi } from '@/api/datasource'
import { ElMessage, ElButton } from 'element-plus-secondary'

const tableData = ref([])

const drawer = ref(false)
const direction = ref('rtl')
const nameInput = ref('')
const desUrl = ref('')
const apiUrl = ref('')

const init = async () => {
  drawer.value = true
  await getReportApi().then(res => {
    if (res) {
      tableData.value = res
    }
  })
}

const handleClose = done => {
  drawer.value = false
  done()
}

const handleSave = () => {
  // 处理保存逻辑
  saveReportApi({
    name: nameInput.value,
    description: desUrl.value,
    apiUrl: apiUrl.value
  }).then(res => {
    if (res) {
      ElMessage.success('保存成功')
      nameInput.value = ''
      desUrl.value = ''
      apiUrl.value = ''
      drawer.value = false
    } else {
      ElMessage.error('保存失败')
    }
  })
}

defineExpose({
  init
})
</script>

<style lang="less" scoped>
.modal-continer {
  width: 80%;
  height: 100%;
  padding: 10px 25px;
  display: flex;
  flex-direction: column;
}

.gap {
  margin-top: 8px;
  margin-bottom: 8px;
}
.header {
  font-size: 20px;
  font-weight: bold;
  margin-top: 20px;
}
.black-border {
  border: 1px solid black;
  margin-top: 15px;
  margin-bottom: 20px;
  width: 100%;
}
.font {
  font-size: 16px;
  font-weight: bold;
  color: black;
}

.url {
  display: flex;
  flex-direction: column;
  margin-top: 15px;
}

.url-input {
  display: flex;
}

.btndiv {
  display: flex;
  flex-direction: row-reverse;
}
</style>
