From: Damien Lespiau <damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/14] gpu: host1x: Port the HDMI vendor infoframe code the common helpers
Date: Mon, 19 Aug 2013 16:58:59 +0100
Message-ID: <1376927945-26635-9-git-send-email-damien.lespiau@intel.com>
References: <1376927945-26635-1-git-send-email-damien.lespiau@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376927945-26635-1-git-send-email-damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I just wrote the bits to define and pack HDMI vendor specific infoframe=
=2E
Port the host1x driver to use those so I can refactor the infoframe cod=
e
a bit more.

This changes the length of the infoframe payload from 6 to 5, which is
enough for the "frame packing" stereo format.

v2: Pimp up the commit message with the note about the length
    (Ville Syrj=C3=A4l=C3=A4)

Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstr=C3=B6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Damien Lespiau <damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/drm/hdmi.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdm=
i.c
index 01097da..b548918 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -539,7 +539,7 @@ static void tegra_hdmi_setup_audio_infoframe(struct=
 tegra_hdmi *hdmi)
=20
 static void tegra_hdmi_setup_stereo_infoframe(struct tegra_hdmi *hdmi)
 {
-	struct hdmi_vendor_infoframe frame;
+	struct hdmi_hdmi_infoframe frame;
 	unsigned long value;
 	u8 buffer[10];
 	ssize_t err;
@@ -551,26 +551,10 @@ static void tegra_hdmi_setup_stereo_infoframe(str=
uct tegra_hdmi *hdmi)
 		return;
 	}
=20
-	memset(&frame, 0, sizeof(frame));
+	hdmi_hdmi_infoframe_init(&frame);
+	frame.s3d_struct =3D HDMI_3D_STRUCTURE_FRAME_PACKING;
=20
-	frame.type =3D HDMI_INFOFRAME_TYPE_VENDOR;
-	frame.version =3D 0x01;
-	frame.length =3D 6;
-
-	frame.data[0] =3D 0x03; /* regid0 */
-	frame.data[1] =3D 0x0c; /* regid1 */
-	frame.data[2] =3D 0x00; /* regid2 */
-	frame.data[3] =3D 0x02 << 5; /* video format */
-
-	/* TODO: 74 MHz limit? */
-	if (1) {
-		frame.data[4] =3D 0x00 << 4; /* 3D structure */
-	} else {
-		frame.data[4] =3D 0x08 << 4; /* 3D structure */
-		frame.data[5] =3D 0x00 << 4; /* 3D ext. data */
-	}
-
-	err =3D hdmi_vendor_infoframe_pack(&frame, buffer, sizeof(buffer));
+	err =3D hdmi_hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to pack vendor infoframe: %zd\n",
 			err);
--=20
1.8.3.1
