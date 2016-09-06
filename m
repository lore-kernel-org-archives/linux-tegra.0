From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v3 0/2] Add memcpy support for tegra210-adma
Date: Tue,  6 Sep 2016 11:42:00 -0700
Message-ID: <cover.1473186743.git.nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org

This series of patches add memcpy support for tegra210 ADMA engine.

Changlog
v2->v3 (Suggested by Jon)
 * PATCH-2: Remove "TODO" mark and limit the buffer size up to 1GB
v1->v2 (Suggested by Vinod)
 * PATCH-1: Split the cyclic pre-check to a separate patch
 * PATCH-2: Add ADMA_CH_CTRL_MODE to unify the marcos
 * PATCH-2: Set operation mode depending on cyclic
 * PATCH-2: Add TODO comment at period_len
 * PATCH-2: Revise the commit log

Nicolin Chen (2):
  dmaengine: tegra210-adma: Add pre-check for cyclic callback
  dmaengine: tegra210-adma: Add memcpy support

 drivers/dma/tegra210-adma.c | 108 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 96 insertions(+), 12 deletions(-)

-- 
2.1.4
