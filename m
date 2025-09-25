Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE1309F07
	for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813457; cv=none; b=Ixzctphv/g/ri8Dx4v6Ftbu5BjIRcxo8XmRZC6ktcf6GC3pYWF8Rs6KSXrM6jnRyqninwzQeFbNhYrCQAJh07nb3N6yYSfW+O/8ePWbz4pwNifCtRzQnkvKLuE0f3lTOheMkw/1muMXm0L8GcrsBi1J2mAIPinXW7aNcdf1ZRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813457; c=relaxed/simple;
	bh=PeHm1wrR0AAPSTDMxiNgwUZQ4BKQBSCJMUznSgFPtDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qgq3D9GV7PVxqyHI5icm4ya5e58jI7gxSBW5n2o0ug77Y0ABYt2IpHcv9pSiWTmbZcBz+KuRz7Xs5yezD+UrhuZ0nBO/5Cg/pOoPF2k9oRg0RBEgffi5htiVfYcrFMqTvoCjCOWTBGNUZkh/Ac4z02Y+HPVRsnsWJW3c20VVFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuCwawbh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuCwawbh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso1254385e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 25 Sep 2025 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813449; x=1759418249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=AuCwawbhRtZV71jWeHmlH94Gb8pbThQbmDXt4vUEfYGY7WrPvgEGuE170iOp6USlo5
         zzQMn/hylFJmv9fOOK4X2FHpNYRSrabIVT77WalF0vlEW0qlcoEZAoqGozYiOSEi/E2z
         YcHuIkPOcLBwptpYl5dZXAg+hUsZOwxXsaM+sLV07NbPDHDWBSLP2JX+zBFM3E5ZtPZ7
         vw1REY7l355u9ASKYx4lom8N5uyvfG3LajqTI00RXIf1cDsNKry3g40SXreXMDnZFrsE
         lusRhQmT0wv7FrA9vr6JfbmDAEBpTnKRGEA1suqdzLaa9wjSMwa+IFcnYsmNM3SwvGSQ
         nZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813449; x=1759418249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=J1vTrx0CU0ZOcBdkRPdlVES6ZSnDfcSqsy63qfPurypD06engsHyhso+i6VEFutX75
         3QNTgqM52qt5x/hVn6c1VqROrA/Vn1FToF0dWW66aks9+F0mTlNhlppkPgzaAFoO2S4k
         iL/girFK39jq9IrT7FYedt+cHq3HDIfTpHRPHb3bPpab4p+B+j0dhn8OCH4UA2j4vW8o
         5tsy55tAbXV+tsFPKnuwZI7kiwhUOex906Ha7+fMgemLonC6GjSRV2otTPFaUdDf3hbf
         YUJzLJR28jRf9eIW3IC7P0t77Yf9qhuAYkM6ODgQgJlD51ygOYnsckoO4kjTd6zU7nbR
         PwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRU1Z6SZJWMtOpv1cm0hBNYoA3DfwK7vs0ThB3eaY3prbhLZD1I4NybwUacDEY96O9ysBOKMs3IhFMcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwk7WZsys9ehDvuuMrOBWPNMDif37rWKUrhUoDjctENtVRhnB
	jUtt/WgqcYCV8Fi35wqTbX34IA+JSIjhskipWn2B0LFNcjIaMHyp6TGT
X-Gm-Gg: ASbGncv6wfTGW1/FC6QpC6ZibtPGY4GT/+sXzZTyY4RxivjemhtCTJuVbiOt2R5P3NM
	8ftKWpSkzWIV36AnSXwSTYkO/wV4IURNOM9DWylvFvmqfevI8IAHeaXKRGvqD8KD3Eq3DzaJfIx
	Wfy4jE8gClEq9Lq1sA4OzS/mitTslP2xdCOzzfL64IjH6PTLdl6MCjYOeP/p3pK/oyABK7KMyCx
	YxEX9RJ19MbNMLJsG4xHP0oH9hW2nn29DxnIqpnX8hEZHj491l8Jg73YVBlY2YJXmYCf6ksGiFm
	Ofbm9gn5c4ALocBk1SKwLymxs5FxxkBO7muGVIlSOWHtQyLqNJIkX8lWUhpm5OUEurdCdXzBxmL
	g37D0VkRyqY0mfg==
X-Google-Smtp-Source: AGHT+IEpmsCgXoe+pHNnDNycPilUYF9YFAYkKb7YBcFS/w6Rr+i+BRLl5E2waSe2wlPmiZ/s/OW9iQ==
X-Received: by 2002:a05:6512:2213:b0:57e:ad46:b0a0 with SMTP id 2adb3069b0e04-582d092f19amr1131015e87.6.1758813449054;
        Thu, 25 Sep 2025 08:17:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 10/22] staging: media: tegra-video: vi: improve logic of source requesting
Date: Thu, 25 Sep 2025 18:16:36 +0300
Message-ID: <20250925151648.79510-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST.

Define tegra_channel_get_remote_csi_subdev within CSI and add check if
returned device is actually CSI by comparing subdevice operations.

Previous tegra_channel_get_remote_csi_subdev definition in VI rename to
tegra_channel_get_remote_bridge_subdev and use it only in VI driver since
core VI driver does not care about source and does not call any specific
functions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 14 +++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9e3bd6109781..ef5f054b6d49 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 90473729b546..04b538e8b514 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,8 +160,8 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+static struct v4l2_subdev *
+tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
 
@@ -182,7 +182,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	struct media_entity *entity;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev)
 		return NULL;
 
@@ -204,7 +204,7 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -217,7 +217,7 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -1630,11 +1630,11 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
 		dev_err(vi->dev,
-			"failed to get remote csi subdev: %d\n", ret);
+			"failed to get remote bridge subdev: %d\n", ret);
 		goto unregister_video;
 	}
 
-- 
2.48.1

