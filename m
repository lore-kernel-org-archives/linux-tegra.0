Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086FA38C2AD
	for <linux-tegra@vger.kernel.org>; Tue,  3 Mar 2026 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527392; cv=none; b=rH/QNoPXfVMlgyMB6ek8FpA241NsLAVjCac/9nGDOoRVRmlGLKA0Sc2c5OaTcxiGRuhtlad2jyPTPaS5xsIjbNkk7Kwp9RBclLhrEa+gxu8uuN7qknB0sodVmAySfsA/ggz4tg7vNwu+nJFyfRxOerfg/MR54kG2WoQf5pSyYaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527392; c=relaxed/simple;
	bh=7exd/knHwUTXbtL7gpxmku7I4/3Lc0/NqudmEPi1PHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhWUJ52dHseH5fj/FFFlaHQ58/j0MOgKkfZOOjkIM2/FwThq30GsEvuQOYu8bxApRprjno3/sAWZUR7dFUm+2izps4uZ3Q3yiTRw4WsPXXRwqzsuVpjlf8x5707o2Oiuutfj6gcRuI3ZF90ZSZDBYsNntLse6J/4g/e8qGH/p7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnCBJuuT; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnCBJuuT"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389e139ee5eso89750001fa.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Mar 2026 00:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527388; x=1773132188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI8V+9k69rlYV5L2TtkXx8LtnMYI334GXubYSiK/FVQ=;
        b=BnCBJuuTNzHhnsH19vl9yOWXk7Worl3PE2EqXBB1F6Nw44Go42TpeBQzkxt++pi7rX
         OMUhepg+RdJkFaOQmz/epybMTBpW7Y2tuFlgDuJKwVM9ocChvsYEt3tIREQgNMg1EY4l
         MdtEVBa0A7Amc3QIam971F4ZkmovGR0aUsXVwrKHyrGr0dt3nPlXFnDY+SHPXJ0aBVjR
         KNUTVipQ6McUwHYwY//86XBeNQeSgG34/nIImo2A9JfiimeCuaNv9HTozHpR32EmcNgZ
         nR1fP8S4hQHEzbUuYn5KAPOW1VZig5rx822NWNauFXkXRmixMc8pENgJGAcPSWtwb7u/
         o+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527388; x=1773132188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GI8V+9k69rlYV5L2TtkXx8LtnMYI334GXubYSiK/FVQ=;
        b=UCjBEkPVWFPkLPv0Pr3md0uKJLc+1mqMmL+gbMNCrHvjLvG5g8yRZ+e0d9+Hiu5t90
         eFbUWjqmn7GiXAWeOAOq4dNw0Tm7ySViFHqEx/LraI3j86nDgojRErHRdyMTlwiF0kQG
         debe24jhafqUcWOcH2yD7PVTZOAzIbIT9ITiACaXKjDaexikbEVO9ts0L3E1TFzn49hs
         +q9kx2E0g3z47aKhF2YL3dbL8oeHCJKxXtQSiMp9lyMTmK634H5fEowKGYjFozSOiqEQ
         Ko/WqyNKNABeqpncSpym1gfKwY27yoUTreAuFUJZ0M1erXB02sryr+dcMSA3UpDzt2v6
         al4A==
X-Forwarded-Encrypted: i=1; AJvYcCXW1mWp9Gbbs7KHsd5Ey7EEw3KTmOugq9PuQPoLCH12Bnv2fNfFXrG/iLX5cPgcYo9qkdkIzLJx2+SgiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRPX9gtmxFm+mRe2NgzxqWQNp4hfhuO9bJOIyHeI+sOJH3Rhw0
	YLgXt+MndLE8yiKRJkEY6qIUxqh3d1dR60o7UbrjmT+Rplx2E8r5r//u
X-Gm-Gg: ATEYQzxENF0gwvQ5Y4n1ME5XA9ManycLpGGYyLRl9jdxEpJmj6gFYAijoWQHqZ/z66u
	TIika0AAzgc/L44TrYwW2qXXwMIyrT93SQfx4Hap7m0RSG2E/wVjTXxNe1oDe75bOcAN4Ht2UdW
	EFpNBzEBuvcl1BC/d0N0X9V6ylSSwDjT+gYluls1+F/AODyS7ADn9vRWDRi/+SjyhgNEdkK14ZB
	eeQMGNiDyd3UEM7oOkC+XpXZEbPFrPgfecBsF6ouKwGkhflg1w6ptl1sCCSqQ0WSSlw2TP16ZcP
	+GczUuDHWrsPlnhgts81ED4cbfv94Co0dC5hZ80K/nJUnKvV9jnVjdBS1an+sBbofd+y9GHD/K2
	y+ydKq/xl9jCbz73tKknRHvMfFmFOhyoMrsxQLNDUD9vIiXsh38Dej09QavwuW/jxiCMG/Sika+
	Rm+ylCSC2qVb3M
X-Received: by 2002:a2e:a10b:0:b0:389:f86a:f44 with SMTP id 38308e7fff4ca-389ff34f72bmr124257521fa.26.1772527387969;
        Tue, 03 Mar 2026 00:43:07 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:07 -0800 (PST)
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
Subject: [PATCH v7 13/15] staging: media: tegra-video: tegra20: expand format support with RAW8/10 and YUV422/YUV420p 1X16
Date: Tue,  3 Mar 2026 10:42:36 +0200
Message-ID: <20260303084239.15007-14-clamor95@gmail.com>
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

Add support for Bayer formats (RAW8 and RAW10) and YUV422/420p 1X16
versions of existing YUV422/YUV420p 2X8.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 74 ++++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index bf8755698610..36a57078d539 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -187,6 +187,18 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
+	/* RAW8 */
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	/* RAW10 */
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		(*main_input_format) = VI_INPUT_INPUT_FORMAT_BAYER;
+		break;
 	}
 }
 
@@ -221,6 +233,18 @@ static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YVU420:
 		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
+		break;
 	}
 }
 
@@ -308,6 +332,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
 		if (chan->vflip)
 			chan->start_offset += stride * (height - 1);
 		if (chan->hflip)
@@ -373,6 +407,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
 		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		break;
 	}
 }
 
@@ -454,12 +501,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
 static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 {
 	u32 output_fourcc = chan->format.pixelformat;
+	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -586,9 +636,25 @@ static const struct tegra_video_format tegra20_video_formats[] = {
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, YVYU),
 	/* YUV420P */
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, YVU420),
+	/* RAW 8 */
+	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 2, SRGGB8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 2, SGRBG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 2, SGBRG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 2, SBGGR8),
+	/* RAW 10 */
+	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 2, SRGGB10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 2, SGRBG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 2, SGBRG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 2, SBGGR10),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
@@ -615,10 +681,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	u32 data_type = vi_chan->fmtinfo->img_dt;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
-
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
 
-- 
2.51.0

