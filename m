From: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 0/3] ARM: iommu: tegra: Add initial Tegra IOMMU driver
Date: Thu, 17 Nov 2011 13:01:04 +0200
Message-ID: <1321527667-12923-1-git-send-email-hdoyu@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

This patchset adds support for Tegra IOMMU driver for Tegra2/3.

Presently this driver is specific to Tegra platform, but some of
functionalities could be replaced with a generic IOMMU framework. This
is expected to ease finding similarities with different platforms,
with the intention of solving problems once in a generic framework
which everyone can use.

Originally this was developed under git://nv-tegra.nvidia.com/linux-2.6.git,
and they are cleaned up for upstreaming.

Hiroshi DOYU (3):
  ARM: iommu: tegra/common: Initial support for IOVMM driver
  ARM: iommu: tegra2: Initial support for GART driver
  ARM: iommu: tegra3: Initial support for SMMU driver

 arch/arm/mach-tegra/include/mach/iovmm.h |  283 +++++++
 drivers/iommu/Kconfig                    |   34 +
 drivers/iommu/Makefile                   |    3 +
 drivers/iommu/tegra-gart.c               |  357 ++++++++
 drivers/iommu/tegra-iovmm.c              |  936 ++++++++++++++++++++
 drivers/iommu/tegra-smmu.c               | 1358 ++++++++++++++++++++++++++++++
 6 files changed, 2971 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/include/mach/iovmm.h
 create mode 100644 drivers/iommu/tegra-gart.c
 create mode 100644 drivers/iommu/tegra-iovmm.c
 create mode 100644 drivers/iommu/tegra-smmu.c
