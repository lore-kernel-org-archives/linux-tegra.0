From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v5 03/11] drm/panel: add support for Samsung LTN140AT29 panel
Date: Thu, 12 Feb 2015 09:50:57 +0100
Message-ID: <1423731078-26681-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=46rom: St=C3=A9phane Marchesin <marcheu@chromium.org>

This panel is used by the Nyan Blaze board and supported by the simple-=
panel
driver.

Signed-off-by: St=C3=A9phane Marchesin <marcheu@chromium.org>
[tomeu.vizoso@collabora.com: add device tree binding document]
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .../bindings/panel/samsung,ltn140at29-301.txt      |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++=
++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,ltn=
140at29-301.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung,ltn140at29=
-301.txt b/Documentation/devicetree/bindings/panel/samsung,ltn140at29-3=
01.txt
new file mode 100644
index 0000000..e7f969d
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung,ltn140at29-301.tx=
t
@@ -0,0 +1,7 @@
+Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
+
+Required properties:
+- compatible: should be "samsung,ltn140at29-301"
+
+This binding is compatible with the simple-panel binding, which is spe=
cified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
index 39806c3..2da2285 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -779,6 +779,29 @@ static const struct panel_desc samsung_ltn101nt05 =
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
@@ -841,6 +864,9 @@ static const struct of_device_id platform_of_match[=
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
