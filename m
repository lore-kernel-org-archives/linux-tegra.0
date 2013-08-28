From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/6] HDMI support for Tegra114 Dalmore
Date: Wed, 28 Aug 2013 18:48:36 +0300
Message-ID: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset adds HDMI support for the Tegra114 Dalmore board.
Tested with 1080p DVI and HDMI monitors.

Mikko Perttunen (6):
  host1x: hdmi: Add Tegra114 support
  host1x: hdmi: Detect whether display is connected with HDMI or DVI
  host1x: hdmi: Enable Vdd earlier for hotplug/DDC
  clk: tegra114: Initialize clocks needed for HDMI
  ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
  ARM: tegra: Add HDMI to Tegra114 Dalmore device tree

 arch/arm/boot/dts/tegra114-dalmore.dts |  17 ++++
 arch/arm/boot/dts/tegra114.dtsi        |  42 +++++++++
 drivers/clk/tegra/clk-tegra114.c       |   3 +
 drivers/gpu/host1x/dev.c               |   1 +
 drivers/gpu/host1x/drm/drm.c           |   1 +
 drivers/gpu/host1x/drm/hdmi.c          | 125 ++++++++++++++++++++++++---
 drivers/gpu/host1x/drm/hdmi.h          | 152 +++++++++++++++++++++++++++++++++
 7 files changed, 331 insertions(+), 10 deletions(-)

-- 
1.8.1.5
