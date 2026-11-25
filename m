Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604906;
	b=zs0f/I1ijWPlb4JLLTShS4/Xf2qsm9FEHzqHxqE6sma+Sq6gF8utzZXyKlMulIW/WCSz
	 EXRgwwjEl7vdC3ioLcwaLiMOIwu8SFsGz/psoOghflcgwfUxhj8weVQMXHl1Q30QqDcc+
	 cu1eGhh9s+ow6A9tgNfeHgMpYA4YNuaUqdHd9BSe4HoBxpbM6I/cU1UnqBo9DH04UzPSO
	 A4MxTYdH3Xu3uenaQ1qnyuJdiEtRZJBF/AoBlyc8DWMqb001ODpzCL+Hi7mk94O+DTFdL
	 8xH1aGZEHn6woy3M4TT/0EWjmF/2Vt22csKBRe2a9Q3huBllzYQf8m2SEM66/4rqB6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
	b=AVAWsaYNypwT91fMIIdoExl7ahyYTGSexCRFgunvvy7JJLePsAa77gz1ZSZ9MpVr0kf2
	 WF5CP38kvUDzpAl3eMP1U5SYvMea/A6uhyZ26950d+AaggVZ45jT26Z9fGPIKn4nWkSeW
	 y9pOeKsIJPkPDSwRdosUhnhN2UR3vSBYjBNMKYwtPcGyV+46M0EEuQLr6H7H7XexmBWmq
	 CSOvIMORZqZVxFyRnEGfeYm5ggKsUCO7FLPGY0GUGQDHjGaiHsV0QgDcbl9Zi8Uqu0waT
	 9Fqd6BykbPyqfoeUz2k5THS2Llfw8mSjI7p1EKcT94a+A5dKGCuEiefTW16GyfB68uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev60ytHr;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2788606A690
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2788606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ev60ytHr
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4395d31228so949346666b.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604904; x=1796209704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=Ev60ytHrSQHBeKtyq7piY+87HV9Q/sxLiGTZ4oeWGaolpSyEaW6VlnhSpdTzUIwDQb
         ls+ObkI2VjYUuIecEQDlc/xVy6VwW8JODj3Kgxd3HgYN2P4sTiktqjPLgWuXa4tbKb74
         LumBod3hO3BHfEdEVC6IUqpTWtBa6+7rPObDTH6wg2KGrJz9vK0Rb2Cp6DjJZRWtJrXo
         kCh7JB40eZsAZj4QhwPeBbi20BJCV5991KT93D9PpNUQSpEkG+hgehgX9aHmIpDZGdqD
         r/EswOL3D1tYb3v6VnwdntKheFyeO88MHO2rVo0YZXlANKrvVCgXLYj3JJAU/OZq5iOZ
         qWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604904; x=1796209704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPC7WvKQPOHddTcCwt5ZfmTpugqnrOt4y+DtQtGxVhA=;
        b=ghyVFZDuRrfSjI7yZirwapzpsQeCfCaaAUG5q6PX8rt6M4yd8g6ioyeuhtOPuQM8QU
         sHR0VPGXlutdXUTh364SimlZE2xwhUTUj4AxvDJ0ZTIb9c5bTq9KfgmCPgUNxBvJ2x78
         RDbYTlWHkJ4G4GTxVW8s8TbOBV+lCqvxKNdRuPwRUU+ZPH79CRx90QtE9IvoZmZaGgxA
         mm6sKDA3uboJk/JtMRwtcTSdHwLLAw7SY1e4TMVySRwzJTA78oNJhCXCneN4d+U8HpK5
         ehOoaSiA/9hZUdQnJX815pIGOTT9bs49W62+tPPigRR1EUFAR5wMdxmJC/I+dj6NGxlF
         /MFg==
X-Forwarded-Encrypted: i=1; AL+hErHmPK9Pr5dkpWsBPnZ0xkpRZ+QGJFnTzX4VQqESRfiU/t9gFXL4INEd++E/sDfxARZHJsgQyUYn+R3lWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zW2V4Qv6PmYr7DGUIikdf43Botr/aeI/Cu+1rnqlWvRXvoTSi
	vDQluq6iatqpZuBAW1rjvgwzFgYNL7VAqKyEIY8NqikEdVxE0tfJQzaQ
X-Gm-Gg: AZFdTZdYRl7bXiN81zdcS0pxtjBeglnT4+OkT3WJQNxsoy3c8UwvOKuwX9Lo7/ALnlQ
	2CdhEmCxwm1N2u3Da5S/Nb5LpvCn3m95aUxzmRgJFqhCR37FZlBGG2t61t0vXMOJsE8Akc3E8T/
	Fx4E8Ng79q4da7Y4ZAf/JOrCHxRbPFZnDdpcPIk2UoV88CnN0lbXYMWpvD/uj9uy9KrAfSXLiD+
	uidJvDqyRFCFBtsZGEwkAU9C0GpzjWYd0r3HO9APsimy4Y0YeABjkLtMSFEv6/vXVySmMNNmmgP
	yEW3jvit7AoZ6iCz4B/Uwap5X8gvjD50ZAdAA/d5M0jGPQwDqfajl4+ftmtCmleUm0gTY8aEEvO
	DnpCTmS3roEGdybMf7MH2VRB8gxdBqpQ9ARrDrsCde+zfU7OOs2hXlxXsqLQnPxIMgZid5Scxcl
	f0M6fL1XNHQuyS2neuh5w8o02EfUi2fW7u6lxRO1iO3/xUYq0v+biWpb7n2WXUbdq6m5ZpLsifl
	J6M8ukJPxRGEYfUwSgu581iIkd4mZcFFGL0ClmWK+QqlgkSrcDHczNJxr2qSFML+luNEYlxYvKQ
	jTEdOBo0dRk7jhBzcCbM4s+YgJzkMjrDn3/q9EFpjN+sPTUj1Rpi1cL2umGydxFcDp7sUmwKxDl
	E3sd3WtPaAQ==
X-Received: by 2002:a17:906:5006:b0:c50:5e10:71ae with SMTP id a640c23a62f3a-c513a5e2124mr1216666866b.17.1795604904078;
        Wed, 25 Nov 2026 03:08:24 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:23 -0800 (PST)
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
Subject: [PATCH v1 03/13] media: tegra-video: vi: Expose all sub-devices in the pipeline
Date: Wed, 25 Nov 2026 13:07:40 +0200
Message-ID: <20261125110750.223628-4-clamor95@gmail.com>
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

Add support for exposing /dev/v4l-subdev* nodes for the CSI and VIP bridge
sub-devices to userspace by setting V4L2_SUBDEV_FL_HAS_DEVNODE flag. Call
v4l2_device_register_subdev_nodes() in the async complete notifier
callback to expose all devices in the pipeline, including auxiliary ones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/csi.c | 1 +
 drivers/media/platform/nvidia/tegra-video/vi.c  | 4 +++-
 drivers/media/platform/nvidia/tegra-video/vip.c | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
index 44bd53dbbf7fd..add526de536f9 100644
--- a/drivers/media/platform/nvidia/tegra-video/csi.c
+++ b/drivers/media/platform/nvidia/tegra-video/csi.c
@@ -680,6 +680,7 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
 	v4l2_set_subdevdata(subdev, chan);
 	subdev->fwnode = of_fwnode_handle(chan->of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	/* initialize media entity pads */
 	ret = media_entity_pads_init(&subdev->entity, chan->numpads,
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 71921931457be..4753ca89666ae 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1548,12 +1548,14 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct tegra_vi_graph_entity *entity;
 	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
+	struct tegra_video_device *vid;
 	struct tegra_vi_channel *chan;
 	struct tegra_vi *vi;
 	int ret;
 
 	chan = container_of(notifier, struct tegra_vi_channel, notifier);
 	vi = chan->vi;
+	vid = dev_get_drvdata(vi->client.host);
 
 	dev_dbg(vi->dev, "notify complete, all subdevs registered\n");
 
@@ -1610,7 +1612,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	v4l2_set_subdev_hostdata(subdev, chan);
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&vid->v4l2_dev);
 
 unregister_video:
 	vb2_video_unregister_device(&chan->video);
diff --git a/drivers/media/platform/nvidia/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
index b73ba0eab5573..040776775aacc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vip.c
+++ b/drivers/media/platform/nvidia/tegra-video/vip.c
@@ -165,6 +165,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
 	v4l2_set_subdevdata(subdev, &vip->chan);
 	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
 	if (err)
-- 
2.53.0

