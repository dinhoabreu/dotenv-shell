#!/bin/bash


main() {

    cd "$( dirname "${BASH_SOURCE[0]}" )" || exit 1

    # shellcheck disable=SC1091
    source ../dotenv.sh
    assert_equal "$TEST_UNQUOTED" 'a=1 b=2 c=3' 'Testing unquoted'
    assert_equal "$TEST_SINGLE_QUOTED" '1 2 3 4' 'Testing single quoted'
    assert_equal "$TEST_DOUBLE_QUOTED" '1 2 3 4' 'Testing double quoted'
    assert_equal "$TEST_INTERPOLATION" 'a=1 b=2 c=3 d=4' 'Testing interpolation'
}

assert_equal() {

    local value=$1 expected=$2 label=$3

    if [ "$value" == "$expected" ]; then
        echo "$label: ok"
        return 0
    fi
    echo "$label: fail [expected: '$expected' value: '$value']"
    return 1
}

main "$@"