From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 05/11] drm/panel: add support for Samsung LTN140AT29 panel
Date: Thu, 15 Jan 2015 17:12:17 +0100
Message-ID: <1421338359-27467-6-git-send-email-tomeu.vizoso@collabora.com>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Dylan Reid <dgreid@chromium.org>, Simon Glass <sjg@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=46rom: St=C3=A9phane Marchesin <marcheu@chromium.org>

This panel is used by the Nyan Blaze board and supported by the simple-=
panel
driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
index e95385b..5ee1d2c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -722,6 +722,29 @@ static const struct panel_desc samsung_ltn101nt05 =
=3D {
 	},
 };
=20
+static const struct drm_display_mode samsung_ltn140at29_301_mode =3D {
+	.clock =3D 76300,
+	.hdisplay =3D 1366,
+	.hsync_start =3D 1366 + 64,
+	.hsync_end =3D 1366 + 64 + 48,
+	.htotal =3D 1366 + 64 + 48 + 128,
+	.vdisplay =3D 768,
+	.vsync_start =3D 768 + 2,
+	.vsync_end =3D 768 + 2 + 5,
+	.vtotal =3D 768 + 2 + 5 + 17,
+	.vrefresh =3D 60,
+};
+
+static const struct panel_desc samsung_ltn140at29_301 =3D {
+	.modes =3D &samsung_ltn140at29_301_mode,
+	.num_modes =3D 1,
+	.bpc =3D 6,
+	.size =3D {
+		.width =3D 320,
+		.height =3D 187,
+	},
+};
+
 static const struct of_device_id platform_of_match[] =3D {
 	{
 		.compatible =3D "auo,b101aw03",
@@ -778,6 +801,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
 		.compatible =3D "samsung,ltn101nt05",
 		.data =3D &samsung_ltn101nt05,
 	}, {
+		.compatible =3D "samsung,ltn140at29-301",
+		.data =3D &samsung_ltn140at29_301,
+	}, {
 		/* sentinel */
 	}
 };
--=20
1.9.3
