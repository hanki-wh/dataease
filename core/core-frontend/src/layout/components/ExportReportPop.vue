<template>
  <el-dialog :visible="open">
    <div class="modal-container">
      <div class="continer">
        <div class="header">数据表</div>
        <div class="black-border"></div>
        <div class="middle-continer">
          <div class="title">
            <div>连接API</div>
            <div>提取数据</div>
          </div>
          <div class="gap"></div>
          <div>
            <span>基础信息</span>
            <div>
              <span>名称</span>
              <el-input placeholder="请输入名称" v-model="input" clearable> </el-input>
            </div>
            <div class="url">
              <div>请求</div>
              <div class="url-input">
                <el-select v-model="value" placeholder="请选择">
                  <el-option label="GET" value="1"></el-option>
                  <el-option label="POST" value="2"></el-option>
                </el-select>
                <el-input placeholder="请输入完整地址" v-model="input"></el-input>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div><button @click="handleSave">save</button></div>
    </div>
  </el-dialog>
</template>

<script setup>
import { ref } from 'vue'
import { saveReportApi } from '@/api/datasource'

const open = ref(false)
const input = ref('')
const value = ref('')

const handleSave = () => {
  // 处理保存逻辑
  saveReportApi({
    name: input.value,
    url: value.value
  })
}
</script>

<style lang="less" scoped>
.continer {
  width: 36%;
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
}
.title {
  display: flex;
  gap: 50px;
}

.url {
  display: flex;
  flex-direction: column;
  margin-top: 15px;
}

.url-input {
  display: flex;
}
</style>
