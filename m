Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605993;
	b=GF7dLP6LwqO31j5rtI0OBb66wNUR3dC3r7wUV56pszNNcgqP8b8hQovi+xVRNR+G8hzn
	 Q6LU1+GhJ7g5pomgzSGSAYtRGjRQWbUuyvW/3ppxJRDFpEaozOhCDolNfXh+t/Q0oPsRU
	 jbkppVvKZWZMPCk9ouEkagSGYE3hm7YqbwiOxjQutyzK0GA+vDV4ewZ56+XVsa972TFK1
	 YvhxLMGJ2Pn4s6FR+Nlgz81u0ajfhWtMCyK6yXJJgGTwc1CUo6Be+c9K7fjxFOzWS2dcf
	 u6iQraHB5zdQ1tSQjtuSLjPE5s/p/zz6l8RYEIXEGGokXQTZMM248b2e1R3AhXcfMdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
	b=dIdIgBR6R20H9fVcxrXIUJoDo5/choYc/gNeELZSgr3o/HVslDJvCXvHM1H1kPf4Ij+v
	 LExvPgMd3vnArr4Nw69D++2yAwOZvIe8BtSUWiEkPT0sBxQuTyg+Zaoe9rQ42y4fRyzxm
	 ZlhexcrimT2rYUq6r7fN1rLzSMg6Sk8y7qq7PK6RfYmmv1uGx8+xl8DWSB0c1gGhYUOou
	 Ltzuvj6Vy/GjYs4iPdDbOaNhdDcK4l4vQiILljajll5U7iFT2vauqCYKQQpN2XY5XDZEX
	 1wMsLh/y4SrNezHqwgdC/eDZzAjWV7pHtqPARP+g53Wr3q8K16WnpD+CWY/DJbFNQfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptHjGKmw;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CBF606A6B8
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CBF606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptHjGKmw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so6473946a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605992; x=1796210792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=ptHjGKmwfr/RLAGTM0/nWPiOARrnjjxlnXWjBYDz5gvePjmj/X0xVJSsS97aVEh996
         vlTAOWHsG9Ww6x8792xg0M7X5GIYfR6BnaKAtrdS32ulrQq+6t+Swszer1FImvPeqq36
         y4Xyb87/8SLnqDm3b+yVUh4N80TmVA9OU0pMX0Fxg5R5zlijNU71pAXeDyw037a6Q6dM
         95g+40hLWi2P/dGixwoR+kE5U6q15Nvj5t6C19t91fQa2l0rc3Ynozw/OiW0kJ6hB6cQ
         MiYoK3WH1/U4PHGSFZYtJ5KWrdA/eDeIVhiN8iI9MZMpKCQe5o79a/rvU07kI2FfiNkg
         HoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605992; x=1796210792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=DxT4iIlAv3i009rgpNq5uGNXUJV54ho/WiEzpmE2KqqsOdwd+TwKROP8UUUo/Cj6Fq
         SDjz2qt9UEqenvwt9pe+n73/HAauXAbjdc/r2gcVk4lPgOYWMm5Y2s+ntQfizOBOxco0
         +lYTbfbIzdxNx/4dnEL56LivVn6pW3/N3BtjtOuZB1X5whCVbbXDR3b4ASfDgft31ea5
         5Xk7TBobEJM2cgf22aZkltcE0DGwe/J5BDHt3RgUnP3p5RDub0BynvoJWZd7Do1XLDOv
         qJNYjK05lUcaNGS1uyp1+YbRzF5TtT1zxH6+gae3ySg8XtJ6SfBQMcy9m1R323rfL16x
         vZ1A==
X-Forwarded-Encrypted: i=1; AL+hErEb18gGClyX9Oy3CRGGLJkqjFI1UeBYPvqIoClg8lD2YecFgjkEICpBJGvFUDFL17L9jGsEDQB7jNwSDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2AGikpnVIwphCAkfNS9gKHN4Cp7UalHGTqvfotYKCeLfYcP03
	reVdnkdtRk70sVJBQB9RRhsSdPxyoUNqsRvaaghdAV+TQEEUvHUd/5km
X-Gm-Gg: AZFdTZcboYBMo7Oxbu0TfL/+VzLb+ha+x1FN6upRQB6VrXFvg3T756athFTGRGw8568
	fgF8mGDw956Pfttnihkx3cyfg3fr/rvd6xpPhNNT1i1QPfGiwNJNlIeBULAl+1kVJiXL2OXlL8f
	dMFvtqvgtmTG2g9HNuGHA5w2T7VYUNk//hknxcHcX5+HPtS0UuiDAUonN+jXSGYgjFivFwLjeuy
	qfF+Xh0SdoXop1dLMHk4gaPH3GVJJhlPu98rW30QDiWbUZrA4rTCim5lHxeNxRLSkvKPjaSRYBQ
	eleurB12qjAMg/59u1vnCeMMMLltejEKTp55paXhKDMmJWTTEvxoCSQodo6amfsrmxYjYXyVbRp
	JTEDRRUYLZ/77aYcf07QWD6GnCwOdMs5/qQRgFeIQ59tMNS5/4GhJr9OgeigmZS2bNh2Zroh+Qd
	ZG73//atvtfwHHiTR0HfHnjGM44Vao31pWg79eQXsp+JOxeBjhRwq9a1HQc3nhZCjNCXbZwSnVg
	HNmncTNhZh2TRsQGPuDLE8n4FK5Htbmj5sPuTORaeaocbVfqYmYplcyAoMytMBRRyBtg7AZntVx
	DaAEL7jTgaAcbTE4fLJvZiglZZOnwQ+cWoZPtGoi5E+jXQWCAsIC8ZoI5axvI9HNsye/0wvgz9V
	AtCBPfmBNZg==
X-Received: by 2002:a05:6402:3222:b0:6b2:2339:370d with SMTP id 4fb4d7f45d1cf-6ba37ec485cmr14832157a12.39.1795605991602;
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/7] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Wed, 25 Nov 2026 13:26:08 +0200
Message-ID: <20261125112613.237333-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Further investigation shows that the current maximum VI clock rate is too
high for Tegra20 and is better suited for Tegra30. The correct clock
frequency for Tegra20 should be 150 MHz, as it was set prior to the
addition of Tegra30 VI support — a value backed up by the current Tegra20
peripheral OPP table. Tegra30 supports up to 470 MHz for the VI clock,
but this rate is available only on higher-end Tegra30 SoC variants. The
highest clock rate supported across all SoC variants is 300 MHz.

Diverge the Tegra20 and Tegra30 VI SoC descriptions to account for maximum VI
clock limits, setting 150 MHz for Tegra20 and 300 MHz for Tegra30.
Additionally, remove the APB_MISC workaround for Tegra30, as it is Tegra20
specific.

Fixes: 071fa83ded5e ("staging: media: tegra-video: tegra20: increase maximum VI clock frequency")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c     | 22 ++++++++++++++++++-
 .../media/platform/nvidia/tegra-video/vi.c    |  5 ++++-
 .../media/platform/nvidia/tegra-video/vi.h    |  5 ++++-
 .../media/platform/nvidia/tegra-video/video.c |  3 ++-
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index f8d2b5e1b4131..c8a8fb3cbba0f 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -825,6 +825,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
+static const struct tegra_vi_ops tegra30_vi_ops = {
+	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
+	.vi_fmt_align = tegra20_fmt_align,
+	.channel_queue_setup = tegra20_channel_queue_setup,
+	.vi_start_streaming = tegra20_vi_start_streaming,
+	.vi_stop_streaming = tegra20_vi_stop_streaming,
+};
+
 #define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
 {									\
 	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
@@ -868,7 +877,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 450000000,
+	.vi_max_clk_hz = 150000000,
+	.has_h_v_flip = true,
+};
+
+const struct tegra_vi_soc tegra30_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra30_vi_ops,
+	.hw_revision = 1,
+	.vi_max_channels = 2,
+	.vi_max_clk_hz = 300000000,
 	.has_h_v_flip = true,
 };
 
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 98411c3f4a037..52384af92d8a6 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1408,9 +1408,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra30_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 44893c5c6e651..965357ebaf0a3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -291,9 +291,12 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+extern const struct tegra_vi_soc tegra30_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
index 2e84385708bac..d483fb709d127 100644
--- a/drivers/media/platform/nvidia/tegra-video/video.c
+++ b/drivers/media/platform/nvidia/tegra-video/video.c
@@ -123,13 +123,14 @@ static void host1x_video_remove(struct host1x_device *dev)
 static const struct of_device_id host1x_video_subdevs[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
-	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-csi", },
+	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-csi", },
+	{ .compatible = "nvidia,tegra30-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
-- 
2.53.0

