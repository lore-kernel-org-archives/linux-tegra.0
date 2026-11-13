Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586731;
	b=icN8TrKBsF3C+N2bBtB+j4saNjC/KTsMxEY/Nky9f7iUJPj11C31jZuHWPJxoZql9M62
	 eniq18XMjO7GPbcZw38leMCjOV0tAay2Yc0BaQDu0ReHYBVujRyiAxwO3CGsssiAaiGHj
	 HMNXWLg9MaG/4aO07pPC6OsAAXQoITxiF2nvuPjvXlyL0CYjNKo/eQXs/A+0B+wVug3zx
	 /s3f3cc3fNhxzkzyMeBdnTVHENaaqJUzU+ANfbP3bfqf8zkM1bBNYKCUra+g+yKvSPpBT
	 sG8X7fkUZpFpfRDi8rC1cig0THujIsnIrCv4Iq8qBQj4AImXNVCSyMhGITT8kqh1pmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
	b=Ik2rGkw1slWqyXhlxF78XYy/gxeIRL0fRomQ+g4tlcSsbC5U++j3KgeKnU9zrMvikc/3
	 fA5dDGL0tRtnnthA4XZaJI4IofC2Jkvoam00F2mAbRj8/dBrt4tNEZ3IRdkPHPwPfbYnd
	 5UoZMCssQ3my50ojQ9fAjsqaynljd9OxlIg41ogqGhPTiPd/cQCL//QdRz85PJqSZEmDF
	 55xI0mqcY6GSsW6+Ltn7STknTu0KIWzFmyGh8ExERKRKuwQK/3jOiZU81vVyxru5njCqr
	 6FafbLaFT5td4w0Wkr78dCB1q4BjiMZ+IWHk2PG0qgCRVpG6HjcJA3usK8HWghF3Y8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E856070FD4
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E856070FD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9UjRtUD
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d28f75d62so294889766b.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586730; x=1795191530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=M9UjRtUD4pPPLVx2rlfKtPnYulHOmQSBlzv65hZNd5XJrP8uTSeIG482GQPfDk2hI7
         hOaz8LyLCg+QxHlOolUeh0iqb+6iSi3cV/qtjXjXepsA7nflo5i6k4xzG6Y2p7yay+dK
         umAZt5M7Kq7R8GyhiDHbQFd60NUsxnASXTPBR0SFhakXg7GxXJseLT33OIDoFf/DapK+
         gvcGIO7iugM78r3VU+QwMPYwEBBCSpNdnizDlMF5THvTY+DWpuvTqjJKsCepIWre8yBt
         AoKrHK2cMdqTBtSQYRo2Ca+b1+AdFUx+IjKahNuJV+3QDeWAzd2TeBOTh98kGKp4wmRi
         OVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586730; x=1795191530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=tPQ8pXToD1INp1sFXa0WJ9VZFvnnm3u/VFHAbljNLGm06AbynFXMy5nslsuouiPg1G
         ofS0oWSKzvvvMVCVjHRo6dBXHogWplamJxlL67MzD0qkXDU/809i9Jn0YRV93NoXiGD8
         ZBj/C6+Uy4RwCAtldR9tPMzvDF1itD8fWwiwGGSN30JL3TC+tV71fMEDI8cvQ3O1cLUN
         x5B7x3QcvmAQQ1fBdlakgo4SYk0qEWJiBcGSVEOkn24GcAuWrpzn0RUUljAETO+uyHs1
         xZ+RhwTbK9HL7QzhviWCwpqv0QyDDZtuQMh0QN+ls/F/4CALtk0TRHg7O2QzWWGvXgFT
         S+0g==
X-Forwarded-Encrypted: i=1; AL+hErEBcN/dVIuJFUQ8BZMVuDdQoWiPOwrPQ1HY9rdBjsF/XniTcZB5z+Xri3bCts9Rye7A+efipKx1ntcEpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z87V5AiwDF6SXcMckWwjy5QFyjECx3rN2616qcFfpByiX9dllla
	AqhVMszqPAiw+JD9y3hGg4naczO7W+JC/0dHAfGkXJ67yotobAEY6GhZ
X-Gm-Gg: AYBFou2WbTFu54hzXK9qs6qKBeOO6mh5BvQEJXt6L52MEzaQocgAHxJ/FI4eFTWcYmT
	QROxP9UY10Lm9Dmxe8vgbjSAsUYok5e8ozX+x3F8dQlBIOQLaSqsnEvZPzIlwwtV6EZMcp9Fg2y
	DxbIGIwF5PMyY8E5mCBCFhDRbeCfgLSuGD9J7rEM+jEZqIdjOkF9BebqbwXWcCnk7RcT9WqkD1Y
	vlgfpo5DtCuXVFwaUWKS0Asp6SG1kXuTI7cfF9biHq3cxUs74j9HE/sGru6uB3uA+mNRY5O+KJ6
	sq5oFMsRFx1g0+gMo+ETlcjmxwSvgSNSQWY2/yoxoV6DRQoIN/qzv8EzVSaW+LjuLJuNzzcU8Vn
	uENUobu0LmqD4/Owt2nwJkPC3gJXngYRc712M0chEfsZETbB2Tl8Y9tkl3eSVvSWAx/0YY5vwdk
	SO3BEGRDWmTDTdIv2YswWgAC5FutzqImlhdifeuze4Tsh2LJlETUWG/gQLhc5DXUwJLziEiwPWe
	fv7ADlE0Rb98bSNrbg70CieFP9wA0Z7xX8BJ2tscoKs9PYULm0phUxR2TwUuiHea1YUXPjLJ+qt
	heYc46IRQ9ImJifIwupxmTX5Wju+moP9h+sTjeS5hqBT7SexxMrOSn8PXWaxyshuBhX3aAbg56L
	TDSNHToZnww==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr252539966b.42.1794586729694;
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/10] media: tegra-video: vi: Use entity function to check subdev type
Date: Fri, 13 Nov 2026 18:18:14 +0200
Message-ID: <20261113161819.36847-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() function relies on pad flags
to terminate the search for the initial sensor. This causes it to iterate
through devices that should be bypassed—for example, the pixel array (PA)
of the mt9m114, where the internal image signal processor (IFP) should be
the initial source instead. Switch to checking entity->function for a
sensor or ISP to terminate the search.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index a96ef26af89eb..5c649e3162fe3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -189,13 +189,12 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 	entity = &subdev->entity;
 
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
+	while (entity->function != MEDIA_ENT_F_PROC_VIDEO_ISP &&
+	       entity->function != MEDIA_ENT_F_CAM_SENSOR) {
 		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-		pad = &entity->pads[0];
 		subdev = media_entity_to_v4l2_subdev(entity);
 	}
 
-- 
2.53.0

