From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/9] arm64: tegra: Initial Tegra234 VDK support
Date: Thu, 16 Jul 2020 16:18:47 +0200
Message-ID: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This set of patches introduces support for the new Tegra234 SoC, also
known as Orin. Currently no silicon of this chip is available, so the
support added here is for a simulation platform known as VDK.

Note that this simulation platform is not available publicly. However
the goal is to use the simulation platform as a way of upstreaming as
much support as possible ahead of tapeout.

Once actual silicon becomes available, the plan is to stop supporting
the simulation platform and shift focus to real hardware.

Thierry

Sandipan Patra (1):
  soc/tegra: fuse: Add Tegra186 and Tegra194 SoC IDs

Thierry Reding (8):
  dt-bindings: tegra: Add Tegra234 VDK compatible
  dt-bindings: fuse: tegra: Add missing compatible strings
  dt-bindings: fuse: tegra: Document Tegra234 compatible string
  soc/tegra: fuse: Extract tegra_get_platform()
  soc/tegra: fuse: Implement tegra_is_silicon()
  soc/tegra: fuse: Add Tegra234 support
  firmware: tegra: Enable BPMP support on Tegra234
  arm64: tegra: Initial Tegra234 VDK support

 .../devicetree/bindings/arm/tegra.yaml        |   4 +
 .../bindings/fuse/nvidia,tegra20-fuse.txt     |   6 +-
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 191 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |   3 +-
 drivers/mailbox/tegra-hsp.c                   |   9 +-
 drivers/soc/tegra/Kconfig                     |  10 +
 drivers/soc/tegra/fuse/fuse-tegra.c           |   8 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c         |  30 +++
 drivers/soc/tegra/fuse/fuse.h                 |  10 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |  19 ++
 include/dt-bindings/clock/tegra234-clock.h    |  14 ++
 include/dt-bindings/reset/tegra234-reset.h    |  10 +
 include/soc/tegra/fuse.h                      |   5 +
 15 files changed, 353 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
 create mode 100644 include/dt-bindings/clock/tegra234-clock.h
 create mode 100644 include/dt-bindings/reset/tegra234-reset.h

-- 
2.27.0
