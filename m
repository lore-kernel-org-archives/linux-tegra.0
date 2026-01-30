Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3487237F8A1
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777405; cv=none; b=epD/c3EjYGO5fkRIWQuG98/BZvmIK6I+3yMHPKXi1bIBOj4tzDxX+obghFRyF451/sYoEEjMjiKbcXL13cKQ0+9ztPibVLt+QwmWhTHErJHFtEAmh2pZgKGCZBj3fJ3UOuQkt7yWnJ0ZIHHxzTf6k/mx0lpeNNwXissyWsXAiRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777405; c=relaxed/simple;
	bh=NP5wyq347Z6v9T3ICeLdnanOcnkIKeVAP2h+kcM9y4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDeWLT4FXh0izMCjm0xsaoToBOts4IOOblVeSbFkwyPMC2Db70o0XDZxpI4iVkwA0zvTpajaUTIZLKofKRh7hXWDtQ950PgC/dEY69gNB65LqTgiEAWw6V2gzPg9Q7yxjwMYttiqeiNTUhALU6turXGSyaFfi8PuSmRDZ/Hitcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8KAY/CH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8KAY/CH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435903c4040so1435077f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777401; x=1770382201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+nXxOTMIADfvgUw9tigLc0fwuFzoK09epjwvFZ7lj8=;
        b=Y8KAY/CHj5571c71BqOIxCfnx1FPMXbNuoxK80gS1xc7KM0tvuF1wu+r55uHMnF+SB
         5RuX44HmYFsS8hKLtQo4+El5okKFt27pQjl9GUUnmIuat+3mkn+FwfZJqwxTzfuL362w
         KiLMo+g0gZ6DMuBDojjnFy6l3CY0N9dGp8kvwMTrcyj26P8NRSWoO/lD4HT8le9gsX4A
         Uuke0Aj+XpeQ79hGQVPfxtOn6gSyJxL3UNx81ZYmS4ISP4yCN1zsyEsA51fkLk8SVjZd
         oHC4HJoXplm/ivWNUASnw9K2SW/ucXL/ueg1Ea7xAe7RdYsb6FJGM13tcPRLI6ntuHNt
         YqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777401; x=1770382201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s+nXxOTMIADfvgUw9tigLc0fwuFzoK09epjwvFZ7lj8=;
        b=ia8p9zuXz/DTCV5hHveYzRlf/QPiMbR9RKVs5tvNAUfBZJw/1+4eYf+D2dQvgVSYC3
         RkTEK/B7vZQN9+gEjxGZ5e2TF+d9zGUcpQda10zvXFkeJA1ZLZ2y+wQBOQuXZX3ogeYt
         dqIpX2xrSN/kEp3tY1o3Zs82Hv5cn4C+zuPrnDNTX6u2qkXWyawAEkm8CjfbDq+qywtf
         xhGoyUSrCriZPwkO9t8pTc1ljks5UKuqa7cYikfQGSnn7hRJyeODGYUKP8Jbp7gcidKY
         ftSUNWNaTqZl1iqLW6uSWBHgfePhXlW5CvtrlwsrzZxPlNI049+QPf1Q1gTT6qqI8AoZ
         qhgg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZpSB6u10LwMX/oQqlZGup8F8Z9eCKFp0B77ggMihUnPlVvOdg9pXS5gLshf/m/FZzeC8r5NDk0OItg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5doPC3dwJPc24/lCmtsZFryeBOFFfUHTx90tSqPdpIyGuexG
	kbUjftLj1rw9TEjI+Pl+/dfejUApBVe4gq53KKZXxzcUbB1zZgJH84pc
X-Gm-Gg: AZuq6aI59KI4sSWKNfGni3PJsc0YHOzL2sF8E44GXUxMCidb9vousYNzavJC9PnxIi9
	a/1FZkJAXj3N4wHKUMu3QmC8b/CVMOA5/YDOz5Nah+nFYdXAiqPxqnA6H6KXLUlzsoSGP77wMp+
	o2npuEfb1qUActJ0KVZQNsakedUZm8ftTv3GJNrXeU/ZqW3rTzaNkqf8NY1LjIaYT63Ql9EeKx1
	Odc+Rd7UDUTo6c3WpRkDvHhEZzl48yMU15lhCyk2FnYD+7aDz1XqF269mIt+wz6Y9uWHI0DryOo
	1fFx3yIIL0/dzaTEMPKVhsn9bqb79b3zrklkdzrP6DBk2VUhEE+ZG2DU68yXy8qtFUlYrEM1QpA
	lqXvHmKz0stymPoOh8UMbNh06Eo0i82XFYxjNcHkKT1rptP4csqWUV33br9xHBPIZMkt3P2VNqP
	pJ
X-Received: by 2002:a05:6000:400e:b0:42f:f627:3a8c with SMTP id ffacd0b85a97d-435f3a7a015mr3476820f8f.7.1769777401172;
        Fri, 30 Jan 2026 04:50:01 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 06/15] staging: media: tegra-video: vi: improve logic of source requesting
Date: Fri, 30 Jan 2026 14:49:23 +0200
Message-ID: <20260130124932.351328-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 14 +++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9fdc8ac1c754..38bff499a8e0 100644
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
index 0f98157a7e91..f0725312e236 100644
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
@@ -1631,11 +1631,11 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
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
2.51.0

