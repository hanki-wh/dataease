package io.dataease.extensions.datasource.dto;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import java.io.Serial;
import java.io.Serializable;
import lombok.Data;

@Data
public class ReportBtnDto implements Serializable {


    @Serial
    private static final long serialVersionUID = 1075287571828910220L;

    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    @JsonSerialize(using= ToStringSerializer.class)
    private Long reportApiId;
}
