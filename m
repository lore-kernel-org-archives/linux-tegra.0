From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/4] NVIDIA Tegra Video Decoder driver improvements
Date: Mon,  3 Jun 2019 00:37:05 +0300
Message-ID: <20190602213712.26857-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series cleans up some of minor shortcomings that are caused by
checkpatch recommendations that are not very applicable for the driver.
Then IOMMU support is added to the driver and now it can handle sparse
memory buffers that GPU hands to VDE in a default kernel configuration
on Tegra30+.

Dmitry Osipenko (4):
  staging: media: tegra-vde: Remove BIT() macro from UAPI header
  staging: media: tegra-vde: Manually pack UAPI structures
  staging: media: tegra-vde: Add IOMMU support
  staging: media: tegra-vde: Defer dmabuf's unmapping

 drivers/staging/media/tegra-vde/Kconfig       |   1 +
 drivers/staging/media/tegra-vde/Makefile      |   1 +
 .../staging/media/tegra-vde/dmabuf-cache.c    | 223 ++++++++++++++++++
 drivers/staging/media/tegra-vde/iommu.c       | 146 ++++++++++++
 drivers/staging/media/tegra-vde/trace.h       |   1 +
 drivers/staging/media/tegra-vde/uapi.h        |  48 ++--
 .../media/tegra-vde/{tegra-vde.c => vde.c}    | 212 ++++++-----------
 drivers/staging/media/tegra-vde/vde.h         | 105 +++++++++
 8 files changed, 574 insertions(+), 163 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
 create mode 100644 drivers/staging/media/tegra-vde/iommu.c
 rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (88%)
 create mode 100644 drivers/staging/media/tegra-vde/vde.h

-- 
2.21.0
