package com.github.RianNegreiros.productcataloging.resources.exceptions;

import java.util.ArrayList;
import java.util.List;

public class ValidationError extends StandardError {
    private List<FieldMessages> errors = new ArrayList<>();

    public List<FieldMessages> getErrors() {
        return errors;
    }

    public void addError(String fieldName, String message) {
        errors.add(new FieldMessages(fieldName, message));;
    }
}
