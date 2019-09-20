From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] mmc: tegra: Use proper DMA mask
Date: Fri, 20 Sep 2019 16:53:15 +0200
Message-ID: <20190920145317.11972-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Nicolin Chen <nicoleotsuka@gmail.com>, inux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this puts together the two patches from this thread:

	http://patchwork.ozlabs.org/patch/1146705/

there hasn't been any activity there for a couple of weeks, so I thought
I'd just throw them together and update the second patch to work on top
of the first one.

The goal here is to avoid the use of bounce buffers and fix IOVA space
issues when an IOMMU gets involved. The first patch introduces the
->set_dma_mask() host operation as proposed by Adrian and the second
patch is just a rebase of Nicolin's Tegra SDHCI patch that uses the new
host operation rather than doing it as part of ->enable_dma().

Thierry


Adrian Hunter (1):
  mmc: sdhci: Let drivers define their DMA mask

Nicolin Chen (1):
  mmc: tegra: Implement ->set_dma_mask()

 drivers/mmc/host/sdhci-tegra.c | 48 ++++++++++++++++++++--------------
 drivers/mmc/host/sdhci.c       | 12 +++------
 drivers/mmc/host/sdhci.h       |  1 +
 3 files changed, 33 insertions(+), 28 deletions(-)

-- 
2.23.0
