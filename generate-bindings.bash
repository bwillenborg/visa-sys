#!/usr/bin/bash

OUTPUT_FILE='src/prebind/bindings.rs'
INCLUDE_FILE='include/wrapper.h'
SAMPLE_FILE='sample.rs'
HEADER_DIRS='/usr/include/ni-visa/'
TYPE_PATTERN='Vi.*'
FUNCTION_PATTERN='vi.*'
VAR_PATTERN='VI.*'

bindgen "$INCLUDE_FILE" \
	-o "$OUTPUT_FILE" \
	--allowlist-type "$TYPE_PATTERN" \
	--allowlist-function "$FUNCTION_PATTERN" \
	--allowlist-var "$VAR_PATTERN" \
	--default-macro-constant-type signed \
	-- \
	-I "$HEADER_DIRS" &&
	cp "$OUTPUT_FILE" "$SAMPLE_FILE"
