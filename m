From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v5 0/3] Fixes for Tegra soctherm
Date: Mon, 3 Dec 2018 13:55:20 +0800
Message-ID: <1543816523-10525-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series fixed some issues for Tegra soctherm

Main changes from v4:
1. fixed for the parsing sensor id.
2. keep warning for missing critical trips.

Main changes from v3:
1. updated codes for parsing sensor id, per Thierry's comments

Main changes from v2:
1. add codes to parse sensor id to avoid registration
failure.

Main changes from v1:
1. Acked by Thierry Reding <treding@nvidia.com> for the patch
"thermal: tegra: fix memory allocation".
2. Print out the sensor name when register failed.
2. Remove patch "thermal: tegra: fix coverity defect"

Wei Ni (3):
  thermal: tegra: remove unnecessary warnings
  thermal: tegra: fix memory allocation
  thermal: tegra: parse sensor id before sensor register

 drivers/thermal/tegra/soctherm.c | 51 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 5 deletions(-)

-- 
2.7.4
