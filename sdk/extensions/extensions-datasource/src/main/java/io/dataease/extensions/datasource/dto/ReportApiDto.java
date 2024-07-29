package io.dataease.extensions.datasource.dto;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Data
public class ReportApiDto implements Serializable {


    @Serial
    private static final long serialVersionUID = 1075287571828910220L;

    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    /**
     * 数据源名称
     */
    private String name;

    /**
     * 描述
     */
    private String description;

    private String apiUrl;
}
