From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 0/4] Fixes for Tegra soctherm
Date: Mon, 5 Nov 2018 17:32:30 +0800
Message-ID: <1541410354-19090-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series fixed some issues for Tegra soctherm

Wei Ni (4):
  thermal: tegra: continue if sensor register fails
  thermal: tegra: remove unnecessary warnings
  thermal: tegra: fix memory allocation
  thermal: tegra: fix coverity defect

 drivers/thermal/tegra/soctherm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.7.4
