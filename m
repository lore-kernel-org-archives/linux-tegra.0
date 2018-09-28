From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 0/5] Tegra xHCI genpd support
Date: Fri, 28 Sep 2018 15:11:45 +0100
Message-ID: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series add genpd support for the Tegra xHCI device that requires
more than one power-domain to operate.

This series is making changes to more than one subsystem and at first
glance may look like a maintainers nightmare. However, my proposal is
this, once reviewed and people are happy ...
1. Patches 1-3 should be merged first. Patches 1 can go via the Tegra
   tree and 2-3 via the USB tree.
2. Once patches 1-3 are accepted, then 4 and 5 can be merged via the
   Tegra tree.

Changes since V1:
- Dropped unneeded patch to export symbol for genpd API
- Added patch to power-off XUSB domains
- Slight re-work to Tegra xHCI driver changes to simplify clean-up path.

Jon Hunter (5):
  dt-bindings: usb: xhci-tegra: Add power-domain details
  usb: xhci: tegra: Power-off power-domains on removal
  usb: xhci: tegra: Add genpd support
  soc/tegra: pmc: Don't power-up XUSB power-domains
  arm64: dts: tegra210: Add power-domains for xHCI

 .../bindings/usb/nvidia,tegra124-xusb.txt          |  8 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  2 +
 drivers/soc/tegra/pmc.c                            | 16 ----
 drivers/usb/host/xhci-tegra.c                      | 92 +++++++++++++++++++---
 4 files changed, 91 insertions(+), 27 deletions(-)

-- 
2.7.4
