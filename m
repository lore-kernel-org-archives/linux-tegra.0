From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 1/3] ARM: tegra: rework PCIe regulators
Date: Mon, 23 Jun 2014 15:23:44 -0600
Message-ID: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch reworks the set of regulators that the Tegra PCIe driver
uses, so that the driver and DT bindings more correctly model what's
really going on in HW.

I've made this a separate branch in case it needs to be pulled into the
PCIe tree to resolve any conflicts. Any branch that adds Tegra124
support to the PCIe driver will need to be based on this branch, and
such patches might show up for 3.17, and be taken through the ARM tree
so we can manage our own dependencies.

----------------------------------------------------------------

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:

  Linux 3.16-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.17-pcie-regulators

for you to fetch changes up to f4dfa465e03f0faf3f52d0e13a2a912c0998ddce:

  ARM: tegra: Remove legacy PCIe power supply properties

----------------------------------------------------------------

Thierry Reding (5):
      PCI: tegra: Overhaul regulator usage
      ARM: tegra: Add new PCIe regulator properties
      PCI: tegra: Implement accurate power supply scheme
      PCI: tegra: Remove deprecated power supply properties
      ARM: tegra: Remove legacy PCIe power supply properties

 .../bindings/pci/nvidia,tegra20-pcie.txt        |  30 +++-
 arch/arm/boot/dts/tegra20-harmony.dts           |   8 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi         |   7 +-
 arch/arm/boot/dts/tegra20-trimslice.dts         |   8 +-
 arch/arm/boot/dts/tegra30-beaver.dts            |  12 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi           |  11 +-
 drivers/pci/host/pci-tegra.c                    | 148 +++++++++++--------
 7 files changed, 148 insertions(+), 76 deletions(-)
