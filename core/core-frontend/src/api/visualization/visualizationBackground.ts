import request from '@/config/axios'

export const queryVisualizationBackground = () =>
  request.get({ url: '/visualizationBackground/findAll' })

export const queryAllReportApi = () => request.get({ url: '/datasource/queryAllReportApi' })
export const downloadOneFile = (fileUrl: any) => request.get({ url: fileUrl })
