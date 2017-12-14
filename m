From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] PCI: tegra: Configuration space mapping cleanups and fixes
Date: Thu, 14 Dec 2017 14:45:41 +0100
Message-ID: <20171214134545.11143-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Saga <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Lorenzo,

This cleans up a few oddities that I found while reviewing and testing
the patch

	[PATCH V3 1/2] PCI: tegra: refactor config space mapping code

that Vidya Sagar sent out earlier. The first three patches are mostly
cleanup and admittedly somewhat bikeshedding in nature. They could've
been just review comments, but I thought I'd just submit them as a
series of patches since I had already typed them up anyway.

The last patch gets rid of an artificial restriction regarding the
mapping address and does a bit of simplification.

These are technically incremental on top of the original patch, but if
you prefer, feel free to squash them into that patch.

I've tested these on all of Tegra20, Tegra30, Tegra124, Tegra210 and
Tegra186.

Thanks,
Thierry

Thierry Reding (4):
  PCI: tegra: Clarify configuration space address computations
  PCI: tegra: Reorder parameters in offset computations
  PCI: tegra: Consolidate I/O register variables
  PCI: tegra: Remove artificial mapping restriction

 drivers/pci/host/pci-tegra.c | 71 ++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

-- 
2.15.1
