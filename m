Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB538C419
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527390; cv=none; b=Eh+m61ARMUX1u3k+ndGCm4c9wMt1v7fk6HwE2WSwdKgDx9gnbxArjlxc7Hl423zYZfJz7jJTdzz3T2Iiyy/yE8NTf7aJXmqCnjmgGQ2UQ73CK3D75/HYoKNPk4LKetSj9yg2GIXx2+NLFm+yfQ9++94v7CKgKEE7jEjVZilXVnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527390; c=relaxed/simple;
	bh=XkC6pC1Ht7QYhYz5xBTY+ZnKrbdM95bt/73kNqM5zOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RM6kMuejf9Azax57EoC0dK5ujA/0eqrhI1iCk6w0WL6aSpJ97xVBgld4oBOn60a4YqVlLoEGvhAnBMXN3NmM/m6+T3Z4yET/NDZxQ31lFsHrnzHuR1t/5/Qt34H8UCPZq7qMjoNqRcTEl4QNTl4O2Br0h9Y9vn25SKcOpNAUOo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkRpcI7m; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkRpcI7m"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38706b10b3bso98974171fa.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527384; x=1773132184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=bkRpcI7m/wVE5GZiNV3qWpemY4Hwjz4OfZj4KGlio9HVBZmLr2NQpE/QExWdsdhFd4
         MrWG8dySCvIGFSBlL7C5ytRH2rS5g4IObLw+W21DVUZDnsAlLoZHeUugNzk+yWJItgKx
         84FbZ0JFM7gJROyqBHSR71jWoRGJ3cq1H95LXU7SkeqK2voB08XQ1BAgOAcG9Rpy5T9C
         iObzz0miNJx/UdWO2wl3Jqtw2tC+J7PqRIyNDXN2MwjHaVJXwVPYSR1SZDHMPalTTpsR
         vhOt/7GnxpHkPliXRJia850tPLyYdiKG0u37u4az+9merit5JZvTg4B4f9gpcwOB8JJ1
         8/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527384; x=1773132184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=ZirqG3n/AoseZ8muifkJ8DdGKC1HuxnrZG/rRGxCT8JxjFm/LO1YOV3/m8gwe5Z/Cr
         lVEdNkh2FrahFJdK40gKA1l0jkEiKExiU4KSzTbVuwdXUGnhmUAZrKcfS6byddUuBho4
         f3mx10i1sc7Bc5aX+NvrTU655wxC34l7UokokK+jcebBdMLsgQaYnB8Ns+xayfRJnwsR
         mW+rOel6qEklpMJO97Q+RC4jaOwjaOqBaTpbC+bqA58PETw6jdCwDdmQGUAaPzWWqUl3
         xsYPNGakYu32Zyuj4smMmhoHkUiVBVXOmOz2mYpe5jRC7klwfhe4DPRA0F40R2w0X5vt
         7hZg==
X-Forwarded-Encrypted: i=1; AJvYcCUkcNTbUNYVYIBlpstEMHx0jQX8DJiSaN3DmYOQjzbcAStf/a1ZSY5rATkqoIUEvtFBWnuIuXd0aCOr3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7i2a14GtfyDPl+xSnYIi83TEcvuPgPUOnKtwcqUqVYuFS7uA
	81HnJa62S2jiH3G93Tp7m+7i6ttKFMDd9nvKoVPKdpxuOzFhMwNiS0ax
X-Gm-Gg: ATEYQzybcxs3g788gmoAo2ExGCXfBz7goArDMFzX8/pTMlJ9t+d3bI15w4GiotTFJzJ
	qoSv1wGjjdXdajWkZ00M5gIbIdtD/5PL3FjsF/bYvw2gPfc8BKvvTkDwzefTudcfHd3sPgG9IXG
	XpH1i8YICP5hftc93TBNaZCHscDsJ7EmUlrgjH+rRm0KtIhhK9e1plWDaAKr9dU0ShlVE/PayNm
	3HURFaLQ7mJsJbDRGb7yyIYnvh5ZxvQSFZGuvEJ24r+a3fuodYkefuVRMMoDzv9LxusmPI4N4ZH
	jZzUvARTWhi3RkYp2axm49V2av2rs+1CQORqWh0HZEjTKohfr2WrmCGOraAOo2COmchiflndddP
	fQE8I3G5RIEb8HJfrf/T5VW+v1qmva53xPSts23A4chsDLdls4sSYIe/ZlC9zUbIKGE56LCGsyj
	tfP76U2+DP7Ymh
X-Received: by 2002:a05:651c:2112:b0:38a:34a:7823 with SMTP id 38308e7fff4ca-38a034a7c3dmr110038231fa.21.1772527383803;
        Tue, 03 Mar 2026 00:43:03 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:03 -0800 (PST)
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
Subject: [PATCH v7 10/15] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Tue,  3 Mar 2026 10:42:33 +0200
Message-ID: <20260303084239.15007-11-clamor95@gmail.com>
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

