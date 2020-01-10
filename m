From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/2] PCI: Add MCFG quirks for Tegra194 host controllers
Date: Sat, 11 Jan 2020 00:44:58 +0530
Message-ID: <20200110191500.9538-1-vidyas@nvidia.com>
References: <20200106082709.14370-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200106082709.14370-1-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The PCIe controller in Tegra194 SoC is not completely ECAM-compliant.
With the current hardware design limitations in place, ECAM can be enabled
only for one controller (C5 controller to be precise) with bus numbers
starting from 160 instead of 0. A different approach is taken to avoid this
abnormal way of enabling ECAM for just one controller but to enable
configuration space access for all the other controllers. In this approach,
ops are added through MCFG quirk mechanism which access the configuration
spaces by dynamically programming iATU (internal AddressTranslation Unit)
to generate respective configuration accesses just like the way it is
done in DesignWare core sub-system.
To increase the size of ECAM, a device-tree change is pushed in this series
to move the IO window from 32-bit PCIe aperture to 64-bit PCIe aperture leaving
the entire 32MB of 32-bit aperture for configuration space access.

V3:
* Pushed a device-tree change in the series to enable more space for ECAM

Vidya Sagar (2):
  arm64: tegra: Re-order PCIe aperture mappings to support ACPI boot
  PCI: Add MCFG quirks for Tegra194 host controllers

 arch/arm64/boot/dts/nvidia/tegra194.dtsi   |  36 ++++----
 drivers/acpi/pci_mcfg.c                    |   7 ++
 drivers/pci/controller/dwc/Kconfig         |   3 +-
 drivers/pci/controller/dwc/Makefile        |   2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c | 102 +++++++++++++++++++++
 include/linux/pci-ecam.h                   |   1 +
 6 files changed, 131 insertions(+), 20 deletions(-)

-- 
2.17.1
