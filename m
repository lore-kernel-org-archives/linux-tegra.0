From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/6] usb: host: xhci-tegra: Add Tegra186 XUSB support
Date: Mon,  1 Apr 2019 12:40:44 +0200
Message-ID: <20190401104050.31355-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This series introduces support for XUSB to the Tegra186 SoC. This is
mostly the same as on earlier generations in that it provides an XHCI
compatible interface with a bit of vendor-specific glue. Perhaps the
most notable change is the removal of the IPFS wrapper. Patches for
the UPHY related changes that control the PHYs for the XUSB controller
were merged into v5.1.

This version is a rebase of the series posted here:

    http://patchwork.ozlabs.org/project/linux-tegra/list/?series=88193

There have been no code changes and I collected Reviewed-by and Acked-by
tags.

Greg, can you pick up patches 1-3 with Rob's and Mathias' Acked-by,
respectively? I'll pick up patches 4-6 into the Tegra tree.

Thanks,
Thierry

JC Kuo (2):
  usb: host: xhci-tegra: Selectively program IPFS
  usb: host: xhci-tegra: Add Tegra186 XUSB support

Thierry Reding (4):
  dt-bindings: usb: xhci-tegra: Add Tegra186 support
  arm64: tegra: Add XUSB and pad controller on Tegra186
  arm64: tegra: Enable XUSB on P2771
  arm64: tegra: Remove regulator hacks on Jetson TX2

 .../bindings/usb/nvidia,tegra124-xusb.txt     |   4 +
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   | 115 +++++++++++++++
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  42 ++----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      | 135 ++++++++++++++++++
 drivers/usb/host/xhci-tegra.c                 |  68 ++++++---
 5 files changed, 320 insertions(+), 44 deletions(-)

-- 
2.21.0
