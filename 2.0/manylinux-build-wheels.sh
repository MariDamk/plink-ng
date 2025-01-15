#!/bin/bash
set -exuo pipefail

function repair_wheel {
    wheel="$1"
    if ! auditwheel show "$wheel"; then
        echo "Skipping non-platform wheel $wheel"
    else
        auditwheel repair "$wheel" --plat manylinux2014_x86_64 -w wheelhouse/
    fi
}

for PYBIN in /opt/python/*/bin; do
    # running into https://github.com/pypa/distutils/issues/283 with pypy 3.8?
    if [ "${PYBIN}" = "/opt/python/pp38-pypy38_pp73/bin" ]; then
        continue
    fi
    "${PYBIN}/pip" install -r Python/dev-requirements.txt
    "${PYBIN}/pip" wheel Python/ --no-deps -w wheelhouse/
done

for whl in wheelhouse/*.whl; do
    repair_wheel "$whl"
done

/opt/python/cp311-cp311/bin/pip install twine
/opt/python/cp311-cp311/bin/twine upload wheelhouse/*manylinux*
