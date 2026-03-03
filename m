Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7299838C2DC
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527385; cv=none; b=UQmt2PGfFe4Rnp4DV/9pMM1QQVStg7bE3bQdkrSCgZlRfKKZguOeEhicgWtTMLZe1UJpz8k0GRi34as6cAPyTctxjjuEXPFAFgp5XXt0QK9xbHlYsd/rtBKaa8vrMf3rIzE4Kt7iJVesYE5ZgancCEKzs6jrcaKgGdg0Hd6zVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527385; c=relaxed/simple;
	bh=uTDxjcMD0sqeD8HnRLyVfNwbzvAjPF4iDYzatfrGujQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UniJBso31XtrCKzORaBSz/37kpLkuuHIQ11BBMnFS9K7SGJeYf6s4koJxqb32LgMjGiTU9amS4H1lw9WVWtP4vEPgKfCOZIP7bXMdf9ejXwwzVB59YkbOXzHryU4W47dWdlGmSC0q12wVo86QcB8zmjwSwDfRqFge5atve8RF1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVj94JFa; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVj94JFa"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-389f9895c81so26503941fa.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527379; x=1773132179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ggm5W/tKu5AuAHRHgAxgCfaNNqewzCUye92Dt5QC9CU=;
        b=nVj94JFaL4sVq1b9mkSEA8nnfbg3fCkjr/Sx0EG2c+8CkVhF03Cd3bilNSVS/vZW++
         rHLs9nj4y5HqlkLyGFEy3M0fOOuruM+LP8bMOOCPGTONkcUs6Eq4WbxD6lczM57FaX+i
         BkteVUV55DnU623TGe4LpAnuDyuWtb7567zzJ9Sz02UaWaaun7yNSkSP2XIwEBWHYWgy
         TjU/Yi0eC4Otr5IxHxbHdN9J26AXXJtJAEHpXrlyFJWahhqBxc/Ptk2lyVzIeTtfaQU9
         uWxLEyUXLM7JQRsF3yp31k6BQgJUlLeMbV6snMX38GuP1Ksn4MBGEgCJIavv0xifSMTP
         atdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527379; x=1773132179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ggm5W/tKu5AuAHRHgAxgCfaNNqewzCUye92Dt5QC9CU=;
        b=J6Y3WIFP3BJAEmBD/ZA7knd2+Ct1ephfZjWbElIDAT8lOZPWHlEJaQT3T+uuJsyMf9
         If09pPRyp1fSdThoQ1bbrLw0bugEuGA56F+aFl8qm1lDKZLUI7lxJDUkBLa+tcTDSNUD
         ZVCeSd+kNWxf68YcvZGDwxg7NZ+/SwtC6rPqF1HOedEp6TSZrzKBNWikKB2BEL6pAFYi
         B4b+7FxYlMp00tapE6zbxATYeTnAE7QJ6pnK55G35ihH/2GIc46Io3fDbI1Fd+9RPK8R
         JR0pYtRXl7E7Ow0LbDc6ANikM+MB8vWZgNuuZQ6BYBFkltur5l9UvDWQoAHCWdvLTTXy
         mtxA==
X-Forwarded-Encrypted: i=1; AJvYcCWiYS/fOmJk3tuObjN8PUrwkOcOe6TFoOcE2bMHbTRKYmXVoiYweG1paegsLgw0EnhKI+ZTulFSrI6nFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUiD3wIEOG1V4iggbb2aPfzHRdXFyltATKEKfvfL1GUj+oPr6
	XEYTPAjXJiBc5MmS5MHiLSeuy4bJUxZ3WSIFuAJsj0uEPXIFOgQeUAGi
X-Gm-Gg: ATEYQzw7UJqqqSw24R9g0PaIMD39ajHDtmiiV66jaXvqNFQ6cFaLG459czmySHDqWg8
	LxO+GF5ZE2JR3iw+N9iuKAp3BzAWfCDEulbT9I80ukUfuUyrYIVyVEd/JotnACzG3A6peY1ZH34
	RLL8ggeSmqhP7xu0a0nnpvUgAMQGpn40UWJw5Osta+313QVSa+u+tDEnz+D3P8X15QfOxnC5o4d
	0BskyxajscW5WzrEOZannvxEJxSmsv83vcuI9qiPKOdS5HsLqHyvOBj5itVMvZ6AhcYU33qCFxQ
	URlfFNfQQ0AKjEjUFDv/l5x9TlO8z5CASzcJs1oGpt1EQ5AhyApFzrX/v/x/sbGs1JeSR6hLctL
	X8yYV02JeFQdbTrEG7uQ4BQyAZfWJKgPa088EXmDYxnhgV0+VWmHdgyaxb1JlDM0T1mRMYnnnO7
	HjuqzUo2B5Q6RhEweb1GUz6G4=
X-Received: by 2002:a2e:9246:0:b0:383:7f85:8eef with SMTP id 38308e7fff4ca-389ff356ffbmr81095711fa.29.1772527378501;
        Tue, 03 Mar 2026 00:42:58 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 06/15] staging: media: tegra-video: vi: improve logic of source requesting
Date: Tue,  3 Mar 2026 10:42:29 +0200
Message-ID: <20260303084239.15007-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
index bcaea20c3025..92078a1f9a4e 100644
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
index 19eebfdae221..7032c733577d 100644
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

