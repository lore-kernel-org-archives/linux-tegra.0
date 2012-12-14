From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=203/3=5D=20ARM=3A=20tegra=3A=20drm=3A=20use=20new=20EMC=20clock=20scaling=20API=20to=20reserve=20DC=20bandwidth?=
Date: Fri, 14 Dec 2012 21:14:46 +0100
Message-ID: <1355516086-11116-4-git-send-email-dev@lynxeye.de>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355516086-11116-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reserve bandwidth for the scanout to make sure EMC is not reducing DRAM
performance too far, which would cause visual corruption.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 11 +++++++++++
 1 Datei ge=C3=A4ndert, 11 Zeilen hinzugef=C3=BCgt(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0744103..8f32ebc 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <memory/tegra_emc_performance.h>
=20
 #include <mach/clk.h>
=20
@@ -269,6 +270,16 @@ static int tegra_crtc_mode_set(struct drm_crtc *cr=
tc,
 	tegra_dc_writel(dc, 0xff00, DC_WIN_BLEND_NOKEY);
 	tegra_dc_writel(dc, 0xff00, DC_WIN_BLEND_1WIN);
=20
+	/*
+	 * Let EMC know the bandwidth requirements of this mode.
+	 * Calculation is naive but works for now. We have to revisit this on=
ce
+	 * we support planes and dpms.
+	 */
+	value =3D mode->hdisplay * mode->vdisplay * bpp * drm_mode_vrefresh(m=
ode);
+	tegra_emc_request_bandwidth(dc->pipe ?
+					TEGRA_EMC_SC_DCB : TEGRA_EMC_SC_DC,
+				    value);
+
 	return 0;
 }
=20
--=20
1.7.11.7
