From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/2] Tegra PCI multiplatform fixes
Date: Thu, 13 Nov 2014 20:37:35 +0100
Message-ID: <1415907457-3147-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Two of the registered fixups in the Tegra PCI driver
would be executed unconditionally and potentially
harm PCI support on other platforms than Tegra when
running a multiplatform kernel.

I've tested that this doesn't alter PCI behavior on both
T30 Beaver and T124 Jetson-TK1.

Lucas Stach (2):
  PCI: tegra: apply relaxed ordering fixup only on Tegra
  PCI: tegra: remove bogus bridge setup fixup

 drivers/pci/host/pci-tegra.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.1.1
