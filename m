Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19353803D1
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777410; cv=none; b=QqW3fj5dmK2TX9ROt259VsO4/a8wDrrMojKkBPFQMsIBSHFfko9e+l27h6sOZ4ZbOA6ooLDxSD7EIui8RI2MUbLLiInntY5O8y9kD0n75TOh84CPcnRTY1Wx6Lyv9g2RFpoI5PwN5tneIDAovVFvC1Ouyn3UTurwgd/FVpPtOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777410; c=relaxed/simple;
	bh=XkC6pC1Ht7QYhYz5xBTY+ZnKrbdM95bt/73kNqM5zOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l97yxZYb70pvBGDS8JZM/2l/wHGrK/pdekHFOiJQ2cKIwzKHNh7ijj17XCylYVuIEQ7+ooIV2Wlqh+X461QJq17U6354yNtt7d1/eF3XIbFLUM61wCJo4TAJ37VyTrycw+SnHBAfRgsGhuVzEVAu0rgx/11AZafSKB+sxPIAczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2KolQS2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2KolQS2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d2670932so1986748f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777406; x=1770382206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=d2KolQS2+suGkg6hfU8mLCyAOZmCCxFDjzuqt30vafRIheHXGHEsPNLeSKELOlL2j4
         MTHrWbvn9TUIdysoiScWorpivDQYeXFN7/IY6mm/aGZikIu8IooWaJWkeT7q+72zHZLI
         7aln6Mbq9RSxqlbeaXHeJAa+uIl0kXr9S/R5LNqUuie53+TifSmU1xlIcm7gyKEtVC/x
         5z6AYjSM29gaClhta49B46sKYhdWqdTf7WgDBwLmhzJ3BHI9xRQjt3bkGXWa+2yfv/6v
         AHU+XdDpP/SQEFYigUL/5pVY58hdHPWgiDfJFpL9bdR9T2rqgzqxFEOTnCK6FEiVX25o
         jYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777406; x=1770382206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=E7tKCpqqFeqz8jtPGNW2PoFm7S+4f07rJGTQsd6bQOd2l4R38LvbT4rkJslCxnk1oM
         avaFfv8uWofAt+PfxVMz6RClO4yjZUa40J4w7GqAn2DXbNtXYMoYGwoHD6Jy8IwsbC84
         iTIhLG+KI0LakBOrxaMtWQ6xP44OVge5eHhP2gOqcWhAIUX8hh7itr4Si34ntDPiaEtl
         sawqGq8SYY2QpZiYx2xCVaSeMkqSK7LG3ycdCBH5JF44qknSIxYCpLEy7iZuoRRwRLEB
         2GxAxdfh24sI6Q42JxJkRsxBgEbJP7u/E/BxsAIzwq4D9kwawfmEdXQFnA70DwThMCfF
         kfog==
X-Forwarded-Encrypted: i=1; AJvYcCV7SgtxvvdgV4EJ1VPK4JT1mVAUoygi9Ojh28Rnhe3SL3FtFNDBbfphKhBTaeCIk+txSInyJHxHTnP9qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kzAjOkYdKve0GnKalxl1Z45+uX8irHqd+HaSHDZ7zvlo55PK
	EUNIN5vO167DU2KVjjKbTQ6ZWSMvzq6QAqR5ZAVyqqy5rarzTjv2JmEz
X-Gm-Gg: AZuq6aJ85N86glx8v9KbjIQyySZSOt6gF2ARXkEb5/8ZFV2+FiE614fhb8aHCrDg4Ug
	lkC7ac9AE3EC72QdZwRb6ZUioYHqNyxuC5ff0gD1+Unnc3fd7wUmEUMQ2ZKPJR2U1NXXgQ/VVbA
	hDfBOTrRGwMr5/Vvz8SP5sJSwQmjPcyLvLAUta+6SDKUwao+SAfDCYa7wFn1fmiDKH8aQgbFDyt
	DYXCqhIO7+wgRmZ97I2PQzeYlk3WmiwEqQ3C4ZnQkDScQ6UstFtLMPPQ+4if/ey9LU59Z77kt9Q
	PcsUeJi5a4pWtg9zZcrtUQEmEBGjgaXvw+5WP3Ml3XwQdotMtAaB4P8MAAWlewUuX+t5By5Enl7
	IZlySmNkUudcPpZhah/4VFdWL0P4yEiMXk7jDAZ8pVs8POM2dyt0onKyuS5EuRFAzFJJn8qd+Mj
	wZ
X-Received: by 2002:a05:6000:2689:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-435f3a7bb17mr4337461f8f.24.1769777405561;
        Fri, 30 Jan 2026 04:50:05 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:05 -0800 (PST)
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
Subject: [PATCH v6 10/15] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Fri, 30 Jan 2026 14:49:27 +0200
Message-ID: <20260130124932.351328-11-clamor95@gmail.com>
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

Expand supported formats structure with data_type and bit_width fields
required for CSI support. Adjust tegra20_fmt_align by factoring out common
bytesperline and sizeimage calculation logic shared by supported planar
and non-planar formats and leaving planar-related correction under a
switch.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c8afc6f2adf2..4b218b9fbc26 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
+	pix->bytesperline = roundup(pix->width, 8) * bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
 	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		pix->sizeimage = pix->sizeimage * 3 / 2;
 		break;
 	}
 }
@@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	/* YUV420P */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.51.0

