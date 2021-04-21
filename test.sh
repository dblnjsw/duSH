#! /bin/bash
set -e
{ # try
  cd asdq &&
  echo '111'
}||{ # catch
  echo '失败'
  exit 1
}
echo '222'