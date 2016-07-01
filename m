From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 2/6] dt-bindings: tegra: Updates for v4.8-rc1
Date: Fri,  1 Jul 2016 16:50:22 +0200
Message-ID: <20160701145026.25760-2-thierry.reding@gmail.com>
References: <20160701145026.25760-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160701145026.25760-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.8-dt-bindings

for you to fetch changes up to 7eb28ee074bcbf0d6507e896be11280a558dbf17:

  dt-bindings: tegra: Add Apalis TK1 device tree binding documentation (2016-07-01 16:36:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: tegra: Updates for v4.8-rc1

A couple of fixes for the Tegra XUSB controller and Tegra XUSB pad
controller bindings, as well as the addition of some compatible strings
for Tegra-based boards.

----------------------------------------------------------------
Jon Hunter (2):
      dt-bindings: phy: Fix description of Tegra210 PHY nodes
      dt-bindings: usb: Fix Tegra XUSB example

Marcel Ziswiler (2):
      dt-bindings: tegra: Add Colibri T30 device tree binding documentation
      dt-bindings: tegra: Add Apalis TK1 device tree binding documentation

 Documentation/devicetree/bindings/arm/tegra.txt                   | 4 ++++
 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt       | 2 +-
 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt    | 8 ++++----
 3 files changed, 9 insertions(+), 5 deletions(-)
