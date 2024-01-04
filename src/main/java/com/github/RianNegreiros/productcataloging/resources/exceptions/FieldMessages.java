package com.github.RianNegreiros.productcataloging.resources.exceptions;

public class FieldMessages {
    private String fieldName;
    private String message;

    public FieldMessages() {
    }

    public FieldMessages(String fieldName, String message) {
        this.fieldName = fieldName;
        this.message = message;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
