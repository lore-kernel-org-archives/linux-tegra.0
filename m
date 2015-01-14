From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 0/9] Add generic PM domain support for Tegra SoC
Date: Wed, 14 Jan 2015 14:19:23 +0800
Message-ID: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry & Peter,

This is a RFC series for the previous discussion about generic PM domain.
Could you have a quick review and give some comments? So that I can know
whether I should continue this work and add more support for other Tegra
SoCs and boards then.

Patch 2 & 3 are moved from the series "Add suspend/resume support for GK20A"
and improved according to the review comments.

Patch 4 is based on Thierry's work and adds DT support, etc.

Patch 5 - 9 are the examples to demonstrate the generic PM domains on
Tegra124/JetsonTK1. We can add support for other Tegra SoCs later if you
guys have no objection to this proof of concept.

Thanks,
Vince

Thierry Reding (1):
  soc: tegra: pmc: Add generic PM domain support

Vince Hsu (8):
  reset: add of_reset_control_get_by_index()
  memory: tegra: add mc flush support
  memory: tegra: add flush operation for Tegra124 memory clients
  ARM: tegra: add PM domain device nodes to Tegra124 DT
  ARM: tegra: add GPU power supply to Jetson TK1 DT
  drm/tegra: dc: remove the power sequence from driver
  PCI: tegra: remove the power sequence from driver
  ata: ahci_tegra: remove power sequence from driver

 arch/arm/boot/dts/tegra124-jetson-tk1.dts   |   4 +
 arch/arm/boot/dts/tegra124.dtsi             |  73 +++-
 drivers/ata/ahci_tegra.c                    |  11 -
 drivers/gpu/drm/tegra/dc.c                  |  46 +--
 drivers/memory/tegra/mc.c                   | 132 +++++++
 drivers/memory/tegra/tegra114.c             |   2 +-
 drivers/memory/tegra/tegra124.c             | 108 ++++-
 drivers/memory/tegra/tegra30.c              |   2 +-
 drivers/pci/host/pci-tegra.c                |  20 -
 drivers/reset/core.c                        |  47 ++-
 drivers/soc/tegra/pmc.c                     | 589 ++++++++++++++++++++++++++++
 include/dt-bindings/power/tegra-powergate.h |  30 ++
 include/linux/reset.h                       |   9 +
 include/soc/tegra/mc.h                      |  41 +-
 14 files changed, 1027 insertions(+), 87 deletions(-)
 create mode 100644 include/dt-bindings/power/tegra-powergate.h

-- 
1.9.1
