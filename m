From: Christopher Freeman <cfreeman@nvidia.com>
Subject: [PATCH v1 0/3] Tegra DMA residue improvements
Date: Tue, 6 May 2014 14:22:20 -0700
Message-ID: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, swarren@nvidia.com, vinod.koul@intel.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Christopher Freeman <cfreeman@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

A collection of patches to improve Tegra's DMA residual reporting

Christopher Freeman (3):
  dma: tegra: finer granularity residual for tx_status
  dma: tegra: change interrupt-related log levels
  dma: tegra: avoid int overflow for transferred count

 drivers/dma/tegra20-apb-dma.c |   74 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 9 deletions(-)

-- 
1.7.9.5
