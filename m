From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/4] iommu/tegra-smmu: A set of small fixes
Date: Thu, 19 Dec 2019 16:29:10 -0800
Message-ID: <20191220002914.19043-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, joro@8bytes.org
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

This series of patches are some small fixes for tegra-smmu, mainly
tested Tegra210 with downstream kernel. As we only enabled limited
clients for Tegra210 on mainline tree, I am not sure how critical
these fixes are, so not CCing stable tree.

Nicolin Chen (4):
  memory: tegra: Correct reset value of xusb_hostr
  iommu/tegra-smmu: Do not use PAGE_SHIFT and PAGE_MASK
  iommu/tegra-smmu: Fix iova->phy translation
  iommu/tegra-smmu: Prevent race condition between map and unmap

 drivers/iommu/tegra-smmu.c      | 29 ++++++++++++++++++++++++-----
 drivers/memory/tegra/tegra210.c |  2 +-
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.17.1
