Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD64537FF52
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777409; cv=none; b=ezOLJVNluy+WWUjdptEV7VUkjTUJ5TIYo6nMmavlsUGurvFOp7O2MpizXYLPuiJce40RkGEt73Powow9WjBKfL5cIgOwEZjfSGY/bczQj9Xlhte0CSa+Y4cDPq/tyIEXbtxtt6RVTFCKtVH1ucT0AL1iPae0ytZswAaCxTxZCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777409; c=relaxed/simple;
	bh=Wf0dy01upHUUUcUAKy8dIbGY/d5SUS2MJZNikXi5lc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwunHFiOH85cTpnGqb7m/ilWhep7k+aO0SQZj5Nu7TGwS0kt+z29wpQy2OXKVWeCTIY97DnPShl2DakD+3uv4wx2MRkWOatE4ApR9AHo+aAwP8MWglS4y6vFTPSBRvLkGmEjeqh+b0DEAV+Z1uRGvoL7ax0wMd8dZxzyZ5UXNT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTlQGv6R; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTlQGv6R"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1615263f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777405; x=1770382205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6KZvaBGZ/GU736NZrNzu56KlpQD0HwXdD7kW+frTF8=;
        b=MTlQGv6RaG+xzSFtYgnj0UL9dmfN85ChiieGoxwvoK5gqjMH22iTXvBtUsp6XeajHv
         9wtHiL6KRMxEQZvOGBrKe0j5o+PfKh2Tup3zdkiWMxocC/+9sNMdTSKFAhOBJbzhVr3i
         Ee9BkIvoWk8n0gOGtgmn0oSLBEmPXaN9P1pYJgqZsuMiDWDUeGo2eCfu412Izn1tCeiv
         ehhjRrVJjewWYecocC+WFy9NyamJk7JB5TUA8N2t0XX5+gLzttZgU6w5pWWjCU/HDMxa
         uGtyRtjSN7/Gg7z2b9UHX3jEyuq9TAPvkLO85FD/JRVOBrzkauNg2u7bv5dXIXrLZ68p
         a1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777405; x=1770382205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6KZvaBGZ/GU736NZrNzu56KlpQD0HwXdD7kW+frTF8=;
        b=jLddt3XyMCfvuknwP9Vuy+gAUX82HesifkjbmIvYwgDnQ9o/8zutfFtIkn8P/V/4im
         4mAX5e0MGBnaPrDUGkLWY29gaTjEWqVHMBl5dVYMRgxqaRg/dG6pe6RAQ24xnVHTqxr1
         qcLEjdXgEQ5trQ1NAajANetNXpieVSP1TN4G7hbZ8BYePiZF8oUGE7jUenx2lgeKrJXE
         t1C+pzBpbVGVlY4Ow2uDIYMpWK6K1SpU/GEqi6T6VGM0QVtPfmXARnJmefYUZSzU956u
         X17Z7a8zaUOjmRIT0AEMP8T59BzB15BdlTRC89mUTmWySCU8MXy8niPKKGsFVDur8386
         +3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtR1QP7n3xUFm9wSGU3zRcebRUHaSS9IqTOEjjs8FCGj9bTOEG+yWvZyprqNYPTeKgUjYKSec9IaNsvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfT0EySLrOSQkERCUqeRuWijcJo3ukkEa8uUzkM5FxLOers4C6
	C/6jfMuRm+lwkvjn2tWqiQseIHAOkkXpiJlMY1bKRb9M4ult4rfAMRGj
X-Gm-Gg: AZuq6aJjACkcqxKOMfyDLCqI5srmfVdO2Fe0jIjH/Ve/C4vK2AAImw3v17lsgVkelfg
	eg+39QyIdG4nHyl+e6MS2NmtBIG4C2bHGNQ5r72/Looo91UwaTX2wa/U4IEUmmUQ1sHmbqqjeQt
	nsTjse5KXR9VBxDYbZfDEJkyt15HGzBxGTHoibIfJ1NmkG55TMhOtJLlGhTCSpFjE1cbzn1uGZM
	7gPbe0X7pfRfhOl9ArrDLIZ8PDyUGgeIusDe8VwgSKKPsftxpYqULHRSxPXDmfZBoK5rJciH5jc
	vKLmCvtqO4WyNgzC1nfkY9tSu2UavwVkg/bK5cPsIGoqxB5zMtM8PLIe8CXz6ywSmVax3jv8/Z7
	FKZFeBBW5F21jbZCi6l8BC4mbtWPG7Oh3R4ffX/RCIyP+WB7Xnk43rr4Sf1H5+aco7cXF1AWc1Y
	2TdPf7Pt4UTNI=
X-Received: by 2002:a5d:5f84:0:b0:435:bcfe:b11 with SMTP id ffacd0b85a97d-435f3a7bb4fmr4713147f8f.18.1769777404425;
        Fri, 30 Jan 2026 04:50:04 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:04 -0800 (PST)
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
Subject: [PATCH v6 09/15] staging: media: tegra-video: tegra20: add support for second output of VI
Date: Fri, 30 Jan 2026 14:49:26 +0200
Message-ID: <20260130124932.351328-10-clamor95@gmail.com>
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

VI in Tegra20/Tegra30 has 2 VI outputs with different set of supported
formats. Convert output registers to macros for simpler work with both
outputs since apart formats their layout matches.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 83 ++++++++++++---------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b2e706fa727b..c8afc6f2adf2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -28,13 +28,19 @@
 #define TEGRA20_MIN_HEIGHT	32U
 #define TEGRA20_MAX_HEIGHT	8190U
 
+/* Tegra20/Tegra30 has 2 outputs in VI */
+enum tegra_vi_out {
+	TEGRA_VI_OUT_1 = 0,
+	TEGRA_VI_OUT_2 = 1,
+};
+
 /* --------------------------------------------------------------------------
  * Registers
  */
 
-#define TEGRA_VI_CONT_SYNCPT_OUT_1			0x0060
-#define       VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT	BIT(8)
-#define       VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT	0
+#define TEGRA_VI_CONT_SYNCPT_OUT(n)			(0x0060 + (n) * 4)
+#define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
+#define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
 
 #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
 #define       VI_INPUT_FIELD_DETECT			BIT(27)
@@ -46,6 +52,7 @@
 #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_INPUT_FORMAT_SFT			2  /* bits [5:2] */
 #define       VI_INPUT_INPUT_FORMAT_YUV422		(0 << VI_INPUT_INPUT_FORMAT_SFT)
+#define       VI_INPUT_INPUT_FORMAT_BAYER		(2 << VI_INPUT_INPUT_FORMAT_SFT)
 #define       VI_INPUT_VIP_INPUT_ENABLE			BIT(1)
 
 #define TEGRA_VI_VI_CORE_CONTROL			0x008c
@@ -66,7 +73,7 @@
 #define       VI_VI_CORE_CONTROL_OUTPUT_TO_EPP_SFT	2
 #define       VI_VI_CORE_CONTROL_OUTPUT_TO_ISP_SFT	0
 
-#define TEGRA_VI_VI_FIRST_OUTPUT_CONTROL		0x0090
+#define TEGRA_VI_VI_OUTPUT_CONTROL(n)			(0x0090 + (n) * 4)
 #define       VI_OUTPUT_FORMAT_EXT			BIT(22)
 #define       VI_OUTPUT_V_DIRECTION			BIT(20)
 #define       VI_OUTPUT_H_DIRECTION			BIT(19)
@@ -80,6 +87,8 @@
 #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+/* TEGRA_VI_OUT_2 supported formats */
+#define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 
 #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
 #define       VI_VIP_H_ACTIVE_PERIOD_SFT		16 /* active pixels/line, must be even */
@@ -89,26 +98,26 @@
 #define       VI_VIP_V_ACTIVE_PERIOD_SFT		16 /* active lines */
 #define       VI_VIP_V_ACTIVE_START_SFT			0
 
-#define TEGRA_VI_VB0_START_ADDRESS_FIRST		0x00c4
-#define TEGRA_VI_VB0_BASE_ADDRESS_FIRST			0x00c8
+#define TEGRA_VI_VB0_START_ADDRESS(n)			(0x00c4 + (n) * 44)
+#define TEGRA_VI_VB0_BASE_ADDRESS(n)			(0x00c8 + (n) * 44)
 #define TEGRA_VI_VB0_START_ADDRESS_U			0x00cc
 #define TEGRA_VI_VB0_BASE_ADDRESS_U			0x00d0
 #define TEGRA_VI_VB0_START_ADDRESS_V			0x00d4
 #define TEGRA_VI_VB0_BASE_ADDRESS_V			0x00d8
 
-#define TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE		0x00e0
-#define       VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT		16
-#define       VI_FIRST_OUTPUT_FRAME_WIDTH_SFT		0
+#define TEGRA_VI_OUTPUT_FRAME_SIZE(n)			(0x00e0 + (n) * 24)
+#define       VI_OUTPUT_FRAME_HEIGHT_SFT		16
+#define       VI_OUTPUT_FRAME_WIDTH_SFT			0
 
-#define TEGRA_VI_VB0_COUNT_FIRST			0x00e4
+#define TEGRA_VI_VB0_COUNT(n)				(0x00e4 + (n) * 24)
 
-#define TEGRA_VI_VB0_SIZE_FIRST				0x00e8
-#define       VI_VB0_SIZE_FIRST_V_SFT			16
-#define       VI_VB0_SIZE_FIRST_H_SFT			0
+#define TEGRA_VI_VB0_SIZE(n)				(0x00e8 + (n) * 24)
+#define       VI_VB0_SIZE_V_SFT				16
+#define       VI_VB0_SIZE_H_SFT				0
 
-#define TEGRA_VI_VB0_BUFFER_STRIDE_FIRST		0x00ec
-#define       VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT	30
-#define       VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT	0
+#define TEGRA_VI_VB0_BUFFER_STRIDE(n)			(0x00ec + (n) * 24)
+#define       VI_VB0_BUFFER_STRIDE_CHROMA_SFT		30
+#define       VI_VB0_BUFFER_STRIDE_LUMA_SFT		0
 
 #define TEGRA_VI_H_LPF_CONTROL				0x0108
 #define       VI_H_LPF_CONTROL_CHROMA_SFT		16
@@ -136,7 +145,7 @@
 #define       VI_CAMERA_CONTROL_TEST_MODE		BIT(1)
 #define       VI_CAMERA_CONTROL_VIP_ENABLE		BIT(0)
 
-#define TEGRA_VI_VI_ENABLE				0x01a4
+#define TEGRA_VI_VI_ENABLE(n)				(0x01a4 + (n) * 4)
 #define       VI_VI_ENABLE_SW_FLOW_CONTROL_OUT1		BIT(1)
 #define       VI_VI_ENABLE_FIRST_OUTPUT_TO_MEM_DISABLE	BIT(0)
 
@@ -366,8 +375,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
-		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_FIRST,  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_FIRST, base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
 		break;
 	}
 }
@@ -455,6 +464,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
+	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -472,33 +482,33 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
 	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
 
-	tegra20_vi_write(chan, TEGRA_VI_VI_FIRST_OUTPUT_CONTROL,
+	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
 			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
 			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
 			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
 			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
 
 	/* Set up frame size */
-	tegra20_vi_write(chan, TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE,
-			 height << VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT |
-			 width  << VI_FIRST_OUTPUT_FRAME_WIDTH_SFT);
+	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
+			 height << VI_OUTPUT_FRAME_HEIGHT_SFT |
+			 width  << VI_OUTPUT_FRAME_WIDTH_SFT);
 
 	/* First output memory enabled */
-	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
+	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
 
 	/* Set the number of frames in the buffer */
-	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT_FIRST, 1);
+	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT(output_channel), 1);
 
 	/* Set up buffer frame size */
-	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE_FIRST,
-			 height << VI_VB0_SIZE_FIRST_V_SFT |
-			 width  << VI_VB0_SIZE_FIRST_H_SFT);
+	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE(output_channel),
+			 height << VI_VB0_SIZE_V_SFT |
+			 width  << VI_VB0_SIZE_H_SFT);
 
-	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE_FIRST,
-			 stride_l << VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT |
-			 stride_c << VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT);
+	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE(output_channel),
+			 stride_l << VI_VB0_BUFFER_STRIDE_LUMA_SFT |
+			 stride_c << VI_VB0_BUFFER_STRIDE_CHROMA_SFT);
 
-	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
+	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
 }
 
 static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
@@ -587,7 +597,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
-	.vi_max_channels = 1, /* parallel input (VIP) */
+	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
 };
@@ -607,6 +617,7 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
+	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
 
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
@@ -637,10 +648,10 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 			 GENMASK(9, 2) << VI_DATA_INPUT_SFT);
 	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
 
-	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
-			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
+	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
+			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
 			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
-			 << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
+			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
 
 	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_STOP_CAPTURE);
 
-- 
2.51.0

