From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=204/6=5D=20drm=3A=20tegra=3A=20remove=20redundant=20tegra2=5Ftmds=5Fconfig=20entry?=
Date: Wed, 19 Dec 2012 22:38:55 +0100
Message-ID: <1355953137-31563-5-git-send-email-dev@lynxeye.de>
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

The 720p and 1080p entries are completely redundant, as we are matching
the table entries against <=3Dpclk.
Also generalize the comment, as we are using those table entries even
when driving other modes than the standard TV ones.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 19 +++----------------
 1 Datei ge=C3=A4ndert, 3 Zeilen hinzugef=C3=BCgt(+), 16 Zeilen entfern=
t(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.=
c
index 81ea934..e060c7e 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -149,7 +149,7 @@ struct tmds_config {
 };
=20
 static const struct tmds_config tegra2_tmds_config[] =3D {
-	{ /* 480p modes */
+	{ /* slow pixel clock modes */
 		.pclk =3D 27000000,
 		.pll0 =3D SOR_PLL_BG_V17_S(3) | SOR_PLL_ICHPMP(1) |
 			SOR_PLL_RESISTORSEL | SOR_PLL_VCOCAP(0) |
@@ -163,21 +163,8 @@ static const struct tmds_config tegra2_tmds_config=
[] =3D {
 			DRIVE_CURRENT_LANE1(DRIVE_CURRENT_7_125_mA) |
 			DRIVE_CURRENT_LANE2(DRIVE_CURRENT_7_125_mA) |
 			DRIVE_CURRENT_LANE3(DRIVE_CURRENT_7_125_mA),
-	}, { /* 720p modes */
-		.pclk =3D 74250000,
-		.pll0 =3D SOR_PLL_BG_V17_S(3) | SOR_PLL_ICHPMP(1) |
-			SOR_PLL_RESISTORSEL | SOR_PLL_VCOCAP(1) |
-			SOR_PLL_TX_REG_LOAD(3),
-		.pll1 =3D SOR_PLL_TMDS_TERM_ENABLE | SOR_PLL_PE_EN,
-		.pe_current =3D PE_CURRENT0(PE_CURRENT_6_0_mA) |
-			PE_CURRENT1(PE_CURRENT_6_0_mA) |
-			PE_CURRENT2(PE_CURRENT_6_0_mA) |
-			PE_CURRENT3(PE_CURRENT_6_0_mA),
-		.drive_current =3D DRIVE_CURRENT_LANE0(DRIVE_CURRENT_7_125_mA) |
-			DRIVE_CURRENT_LANE1(DRIVE_CURRENT_7_125_mA) |
-			DRIVE_CURRENT_LANE2(DRIVE_CURRENT_7_125_mA) |
-			DRIVE_CURRENT_LANE3(DRIVE_CURRENT_7_125_mA),
-	}, { /* 1080p modes */
+	},
+	{ /* high pixel clock modes */
 		.pclk =3D UINT_MAX,
 		.pll0 =3D SOR_PLL_BG_V17_S(3) | SOR_PLL_ICHPMP(1) |
 			SOR_PLL_RESISTORSEL | SOR_PLL_VCOCAP(1) |
--=20
1.7.11.7
