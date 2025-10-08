Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BA2F658A
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 07:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908701; cv=none; b=BlyQZPOsx8ItNBXDZMISNLJa5Q1WHt6TAxVe2XEBaOVKuSzFu1dgnsXzlyxk038ginJsKqDyJN77+DPaZVzr10CyM66EkOseR9UUfJ1GXq97d/TxDITbhDe6X4mmm65eRx1JRavgLNvrnSo1/KLW3FDbJ7uYl+rB4O58+iSXtLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908701; c=relaxed/simple;
	bh=PeHm1wrR0AAPSTDMxiNgwUZQ4BKQBSCJMUznSgFPtDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRhh5IthtaxOnICQ5FEzisWGMY23FxH8FiolNgYvqB6d4bNybrLJ1rsHCNnNCq4nVHrkq01YEWmFdQKmThslSwZMt55AMyr3gUGU0UvX5O4+FSDyn60O57NmZKfJWybqzOZyRpSlZ2Z62iRpdS2qjWdufvxmmQPN/43pkcRjrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maMAs5hy; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maMAs5hy"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59052926cf9so3163375e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908694; x=1760513494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=maMAs5hyEz5a5uZb1WoD6pTZmz5xgW3P77a/X9yx78Awk7p/fz6DcKUxef9AfuSVTn
         w58Cctw8fylUo2AIbIyGMmL27VSa84NfUf599QU54sFB9832lFWJJp1dY7YauBdNlDxg
         h3Gp5Isv77przEuwVb42Tt030rpNxypEVbE4AjRc4XLZU0kZNT3aLP06lPJM5MnghOHb
         TqJrlPFBf50d/wYLFfMd3qAGyMZ5YZqXw0wAZHrG2tnOnqFPxpqNJ6ObqRd+SyXraI9K
         hv7gluOoA32NJ6aZX4e+yU1ikobAxIsBC7dZX4ezicV+1kcsIRfVk31Icl19TIXOjOBw
         sGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908694; x=1760513494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxcQ3SZL/bX2w7ws13Plp9aplxV6uyygzePW373+H0o=;
        b=TMu0EzkkMPB/WEU2NG0inuSpPInYBFPEARbdgdi2ZNI3Y+dLqYQadx/odAQLpLzwDy
         dloPApNv8XEERcQVMFA+grjN7ccj6ZCZH+RSFG8L94mOv5ZC0ze2TCO+1iaeYRv23G2J
         k2sXA2b1EccadADh2akYRBfhF4tNIFkMfgX0uS7noyYcuYo619Mkj87zWoPdvbwlDNz4
         YoJXqfwSLeazycz+CHAis0BSt9AzcTObQZGGjQTS51XhBpAcqlSZk28cDl4Sv31tmWi9
         UUFXZ51HK1Us6j0gJTo7qqHkrQPkgEAl5EqpixWyEyF1TaeELhblQtIo//qXS85+2qQW
         qPZg==
X-Forwarded-Encrypted: i=1; AJvYcCXHJGcwxqcQzQzp06rYREISTYf2z4syrSqgOV2m7ZDFeVkyXXqEtlvxTwXQCCGVOX89TxQyVryueuhJPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMYA9+pPvh28L916LVXpg6wKxsTTBhLEu8dIZmNpE94vyKW9A
	gLrhAJfEdLSca5+S6t60M32ugFNbE1auOkLd9GpT8IV/32VUtcEcczEc
X-Gm-Gg: ASbGnctUwzJvEFp2SpW8a4zXijyL0k3qETTC4BnVCKpuIUNke4XPOUrAnispVIEACHh
	gWBvFB18ogvN6872xagbu5WO+zPaApCJGY/OxjnnKTn9DLmLNUvNiJfjiVYeC76kffbx23scmt1
	hfMKn8Rb7iap+rkca7hdzBxbXun2kq+CGsbmhiyW174UoNpWDbRihhfyNDC3rZZhLQQ4BWkROqL
	SrU7noN6P7ZX3YDVTH3Gk3pqSt6hIt7HjkejyekVls9PWjzS7YOzNONJ3F9SP9hcZ8YgECnNaCg
	XtUr0FOI2/SUwHbJKFmD/Wz5hQqqsLFFfoqVeHZeQnzLcasKXUEvjB+twqHCG+Y5oGxlyQ/+PmY
	eWM0Mp0/xZI8P12hm9jLrlsImL9ETKlWdm805PA==
X-Google-Smtp-Source: AGHT+IHCy3e0qspIz9xOBUfl4DFzrhgYH1uWX/O9LZQV10EfDxDXgWG4DqQUX5eJig20VQVw/qTisQ==
X-Received: by 2002:a05:6512:33c8:b0:579:6de0:983b with SMTP id 2adb3069b0e04-5906dc2a41dmr787981e87.17.1759908693893;
        Wed, 08 Oct 2025 00:31:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 12/24] staging: media: tegra-video: vi: improve logic of source requesting
Date: Wed,  8 Oct 2025 10:30:34 +0300
Message-ID: <20251008073046.23231-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

