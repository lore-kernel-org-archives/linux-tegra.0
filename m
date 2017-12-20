From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [RFC PATCH v2 0/1] Fix drm driver hang on tegra124-nyan-big
Date: Wed, 20 Dec 2017 11:32:22 +0000
Message-ID: <cover.1513768618.git.guillaume.tucker@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch was initially sent along with another one to fix a
first hang in the nouveau drm driver[1].  I'm now sending it
again as a separate patch as it's to fix a second hang which is
not strictly related.  It is hidden by the first hang though, as
this happens later on during the driver initialisation.

The issue this is addressing is due to a rework[2] of the driver
which apparently wasn't fully tested on tegra124 and possibly
also on tegra210.  The sor->clk_out is not used on these
platforms as HDMI and DP are both not supported (but eDP is), so
trying to assign the parent clock to clk_out does nothing.  The
driver then goes on to configure the clock and PLL registers in
tegra_sor_edp_enable and this is where it hangs.

As this is hard to debug further without full documentation or a
hardware debugger, this patch essentially makes the driver do
what it used to do on these platforms before the rework
(i.e. assign the parent clock to sor->clk instead).  There might
be a more correct way of fixing this, hence the RFC.

[1] https://patchwork.kernel.org/patch/10124637/
[2] e1335e2f0cfc ("drm/tegra: sor: Reimplement pad clock")

Guillaume Tucker (1):
  drm/tegra: sor: Fix hang on tegra124 due to NULL clk_out

 drivers/gpu/drm/tegra/sor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
2.11.0
