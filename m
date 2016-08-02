From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] Tegra fixes for v4.8-rc1
Date: Tue, 2 Aug 2016 11:34:25 +0100
Message-ID: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are a few fixes for Tegra. The clock fix appears to be a bug that
has been around for long time, but it is a simple one-liner and so I
have included here.

The interrupt polarity is also a longer term bug, but has not been
exposed until changes to the IRQ subsystem in v4.8.

Jon Hunter (4):
  drm/tegra: dc: Don't disable display power partition
  ARM: tegra: Correct polarity for Tegra114 PMIC interrupt
  clk: tegra: Correct bit width for PMC output clock mux
  arm64: tegra: Add clock and reset names for audio powergate

 arch/arm/boot/dts/tegra114-dalmore.dts   |  2 +-
 arch/arm/boot/dts/tegra114-roth.dts      |  2 +-
 arch/arm/boot/dts/tegra114-tn7.dts       |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  2 ++
 drivers/clk/tegra/clk-tegra-pmc.c        |  2 +-
 drivers/gpu/drm/tegra/dc.c               | 21 ++++++++++++++-------
 6 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
