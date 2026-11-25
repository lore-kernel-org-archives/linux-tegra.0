Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604916;
	b=nGDWBRg/s5b7X8MaukRcFuVPPo36fQF6JS6HJaLBPV/F1btDwFltTQX369GqpZ4lePBr
	 l0Iy1vgZaioujJ5tgVLnV+fOHlu5B3q6A/Ay1UqCN58shzLzNwZxqbcphOy4JlDtxdo4q
	 sti5Ws/l5SRiQAz8FvLjdC2PLX+PGWB7FvkbMNXCtDfhoHlI9lEsEHXO0HKA2K8VwfryL
	 KRil5DN6eQB9ntJzateS2rCmxAIrv1BQp9CEWlQnZtbmb62qx6x0p1EphsN37nL0UWjP4
	 fznHTBVRdvEyQBYI9w1SlnzTZthtkltNdeohMaK+KfgiDAKv8QcuHvmdrwHQ5MPNkhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
	b=WhiNhuJSAysPyMLjsNA6wP6WAdi7Tn5/nuk8pfWdRVPzO88lj91uMaSZz2hybfziCAVe
	 wsgiS+H1KtspToUsYJBMXAg4Vi2sSuW2lMjKEKFFgcQH96W0TZ+ifquC1WD5nCEiGkfmG
	 HNIcaKq2OcVEHzrb+ryORXg5MiC6lJ/F+Z1VTuN7EIByagJtSN+byuULjzyKX9gEV97R9
	 w5ldBG7tgBxlOHtKloqELKR2UoRfXEXQFfKwvM6aFoinV9TbjPRTg/OxQXf4II4ZCReyn
	 3jF76XMQ9Jn20EVFeiJ3gGcjvBSdG/y2l9xjgepy8wk9i7z5mU/qDhmzoXWk2ipMH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIXDiQ99;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3381F60A2603
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3381F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZIXDiQ99
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so727187966b.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604914; x=1796209714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=ZIXDiQ99DD1RxABvfH8QdIcxJHtmq9ed8h9lri0iCz0zM9A8R4tY9P/61SC9dcKETF
         J/4UBL1XPZsXyLiCJSFieq7Nr7HV8bk8batnh0kGwX9++ivn5Ir17Bf3CGLDi0RC0fNh
         IQ5SmjIS2ha+x/g62rkocZ0rBXTVOIZXtDOJLQSE5jMRj/c7eg/eeM/DRIz0gpLI/kME
         DQbnJ0D/7OoGkDjcUAScyNrpTXoUAEb8GNrvK79bgxzDKcDPDQ+Ey/AC14VkSdPEGk7r
         H4Z1EOc666UahlPYUoII4EDg/rAHuCGNAwoo5227qfiQFlqPIqTlJRsPUMzySSKJDrzg
         hP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604915; x=1796209715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYa64r4v9WS67AE28HTR6GMnmq7I9DrwDxtBYjX90f0=;
        b=a0wbLA1Bqv7+aEYH9KJ39ZplmHPsWqZVaefV7Utv2oPiy/srNTy/8+tCF4VYkNTY1v
         5pcL/HA41SyF1725DyLbF6GLw7ncVU8xWfPrs1L7NOerkhVl6Qfpm3L3Y+W6HqEakj/J
         4I/fIo/44ixyiEhft1CThN1xqq2tSMGR8zA2qFROG/upaHaie3uETZwgi3sMh/HafEFh
         ydP/2WjclpacsAbG92DNJSwY9iONqEP4hKYVFTIGbtZXHLJ5t8uBN680s/j7eFGY5uW/
         Fm65pt6yKlyZ/2dJuvQOWXnHlFddxslBnjq0/BL37bhZ3OxJXHUQXm+naC+rIc7K/cRI
         NMCQ==
X-Forwarded-Encrypted: i=1; AL+hErGZbi+8rJ52DaPWICmXfHP+EjG+/LYlWWAuBi7C9uHeX0uX1eVkw5D0aHgtScMC86GEX1/ntG+fvBMOyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ejHyTyiSeSFffCnyKzzuX/nWDa2b6WXdkqGnZyi24x9z9GOc/
	XGZjCeBsBcZsyOESWNrsPiszr/lVWLZw2V8tyiqqrwO2L8X7BtmyPID6
X-Gm-Gg: AZFdTZcJoGGBpg+82QfBu4w//vifx4t4tNEFuWQcPp8Bndrv0MTZKsk36cBWaO3Q7ey
	VtV9Y8fJUS73sTn/+7PZ2KGyg85P6uf77yEuZcd8oio+uG8olp7ra+4h5kwcbFeamHeY72K1uFd
	JG5TpP0ZT1/Ittd50kBEAJGDNC2+dj6gUdPkA2ey9WMciTfyjQ+rgbSydq5fQfmsDRAI4t9+hnY
	21kgvQbZxqfx2dR59On0kXe/5cIHo3e/C5RpNCjs+kbU3gicaL8+PFrIa4e74ZDqnlgI+kh/9v+
	sAk6/aORdAeG74Xwu+UUqiqqoLO+YpaiOobuM3hVI97u4V3y+luv/rLWTBuGcRNRq5ihBXKKFa6
	SHt6wuYyzbPCwFeMabwUM6+oEcYO7WxjABL4YULDteZdcSiG4R6CazlfIQt247C0jBDBx65XAj7
	+nyj4MjjFx6+EJM3fMxppP6aO0iry2GNGLcd9hKcwj0fAEd7KAeuqkSUsMQKnfxxBn6karhCTuS
	IYW7fIrEpni0W4lvyTpbDMIdr8qFdpIYh8LISdSn8aK2VZNMxMAk2Eufq0Zj7vScbhMeEpKcUAa
	x3ANa2HclIJdBTW0p/bNoVmPYHYPb/x6+gZ8KY1wN2ga7WUH1pkRSqO68Mp0K1l24mspvSF0rn8
	I2UXpKBaCNPPGG3MNekR1b+8ArHBKgBOh
X-Received: by 2002:a17:907:9111:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c513a8140bdmr1037767666b.21.1795604914542;
        Wed, 25 Nov 2026 03:08:34 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 10/13] media: tegra-video: Remove remote source subdev helper
Date: Wed, 25 Nov 2026 13:07:47 +0200
Message-ID: <20261125110750.223628-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Look up the remote source subdevice directly via
media_entity_remote_source_pad_unique() in csi_get_pixel_rate(),
tegra_csi_enable_stream(), and tegra_csi_disable_stream(), allowing
tegra_channel_get_remote_source_subdev() and its subdev hostdata setup in
VI to be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/csi.c   | 28 ++++++++++++-----
 .../media/platform/nvidia/tegra-video/vi.c    | 30 -------------------
 .../media/platform/nvidia/tegra-video/vi.h    |  2 --
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index add526de536f9..ab6162720ab78 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -282,12 +282,17 @@ static int csi_init_state(struct v4l2_subdev *sd,
 
 static unsigned int csi_get_pixel_rate(struct tegra_csi_channel *csi_chan)
 {
-	struct tegra_vi_channel *chan;
+	struct v4l2_subdev *subdev = &csi_chan->subdev;
 	struct v4l2_subdev *src_subdev;
 	struct v4l2_ctrl *ctrl;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_source_pad_unique(&subdev->entity);
+	if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+		dev_err_probe(csi_chan->csi->dev, -ENODEV,
+			      "failed to get source entity\n");
 
-	chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
-	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 	ctrl = v4l2_ctrl_find(src_subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (ctrl)
 		return v4l2_ctrl_g_ctrl_int64(ctrl);
@@ -383,6 +388,8 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
 		/*
 		 * TRM has incorrectly documented to wait for done status from
 		 * calibration logic after CSI interface power on.
@@ -392,9 +399,12 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 		 * CSI subdev stream-on triggers start of MIPI pads calibration.
 		 * Wait for calibration to finish here after sensor subdev stream-on.
 		 */
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
-		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			goto disable_csi_stream;
 
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
+		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto disable_csi_stream;
 
@@ -425,7 +435,6 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
-	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	int err;
@@ -436,8 +445,13 @@ static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 	 */
 	if (csi_chan->mipi) {
 		struct v4l2_subdev *src_subdev;
+		struct media_pad *pad;
+
+		pad = media_entity_remote_source_pad_unique(&subdev->entity);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			dev_err_probe(csi->dev, err, "failed to get source entity\n");
 
-		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		src_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
 		if (err < 0 && err != -ENOIOCTLCMD)
 			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index f2de3aeb05bbc..98411c3f4a037 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -150,33 +150,6 @@ tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 	return media_entity_to_v4l2_subdev(pad->entity);
 }
 
-/*
- * Walk up the chain until the initial source (e.g. image sensor)
- */
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
-	struct media_entity *entity;
-
-	subdev = tegra_channel_get_remote_bridge_subdev(chan);
-	if (!subdev)
-		return NULL;
-
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-		entity = pad->entity;
-		pad = &entity->pads[0];
-		subdev = media_entity_to_v4l2_subdev(entity);
-	}
-
-	return subdev;
-}
-
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
 	struct v4l2_subdev *subdev;
@@ -1134,9 +1107,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	v4l2_set_subdev_hostdata(subdev, chan);
-
 	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index fb377d428d510..44893c5c6e651 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -300,8 +300,6 @@ extern const struct tegra_vi_soc tegra210_vi_soc;
 
 struct v4l2_subdev *
 tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan);
-struct v4l2_subdev *
-tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan);
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on);
 void tegra_channel_release_buffers(struct tegra_vi_channel *chan,
 				   enum vb2_buffer_state state);
-- 
2.53.0

