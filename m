From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=206/6=5D=20drm=3A=20tegra=3A=20program=20only=20one=20window=20during=20modeset?=
Date: Wed, 19 Dec 2012 22:38:57 +0100
Message-ID: <1355953137-31563-7-git-send-email-dev@lynxeye.de>
References: <1355953137-31563-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355953137-31563-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The intention is to program exactly WIN_A, not WIN_A and possibly
others.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 3 +--
 1 Datei ge=C3=A4ndert, 1 Zeile hinzugef=C3=BCgt(+), 2 Zeilen entfernt(=
-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b256574..3475bd9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -223,8 +223,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crt=
c,
 	win.stride =3D crtc->fb->pitches[0];
=20
 	/* program window registers */
-	value =3D tegra_dc_readl(dc, DC_CMD_DISPLAY_WINDOW_HEADER);
-	value |=3D WINDOW_A_SELECT;
+	value =3D WINDOW_A_SELECT;
 	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
=20
 	tegra_dc_writel(dc, win.fmt, DC_WIN_COLOR_DEPTH);
--=20
1.7.11.7
