package io.dataease.datasource.dao.auto.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author fit2cloud
 * @since 2023-09-26
 */
@TableName("core_report_btn")
public class CoreReportBtn implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 描述
     */
    private Long reportApiId;

    /**
     * 类型
     */
    private String apiUrl;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getReportApiId() {
        return reportApiId;
    }

    public void SetReportApiId(Long reportApiId) {
        this.reportApiId = reportApiId;
    }

    @Override
    public String toString() {
        return "CoreDatasource{" +
        "id = " + id +
        ", name = " + name +
        ", reportApiId = " + reportApiId +
        "}";
    }
}
