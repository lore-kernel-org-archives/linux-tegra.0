From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/5] Tegra xHCI genpd support
Date: Wed, 26 Sep 2018 13:27:33 +0100
Message-ID: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series add genpd support for the Tegra xHCI device that requires
more than one power-domain to operate.

This series is making changes to more than one subsystem and at first
glance may look like a maintainers nightmare. However, my proposal is
this, once reviewed and people are happy ...
1. Patches 1-3 should be merged first. Note there is a dependency
   between patches 1 and 3 such that 3 can only be merged once 1 has
   been accepted.
2. Once patches 1-3 are accepted, then 4 and 5 can be merged via the
   Tegra tree.

Jon Hunter (5):
  PM / Domains: Export symbol for genpd_dev_pm_attach_by_name
  dt-bindings: usb: xhci-tegra: Add power-domain details
  usb: xhci: tegra: Add genpd support
  soc/tegra: pmc: Don't power-up XUSB power-domains
  arm64: dts: tegra210: Add power-domains for xHCI

 .../bindings/usb/nvidia,tegra124-xusb.txt          |  8 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  2 +
 drivers/base/power/domain.c                        |  1 +
 drivers/soc/tegra/pmc.c                            | 16 ----
 drivers/usb/host/xhci-tegra.c                      | 88 +++++++++++++++++++---
 5 files changed, 88 insertions(+), 27 deletions(-)

-- 
2.7.4
