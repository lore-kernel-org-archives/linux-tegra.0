Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794106023;
	b=Z7Ajl5sq1ppT27aK4ZnDkPNPlq3Fz5DJcxTg2ggG3Es9upi5cfMFKR9Q99gZHUyh6LgN
	 SY5jb/9jtCNQMsoenmG2yXHeF5kCA0O0FrLUMSXeE9jkE8Ma9nEKc+41HXODsLJaktVTD
	 O/YjZ0CYvFnVUClI7W5Se+vGdkOkfKyfPTXXC2pW8f8mHXfZ3Czs9c9PTThUaNun1xG2t
	 BnjoGQFHqguMv5PC2V937UIDq3a9kwk2s1g87RYnsU1FhtpviSslIOv8ZITyXCU0nTs44
	 FgQZWhqkqx1MAo1mOS9jHG86dHd/7D8iqiJ6VoF8Iq9zh6tbWHUBPHoa/NNbqnq4RIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106023;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Jw5WrrpD4rkxZry1Jgz9645HneA+oD0QP510BD17yrI=;
	b=NtEPfTkG11s8mGi0W91ZJaNJ7ci+D3NUiEpeBd3OV0uBRaJ7d8PTXPdgl+5KY0U0qtz/
	 VGrW9UCDamVFQecUkm1EG/esFLrra4/ZFInOeYLWKYK22mvUbYb/5at5NUp5LHYeK671Z
	 ZYjQnJrhDPFDahg0LZSRo0qFnUt4ywEgAg6GNOpFbyKOV5eoMVJ0AxtX28HS9etMxCGeu
	 uzE5JKhRqYZERknjatZMM9fbgL5y98a97gr1L1tRkANgGCuGtCzUI+HRL8ztmDNPIjiQx
	 Y0+dt2mKR+9bgKc9kUnz5AmL0vhPcWhxt094NeyUWfCRe9Y6LBDlQV59oUAZM/WC2Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYaVgxhL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2111606A31A;
	Sun,  8 Nov 2026 02:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYaVgxhL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794106022;
	b=FZCTjwbfr39Tb1vxQOIIloMEY7D+1tmrIf1KGgVlHdYXZj/9T1h4s/4lU+MjCgqggfeI
	 TNdWQxqfD5KsLQbF14715FD2NJxndj0ayVTd8MBxmxG5X5IlxSp23m9q01IzS8vVq3BiZ
	 zk2MLEs+O97X5dfIW7bI1ZUWQOThu6eV4IrdHxHh//r+o6bqeYKpwJT1p/DvFI87iuCTR
	 jjfzsOrUF3BQeZUSk3aOg+rWxmCI903bLOLaoIwsHQUS0rvAKTEIxaOX4j+rWQHafC0e8
	 vVwqbkL8bvhGCKzjINLZ/Mx4xq7YSUnwEHUH8n0QP9UnWxJ554LHkXDZ/p74edwYilQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794106022;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Jw5WrrpD4rkxZry1Jgz9645HneA+oD0QP510BD17yrI=;
	b=VbKbJdVa124/5syaFzQOiKnGH5FOWlikU3fYIc1kFpqoYFtb278+HEe0TNf5ZUaIXyHb
	 ol8hgBURtFFdzo3HAED0IZU4zED+De5d5yfWi0c6qFwXWTBx4ss2FIsNgu3ljba5FyrNF
	 mZQrjccCvkZBpDFNy1sNnPXBu2s7x3Y1ZN4VJsallo6ERGNGMfA/xkf7BuWXn9gErqRqj
	 r9GKiZMjaLDnbCjX0GXAnVYnzXGGYElTH5NeHwwc5GPxxLK4Ou7MqiHunLDJOQMecmdpX
	 6oNINWWS2YsoKZ6k4N57JDc0o2eLvMd4p/H+S3GhT3Q0GQhM9zMMCcWQo98CfcNAjDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A52A01F0089F;
	Sun,  8 Nov 2026 02:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794106022;
	bh=Jw5WrrpD4rkxZry1Jgz9645HneA+oD0QP510BD17yrI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=EYaVgxhLCQQ+gpqwGRWq5zu7V5PLhu3Ib+5j8mFD35EgUwUjbVq8/4zaan15GvBu7
	 bGE4zfFy3ZBRWcvq1zlYFbe/pWFC2qhhJOFVl/hvyAAlcd0dbDLHLIc5RlikthTkLv
	 s+iTIXZnyqTlYh6819J4jMn59jy224YZyyA/lJeVCpnGvDrfYji1y3jaFey2sZkGFE
	 Oggw+uyV7MZ+d8pdtQubv97vXXbAHr2DPJ88v3b71dzqlmofJso0IAQWOMAwavvE5P
	 dOB9S5SEcB0+Z2/sr6ugK0iWwSLz60cNKATTsUCx3n9uPjBL6zAt5W3cQd7Tg+enM3
	 E7tq77+MgR7oA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3FE747DB8;
	Sun,  8 Nov 2026 02:47:00 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 18:47:00 -0800
Subject: [PATCH] media: staging: tegra-video: csi: use active state for
 frame interval
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-staging-csi-interval-v1-1-4860ac021065@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgQo3VqxQXMU7TKRIlk4og3
 t2oy7f4fwOhyCTQFhtEWlh4ChnqUYD72uAJecgGXWqjVFmjJOs5eHTCyCFRXOyIjal19ewb44Y
 X5HSO9OH12r672/Lvf+TS+YJ9PwCILw1reAAAAA==
X-Change-ID: 20261107-staging-csi-interval-967254b96cd8
To: luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org, 
 thierry.reding@kernel.org, skomatineni@nvidia.com, mchehab@kernel.org, 
 jonathanh@nvidia.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org, 
 DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7208;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=RFWR0QKV3z3LtnLnQBGjQGyiW1c3/1+A78zjLwzdzP8=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFnvHy2x/CDdoV5ypyZpyY8UJ5EawcRpNpc3Fc/bKZdis
 UrdksOgo5SFQYyDQVZMkUVMhud9/X2dOGurOSdg5rAygQxh4OIUgImUuTIyPJ//pfI+89ODqx4u
 31aZVZORPuPOs0X3pK+3FebrrL+/q4aR4fgm51j9gq9+nM/FSuWaTZxvbIhqXVLQVm/wf5XN91I
 jNgA=
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

Convert tegra_csi_{get,set}_frame_interval to the V4L2 subdev active
state API, resolving the FIXME asking for TRY format support via the
active state.

The interval now lives in the per-pad subdev state instead of the
driver-private csi_chan->framerate field:
- add csi_init_state() to seed each pad's interval from the TPG
  framerate table at the channel's current format,
- initialize the state with v4l2_subdev_init_finalize() in channel
  probe and release it with v4l2_subdev_cleanup() on teardown,
- re-sync the interval in csi_set_format() when the format changes,
  matching the previous behavior where the format path refreshed the
  stored framerate,
- validate the pad index against the entity's num_pads in both the
  get and set paths.

With the state handling both ACTIVE and TRY buffers, the TRY path now
works instead of returning -EINVAL, and the .set_frame_interval op
(which wrongly pointed at the get helper) is fixed to the new set
helper.

Non-TPG builds keep returning -ENOIOCTLCMD as before.

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
 drivers/staging/media/tegra-video/csi.c | 80 ++++++++++++++++++++++++++++-----
 drivers/staging/media/tegra-video/csi.h |  2 -
 2 files changed, 70 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 5a5fca378ae6..629b543c76c1 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -111,7 +111,6 @@ static void csi_chan_update_blank_intervals(struct tegra_csi_channel *csi_chan,
 	if (index >= 0) {
 		csi_chan->h_blank = frmrate[index].h_blank;
 		csi_chan->v_blank = frmrate[index].v_blank;
-		csi_chan->framerate = frmrate[index].framerate;
 	}
 }
 
@@ -178,6 +177,9 @@ static int csi_set_format(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *format = &fmt->format;
 	const struct v4l2_frmsize_discrete *sizes;
 	unsigned int i;
+	const struct tpg_framerate *frmrate;
+	struct v4l2_fract *interval;
+	int index;
 
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return -ENOIOCTLCMD;
@@ -199,6 +201,16 @@ static int csi_set_format(struct v4l2_subdev *subdev,
 	format->code = tegra_csi_tpg_fmts[i].code;
 	format->field = V4L2_FIELD_NONE;
 
+	/* keep the frame interval in sync with the format */
+	frmrate = csi_chan->csi->soc->tpg_frmrate_table;
+	index = csi_get_frmrate_table_index(csi_chan->csi, format->code,
+					    format->width, format->height);
+	if (index >= 0) {
+		interval = v4l2_subdev_state_get_interval(sd_state, fmt->pad);
+		interval->numerator = 1;
+		interval->denominator = frmrate[index].framerate;
+	}
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
@@ -217,20 +229,53 @@ static int tegra_csi_get_frame_interval(struct v4l2_subdev *subdev,
 					struct v4l2_subdev_state *sd_state,
 					struct v4l2_subdev_frame_interval *vfi)
 {
-	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return -ENOIOCTLCMD;
+
+	if (vfi->pad >= subdev->entity.num_pads)
+		return -EINVAL;
 
+	vfi->interval = *v4l2_subdev_state_get_interval(sd_state, vfi->pad);
+
+	return 0;
+}
+
+static int tegra_csi_set_frame_interval(struct v4l2_subdev *subdev,
+					struct v4l2_subdev_state *sd_state,
+					struct v4l2_subdev_frame_interval *vfi)
+{
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return -ENOIOCTLCMD;
 
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (vfi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+	if (vfi->pad >= subdev->entity.num_pads)
 		return -EINVAL;
 
-	vfi->interval.numerator = 1;
-	vfi->interval.denominator = csi_chan->framerate;
+	*v4l2_subdev_state_get_interval(sd_state, vfi->pad) = vfi->interval;
+
+	return 0;
+}
+
+static int csi_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(sd);
+	const struct tpg_framerate *frmrate;
+	struct v4l2_fract *interval;
+	unsigned int i;
+	int index;
+
+	frmrate = csi_chan->csi->soc->tpg_frmrate_table;
+	index = csi_get_frmrate_table_index(csi_chan->csi,
+					    csi_chan->format.code,
+					    csi_chan->format.width,
+					    csi_chan->format.height);
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		interval = v4l2_subdev_state_get_interval(state, i);
+		interval->numerator = 1;
+		interval->denominator =
+			index >= 0 ? frmrate[index].framerate : 0;
+	}
 
 	return 0;
 }
@@ -438,7 +483,7 @@ static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
 	.get_fmt		= csi_get_format,
 	.set_fmt		= csi_set_format,
 	.get_frame_interval	= tegra_csi_get_frame_interval,
-	.set_frame_interval	= tegra_csi_get_frame_interval,
+	.set_frame_interval	= tegra_csi_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops tegra_csi_ops = {
@@ -446,6 +491,10 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops tegra_csi_internal_ops = {
+	.init_state = csi_init_state,
+};
+
 struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
@@ -642,6 +691,16 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 		return ret;
 	}
 
+	subdev->internal_ops = &tegra_csi_internal_ops;
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0) {
+		dev_err(csi->dev,
+			"failed to initialize subdev state: %d\n", ret);
+		media_entity_cleanup(&subdev->entity);
+		subdev->dev = NULL;
+		return ret;
+	}
+
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)) {
 		ret = v4l2_async_register_subdev(subdev);
 		if (ret < 0) {
@@ -696,6 +755,7 @@ static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
 		if (subdev->dev) {
 			if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 				v4l2_async_unregister_subdev(subdev);
+			v4l2_subdev_cleanup(subdev);
 			media_entity_cleanup(&subdev->entity);
 		}
 
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index f0277cb42446..25aff2581f06 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -53,7 +53,6 @@ struct tegra_csi;
  * @csi_port_nums: CSI channel port numbers
  * @pg_mode: test pattern generator mode for channel
  * @format: active format of the channel
- * @framerate: active framerate for TPG
  * @h_blank: horizontal blanking for TPG active format
  * @v_blank: vertical blanking for TPG active format
  * @mipi: mipi device for corresponding csi channel pads, or NULL if not applicable (TPG, error)
@@ -71,7 +70,6 @@ struct tegra_csi_channel {
 	u8 csi_port_nums[GANG_PORTS_MAX];
 	u8 pg_mode;
 	struct v4l2_mbus_framefmt format;
-	unsigned int framerate;
 	unsigned int h_blank;
 	unsigned int v_blank;
 	struct tegra_mipi_device *mipi;

---
base-commit: a41e364995bbcfa627418a70fe913c35b7510728
change-id: 20261107-staging-csi-interval-967254b96cd8

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


