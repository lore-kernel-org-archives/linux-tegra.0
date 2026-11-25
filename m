Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604904;
	b=uJwKFpwSM8/Qm9fQK0ctEdNhJbMmKCRB+bNMwzD8z3FdOmwbrSq23LV3cmlGZQok3P1T
	 h+U5crN5bxZYFSNi+Sz7VmKYifc0+0QKGjspTz0g0uRqesPJs9aXm64pPXkEHgqdpF7yB
	 BfXlEcYH5r1GD3Q6XG3xdPeZXEc8x+wukSw+mIK3kb8zrNZk/SOJnA0lktF80PrsizAr9
	 zmpZZqaYeL9nF94eWuypYVusL4vP04A8H/flCP+h4bwpRyOA9non4zyifBLaSkYgy7J02
	 zk4xRB5SvRTpA3WYe3OEABky9TKpWX19Rf77Fr+fbiAs6Ta4Cls2bIyVEnr2wKsLghA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
	b=0298t4UKKJKlanu61jMmhdUxC11XzocOV3dl5f4J/AaHNHFMvFS0WLjanc8x/qm9NxoP
	 y7qdzgkH++fcVjbc7Njc9LKhCN/5QQygWJt6wYT2IbMb8e5QvL/VFZ1SFpUntAVzHxNZL
	 gDnji/Z+PMfuvYs2RiFh1ip/tgzDktVW+rCIcfyjrx3/+OWTEMqVR3W0j4HvQDiFPzRgi
	 lLsy15VfT9Bz1Odk65MarReq3lh/9/eViHEv63p7RWUsqooKBggZB6Q1hLhmTkkmqDNz1
	 8D7AdJWI+dl3qSZykeGVDRGrMvuur11Ln6l9AzVa+Cs06V8kMeeDY841TBtCLRgA8LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiinHlSZ;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D302606A688
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D302606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiinHlSZ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c506a231b88so765243266b.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604903; x=1796209703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=fiinHlSZ4d5n4rtusOLKpKA07IaP8NmNIFpIRUj8t7HuqheUUlByO7nqIWPntp0r+E
         1ZpuiitbvDscUgOjtxsZQcWVuBYSCosRBBJUrZR0Uuz6vgcr/V1jW/77sq3hTniMk4nC
         NBSxkCCDBtkczMdkpJZeCRAFIm4rgQS0ld9c6+QBpgL9m+dSzQWLmSyacyP5TVYsX57b
         6LVST4FiTxHCtjs85cojinGlIaxEZpcyj19cqEiemxobp/zGGA2928l6rdmKT1kCQSzz
         ZtZc+DgZFBIifyGg3PYWbagWs++3PaqRCdccoWHvUbkn+D5zUy6oy1I3bnz+yV1y+feh
         jTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604903; x=1796209703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=HqGT2wvFDYKc2PlDjn0guXMvQAtJiH4+8fA8acLlIVBpUP1fsoGd6hM3Yln1GmZs0x
         59fzt9ynJ/ej39HFZd1GtNHqpqtPXAqDpqTwL44hTMj3/D+2GDlbe8BgVCyPuqgdGBlE
         vdZ53ADKyCOhVBrbr2ovgsTRhshhSaivSL9DwTG+38IY79BPZU5x2b8fw4zVfP4/3yX/
         k7z4bD4VxJAbrIy1OakKpnNdB40+SQAzexxiv+AlVPjCXiHkHI7uFWC77M1HpGckZ15X
         W5k/GsTkZIODZBeeecolhw+OlxvcOzUCv4VR0Xj84C8tjQ/c6duDr0wi9mA2m6xMsMaY
         TASQ==
X-Forwarded-Encrypted: i=1; AL+hErEXJS450Dxcn+CbfOZ/9uoSRvScdje0Lka4ii2hCHTzVdOOZkeAri2PPD3SuzBeQ3uWle0+m8a7LxAkdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+iGY3p77exgh0Zd3wCg+OgtDkh712uMxfwleMNiTDS3m3uURYy
	YOkVgyGNl8PUUdIKUqA0A+UKB1I4lPR6f1es4uWkSQ/Fcn0k2gx5PpaW
X-Gm-Gg: AZFdTZee2Fo/r3nX+oNvyp2A58J71cAOb+ewirZU/sNUXNA27lYWw/w8fHEfLyAiG7v
	+2VnlyCUuoBqM/Zu9s3TFKoDM7dTGVIVuKKeoF8C/j56RjNL6U03L4juPCthwJN+lDp/wkyQpoz
	2z4fEmEs/sGl8Ri4lH0WuTNZ+dWurM9LyL3uG/YEBiIJnpxz6LRJPeX7ymMvxNrSK647Uq1nhGz
	yzxBrwdlsWb/VNaXo2Iy6MIQ/JbcF1HEZjWDzNGAeKFkYACxzEWwxwk+67f2N6AU0xPzU2wqSuu
	IxbJLx/gs1f/qDOQxzU3SxRfgQWOQVqczu1KYWz+YEijdMEy9f8K3Or9SVD9O178RfXIshZ++tt
	BfP4W/RD6iGcQZWLNcdViODUzYlQM++p4m7QRb4AmBoFelFyOahyfiJS3SulQeFZ1T/2656QCJl
	eSDbeEM+w2YtmFfJ+7t9sYCpAUJHYHdEvv+6pchYtZce3MTUBnyYkjI1R/yZ73umzSonGJv44BV
	+Sya6XWVNzsJ/gIaU6Q5nvSev5qKA286aQvkhlwRo2DYza3gJpwUy4b8iQsR8Zdaw3JNHe34XLz
	1TCawTRkke/r4snGMUyjN8qeShApAeNAOEIyphnEYK2rlcu2P7Czl/DVUoHnNoCawug9eCfZ2HY
	VIAmFe6jXE9Y=
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id a640c23a62f3a-c513a5da66bmr1367694366b.9.1795604902648;
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
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
Subject: [PATCH v1 02/13] media: tegra-video: vi: Drop controls consolidation into VI device
Date: Wed, 25 Nov 2026 13:07:39 +0200
Message-ID: <20261125110750.223628-3-clamor95@gmail.com>
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

Like any video-centric video input pipeline, Tegra VI combines all
controls from linked devices into a /dev/video*. This behavior is no
longer desired, since it causes conflicts when controls are duplicated and
does not allow including controls from auxiliary devices such as a VCM or
flash LEDs. Remove consolidation of all devices in the pipe into the VI
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 24 ++-----------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index fa6114f4b9c8b..71921931457be 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -960,9 +960,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 #else
-	struct v4l2_subdev *subdev;
-	struct v4l2_ctrl *hflip, *vflip;
-
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
 	if (chan->ctrl_handler.error) {
@@ -973,27 +970,10 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
-
-	ret = v4l2_ctrl_add_handler(&chan->ctrl_handler, subdev->ctrl_handler,
-				    NULL, true);
-	if (ret < 0) {
-		dev_err(chan->vi->dev,
-			"failed to add subdev %s ctrl handler: %d\n",
-			subdev->name, ret);
-		v4l2_ctrl_handler_free(&chan->ctrl_handler);
-		return ret;
-	}
-
-	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
-	if (chan->vi->soc->has_h_v_flip && !hflip)
+	if (chan->vi->soc->has_h_v_flip) {
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-
-	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
-	if (chan->vi->soc->has_h_v_flip && !vflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 #endif
 
 	/* setup the controls */
-- 
2.53.0

