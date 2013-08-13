From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 0/3] ARM: Allow PCI host drivers to be unloaded
Date: Tue, 13 Aug 2013 13:12:23 +0200
Message-ID: <1376392346-14127-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

This is a set of experimental patches that allow ARM PCI host drivers to
be unloaded. The first two patches enhance the ARM core PCI code with
functions to tear down fixed PCI I/O mappings and unregister a PCI host
bridge. The third patch uses the new functionality to allow the Tegra
PCIe driver to unbind from a device.

I'm sending this as an RFC because, while I've been able to successfully
unbind and rebind the Tegra PCIe driver and verifying that a NIC
connected via PCIe still works after each new probe, I haven't fully
investigated yet whether there may be memory leaks due to missing
cleanup.

Thierry

Thierry Reding (3):
  ARM: Allow unmapping of fixed PCI I/O mappings
  ARM: Introduce pci_common_exit()
  PCI: tegra: Support driver unbinding

 arch/arm/include/asm/io.h       |  1 +
 arch/arm/include/asm/mach/pci.h |  6 ++++++
 arch/arm/kernel/bios32.c        | 29 ++++++++++++++++++++++++++---
 arch/arm/mm/ioremap.c           |  6 ++++++
 drivers/pci/host/pci-tegra.c    | 37 ++++++++++++++++++++++++++++++++++++-
 5 files changed, 75 insertions(+), 4 deletions(-)

-- 
1.8.3.4
