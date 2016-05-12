From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V6 0/3] Add support for Tegra210 ADMA
Date: Thu, 12 May 2016 15:23:42 +0100
Message-ID: <1463063025-28605-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra210 Audio DMA (ADMA) controller which is part
of the Audio Processing Engine and used for transferring audio data.

V6 changes:
- Removed stub function tegra_adma_prep_slave_sg() as it is no longer
  needed.

V5 changes:
- Removed APE and APE2APB clocks as these clocks rightfully belong
  in the ACONNECT bus driver [0] and the ADMA is child of this device.
  Dropped power-domain from DT binding as this will be handled by
  ACONNECT bus driver as well.
- Minor update to case statement formatting based upon feedback from
  Vinod.
- Make ADMA dependent on Tegra210 as this is the only device
  (currently) that supports it.

V4 changes:
- Updated DT binding to include 'power-domains' entry for handling
  the APE power domain inconjunction with runtime-pm.
- Added missing clocks to the DT binding that were being handled by
  the bootloader.
- Added support for PM_CLK to simplify clock handling

V3 changes:
- Updated DT binding per feedback from Mark and Stephen
- Fixed up items mentioned by Vinod

V2 changes:
- Re-worked device-tree binding

[0] http://marc.info/?l=devicetree&m=146193804830747&w=2

Jon Hunter (3):
  Documentation: DT: Add binding documentation for NVIDIA ADMA
  dmaengine: tegra-adma: Add support for Tegra210 ADMA
  MAINTAINERS: Update Tegra DMA maintainers

 .../bindings/dma/nvidia,tegra210-adma.txt          |  55 ++
 MAINTAINERS                                        |   5 +-
 diff.txt                                           |  10 +
 drivers/dma/Kconfig                                |  14 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/tegra210-adma.c                        | 840 +++++++++++++++++++++
 6 files changed, 923 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
 create mode 100644 diff.txt
 create mode 100644 drivers/dma/tegra210-adma.c

-- 
2.1.4
