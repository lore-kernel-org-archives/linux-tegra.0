From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=5D=20drm=3A=20tegra=3A=20check=20HDMI=20sink=20capability?=
Date: Mon, 17 Dec 2012 18:59:23 +0100
Message-ID: <1355767163-5423-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Check if sink is HDMI capable when enabling an output. This disables
HDMI audio/infoframes if we are talking to a plain DVI sink. All things
except this check are already in place.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 3 +++
 1 Datei ge=C3=A4ndert, 3 Zeilen hinzugef=C3=BCgt(+)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.=
c
index ab40164..32ea7d4 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -673,6 +673,9 @@ static int tegra_output_hdmi_enable(struct tegra_ou=
tput *output)
 	usleep_range(1000, 2000);
 	tegra_periph_reset_deassert(hdmi->clk);
=20
+	/* if the connected sink is not HDMI capable fall back to plain DVI *=
/
+	hdmi->dvi =3D !drm_detect_hdmi_monitor((struct edid *)output->edid);
+
 	tegra_dc_writel(dc, VSYNC_H_POSITION(1),
 			DC_DISP_DISP_TIMING_OPTIONS);
 	tegra_dc_writel(dc, DITHER_CONTROL_DISABLE | BASE_COLOR_SIZE888,
--=20
1.7.11.7
