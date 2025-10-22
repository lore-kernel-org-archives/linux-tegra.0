Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD05347BCF
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142919; cv=none; b=E5gI7fXGm669Idsbz3f/ORBNvz5ffH2PIBtH31odwmh8ZkePHtlj49c03zxkW7QGvvZkPQPQQwKEeADCw9JTzTdUO/fCeHgVR6AdqJeiG0WKD7jVBGd2QFdYyz8KRQwrPrBBgKcl/zDX2K3D4B6fOgfNBMJH1HOCrViHi0knTMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142919; c=relaxed/simple;
	bh=C7vJ1F7cTRJlUjfw/9ZIDrW99S3GCg1Ni6T3HWcAFl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uebXmkJVEyhM1BxKSOyFeWtdfzFWG4Vf5Najn1B3dr1ZVTmltm3jkn26GSjeUgKS4z0fd8vfEuIP+b1OayPZDMaJCHI09nmj74M+nCTUsIioZ9xw2jGa+A5EpQhQZfYQoMavngv8hLaZYDAZt9AzqybU5zqZmuE8AXz7yEOR/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOsP/YlB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOsP/YlB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ece1102998so5677278f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142912; x=1761747712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWzzLwH6jgxXjmQF82SSMCUND+xg2EriGxgvFhDvOZc=;
        b=UOsP/YlBxcLxzT7YJFaMWyC3rqVK5bFppD6Ew11c3y1rs5Mb6tRZ7vwt2US0zXMOTB
         eWLe+25LOLGigl11FQNbDmtn/FKhgcyrlVtC/o8tri0Ij9LJDyL/WbS/qER/gO4k9Szx
         PQOzBuz+7HZKJ9M3R9FY2ogtp4jbA0wLs6W3T3T1fPs6kThFK00Xz8HBFu3TIIqojeVq
         9ihacOsZos+m/s8UZA9ykvTwwzMWLRLzjL2FJ1aKbFcMVRXsWzzC0GaKJtmUZCS28oGh
         z0vDCuT9eW3BI7iAASagYkC3V2AK3HWFWzo92n1V40lE6W5aUyp1NoEFD4lZiyDapT+Y
         o1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142912; x=1761747712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWzzLwH6jgxXjmQF82SSMCUND+xg2EriGxgvFhDvOZc=;
        b=coNrOkvtUvfzKWa6MWgfqMNuEgURGGJEVE9O5uf21z9gH/YFuw1fQjCISc8ilit/2U
         gFXmx2WFie7z6Mdz+pfF3RDU6Gxqzzy4IjlScxPr94kYz2DT+YUT+9M4MpqmM0MzODcS
         yRB1qAtuf3Tk9oJbTrW3wDdkMwA9Ux/5GbYS6V4bl3cTEu3NOUjLa0242itklzjMuxzX
         MPe7a9V3TpVf2UTmeYr+cbKvQYeoG2M7uyoW+dc2cPu3bmovQqmfNPKtbxZ7c2efA51/
         //pqUE48P/om2vd5teBGukZsJTcF/i/oujaZH8YqxfEpzzMflu4yqyTvtl1J5pyclGmL
         CmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8pssYTSa3bFyehTAmOYeJxUsp6fy5/jNWRDAfxkAByn9jBMbbHWPRYitLarjKuPUjpY9dXm58dp4qAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIt+6VK88LZBeE9xwYP5lJ/HzLnAfN27hgBYNjiLTBnYQHWfu
	kXLr08izU4GKICN4fkbXnzkG44OU9pNUO+CGyebcw4Flxe7qCEyUMV2m
X-Gm-Gg: ASbGncuIv2T6x1ThUqeu6vsm7NOT0RZTDTg38Y/ghxaDW7b9v+u/zQAZSekpqdFX1Po
	P0L8coc4pRrlZQXVKDiMo8CAV5RnsH+GqG3f1tTOvlJ5BwkoYMv/TbMVmeEIB7iL8Bv2tJZS9J5
	FdmDJv+8LN3XKIg+EJooFZjy3FJi4JgKfAs9MqNB2TJJBUHJtm5KXYOT+8n7SbgGTXyNXXTpPgV
	uknHiszj5aEtvGXTBswn8q8VevbthJ2VJBEfRL5TeGM0aaeVOQTruoMgkqeTC2ykcsZP/JxIePv
	Lc3G3+I3ywFyuCLhZA87D3FG24qIFfERWvM9V2JUHpP1ot/ANpDnH4IBqPI4J6RxZ/3Wei47uNA
	J9WXi4H594UApF83gQn57i5WUD+ZKF7XNc+Hr5/yc7wxREW8rwEK8C5tTdlduKG3V0a8=
X-Google-Smtp-Source: AGHT+IFxEX5dT11epaReQydShPRaD3ap7YNMoGZ00ekJglzcEJYx4BxQ7S6YQXgiTMxPpQinmI9SWQ==
X-Received: by 2002:a05:6000:2087:b0:427:921:8985 with SMTP id ffacd0b85a97d-42709218a51mr12660456f8f.40.1761142911810;
        Wed, 22 Oct 2025 07:21:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:51 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 16/23] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Wed, 22 Oct 2025 17:20:44 +0300
Message-ID: <20251022142051.70400-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7c3ff843235d..ffaaa2bb8269 100644
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
2.48.1

