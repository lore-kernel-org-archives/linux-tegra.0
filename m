From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] arm64: tegra: A few DT updates for Tegra
Date: Sun, 12 Jul 2020 11:25:03 +0100
Message-ID: <20200712102506.23686-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series adds ...

1. Support for Tegra19 Jetson Xavier NX
2. Support for the DFLL on Tegra210 Jetson Nano
3. Fixes VBUS supply for Tegra186 Jetson TX2

Jon Hunter (2):
  arm64: tegra: Enable DFLL support on Jetson Nano
  arm64: tegra: Populate VBUS for USB3 on Jetson TX2

Thierry Reding (1):
  arm64: tegra: Add support for Jetson Xavier NX

 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |   1 +
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 343 ++++++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 296 +++++++++++++++
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  37 ++
 5 files changed, 678 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

-- 
2.17.1
