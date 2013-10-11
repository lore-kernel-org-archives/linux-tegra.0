From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/4] ARM: tegra: add CPU hot-plug and idle support for Tegra124
Date: Fri, 11 Oct 2013 17:57:28 +0800
Message-ID: <1381485452-3561-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The CPU hot-plug and idle function for Tegra124 was identical to Tegra114,
so we share the driver with it.

Note:
This patch series depends on the patch series below.
* [PATCH 0/5] Tegra124 clock support
* [PATCH V2 0/6] ARM: tegra: basic support for Tegra124 SoC
* [PATCH] ARM: tegra: add clock properties for devices of Tegra124

V2:
* fix the label name of "not_ca9" in patch 3/4 of this series

Joseph Lo (4):
  clk: tegra124: add wait_for_reset and disable_clock for
    tegra_cpu_car_ops
  ARM: tegra: CPU hotplug support for Tegra124
  ARM: tegra: make tegra_resume can work with current and later chips
  ARM: tegra: enable CPU idle for Tegra124

 arch/arm/mach-tegra/Makefile        |  4 ++++
 arch/arm/mach-tegra/cpuidle.c       |  4 +++-
 arch/arm/mach-tegra/hotplug.c       |  2 ++
 arch/arm/mach-tegra/reset-handler.S | 13 +++++--------
 drivers/clk/tegra/clk-tegra124.c    | 26 ++++++++++++++++++++++++++
 5 files changed, 40 insertions(+), 9 deletions(-)

-- 
1.8.4
