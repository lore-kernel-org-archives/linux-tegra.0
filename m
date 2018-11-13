From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v2 0/3] Fixes for Tegra soctherm
Date: Tue, 13 Nov 2018 18:06:04 +0800
Message-ID: <1542103567-5521-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series fixed some issues for Tegra soctherm

Main changes from v1:
1. Acked by Thierry Reding <treding@nvidia.com> for the patch
"thermal: tegra: fix memory allocation".
2. Print out the sensor name when register failed.
2. Remove patch "thermal: tegra: fix coverity defect"

Wei Ni (3):
  thermal: tegra: continue if sensor register fails
  thermal: tegra: remove unnecessary warnings
  thermal: tegra: fix memory allocation

 drivers/thermal/tegra/soctherm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.7.4
