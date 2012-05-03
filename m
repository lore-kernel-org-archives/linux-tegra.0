From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/2] dmaengine: tegra: add dma driver
Date: Thu,  3 May 2012 13:11:27 +0530
Message-ID: <1336030889-32269-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series add NVIDIA Tegra's APB dma controller driver based on dmaengine.
There is already old driver in mach-tegra/dma.c and we want to get rid
of this old style driver which exposes private apis.
Once this driver get through, there will be series of patches to move all
existing driver to use the dmaengine based driver and old mach-tegra/dma.c
will get deleted. This driver has following feature than old one:
- better queue managment.
- Cyclic transfer supports.
- Platform driver.
- Full support for device tree.
- Multiple bug fixes over old driver.

Changes from V1:
- Incorportaed review comments from Vinod.
- get rid of the tegra_dma header.
- Having clock control through runtime pm.
- Remove regmap support.

Laxman Dewangan (2):
  dma: dmaengine: add slave req id in slave_config
  dmaengine: tegra: add dma driver

 drivers/dma/Kconfig       |   13 +
 drivers/dma/Makefile      |    1 +
 drivers/dma/tegra_dma.c   | 1714 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/dmaengine.h |    4 +
 4 files changed, 1732 insertions(+), 0 deletions(-)
 create mode 100644 drivers/dma/tegra_dma.c
