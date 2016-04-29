From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 2/4]: PCI: tegra: Changes for v4.7-rc1
Date: Fri, 29 Apr 2016 17:52:27 +0200
Message-ID: <1461945149-23686-3-git-send-email-thierry.reding@gmail.com>
References: <1461945149-23686-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461945149-23686-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 87d66f280672800c9c2ad1ce3b7a993ce1e04769:

  phy: tegra: Add Tegra210 support (2016-04-29 16:44:48 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.7-pci

for you to fetch changes up to 6fe7c187e026c8b610df9dda7d9befc70cbfd169:

  PCI: tegra: Support per-lane PHYs (2016-04-29 16:47:54 +0200)

This depends on pull request 1/4 containing the PHY changes.

Thierry

----------------------------------------------------------------
PCI: tegra: Changes for v4.7-rc1

These patches update the Tegra PCIe host bridge controller device tree
bindings and driver to cope with per-lane PHYs on Tegra124 and later.

----------------------------------------------------------------
Thierry Reding (3):
      Merge branch 'for-4.7/phy' into for-4.7/pci
      dt-bindings: pci: tegra: Update for per-lane PHYs
      PCI: tegra: Support per-lane PHYs

 .../bindings/pci/nvidia,tegra20-pcie.txt           | 224 ++++++++++++++++++-
 drivers/pci/host/pci-tegra.c                       | 244 +++++++++++++++++++--
 2 files changed, 446 insertions(+), 22 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
