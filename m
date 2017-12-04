From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/2] Tegra PCIe end point config space map code refactoring
Date: Mon, 4 Dec 2017 23:23:48 +0530
Message-ID: <1512410030-21038-1-git-send-email-vidyas@nvidia.com>
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
This patch series attempts to map only 4K space from 1GB aperture to
access end points configuration space.

Currently, this change can benefit T20 and T186 in saving (i.e. repurposed
to use for BAR mapping) physical space as well as kernel virtual mapping space,
it saves only kernel virtual address space in T30, T124, T132 and T210.

NOTE: Since T186 PCIe DT entry is not yet present in main line (it is currently
merged to 'for-4.15/arm64/dt' branch), nothing gets broken with this change for T186.
For older platforms (T20, T30, T124, T132, T210), this change works fine without any
DT modifications

Testing Done on T124, T210 & T186:
 Enumeration and basic functionality of immediate devices
 Enumeration of devices behind a PCIe switch
 Complete 4K configuration space access

Vidya Sagar (2):
  PCI: tegra: refactor config space mapping code
  ARM64: tegra: limit PCIe config space mapping to 4K for T186

 arch/arm64/boot/dts/nvidia/tegra186.dtsi |   8 +-
 drivers/pci/host/pci-tegra.c             | 125 ++++++++++---------------------
 2 files changed, 44 insertions(+), 89 deletions(-)

-- 
2.7.4
