From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] PCI: tegra: Changes for v4.8-rc1
Date: Fri,  1 Jul 2016 17:00:56 +0200
Message-ID: <20160701150056.26537-3-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Bjorn,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-pci

for you to fetch changes up to 0f32700faed919946e21e9d1dc4d74ae8f1b1226:

  PCI: tegra: Correctly program PADS_REFCLK_CFG* registers (2016-06-30 15:30:16 +0200)

There's a minor conflict between this and your pci/host-request-windows
branch, let me know if you'd like me to rebase on top of that.

Thierry

----------------------------------------------------------------
PCI: tegra: Changes for v4.8-rc1

A couple of cleanups and preparation work for 64-bit ARM support, as
well as fixes for writing the PADS_REFCLK_CFG* registers.

----------------------------------------------------------------
Stephen Warren (2):
      PCI: tegra: Actually program PADS_REFCLK_CFG* on recent SoCs
      PCI: tegra: Correctly program PADS_REFCLK_CFG* registers

Thierry Reding (3):
      PCI: tegra: Make register definitions consistent
      PCI: tegra: Use pci_remap_iospace()
      PCI: tegra: Stop setting pcibios_min_mem

 drivers/pci/host/pci-tegra.c | 54 ++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 29 deletions(-)
