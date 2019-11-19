#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd350175393eb001be51ffc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd350175393eb001be51ffc
curl -s -X POST https://api.stackbit.com/project/5dd350175393eb001be51ffc/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dd350175393eb001be51ffc/webhook/build/publish > /dev/null
