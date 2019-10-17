#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5da89049c9b47c0019bbb606/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5da89049c9b47c0019bbb606
curl -s -X POST https://api.stackbit.com/project/5da89049c9b47c0019bbb606/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5da89049c9b47c0019bbb606/webhook/build/publish > /dev/null
