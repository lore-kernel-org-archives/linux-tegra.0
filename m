From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/7] Tegra PCIe end point config space map code refactoring
Date: Mon, 23 Oct 2017 20:05:05 +0530
Message-ID: <1508769312-12465-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

PCIe host controller in Tegra SoCs has 1GB of aperture available
for mapping end points config space, IO and BARs. In that, currently
256MB is being reserved for mapping end points configuration space
which leaves less memory space available for mapping end points BARs
on some of the platforms.
This patch series attempts to use only 4K space from 1GB aperture to
access end points configuration space.

Currently, this change benefits T20 and T186 in saving (i.e. repurposed
to use for BAR mapping) physical space as well as kernel virtual mapping space,
it saves only kernel virtual address space in T30, T124, T132 and T210.

NOTE: Both driver and DT changes are inter-dependent and hence need to go together

Testing Done on T124, T210 & T186:
 Enumeration and basic functionality of immediate devices
 Enumeration of devices behind a PCIe switch
 Complete 4K configuration space access

Vidya Sagar (7):
  PCI: tegra: refactor config space mapping code
  ARM: tegra: limit PCIe config space mapping to 4K for T20
  ARM: tegra: limit PCIe config space mapping to 4K for T30
  ARM: tegra: limit PCIe config space mapping to 4K for T124
  ARM64: tegra: limit PCIe config space mapping to 4K for T132
  ARM64: tegra: limit PCIe config space mapping to 4K for T210
  ARM64: tegra: limit PCIe config space mapping to 4K for T186

 arch/arm/boot/dts/tegra124.dtsi          |   2 +-
 arch/arm/boot/dts/tegra20.dtsi           |   8 +--
 arch/arm/boot/dts/tegra30.dtsi           |   2 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi |   8 +--
 arch/arm64/boot/dts/nvidia/tegra210.dtsi |   2 +-
 drivers/pci/host/pci-tegra.c             | 109 +++++++++----------------------
 7 files changed, 42 insertions(+), 91 deletions(-)

-- 
2.7.4
