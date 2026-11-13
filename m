Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586728;
	b=VWt5CRl1AQAXB8+BCv931A3bED7ygdcu6QuMrKJ2T1YwTuVLKbRLhwqt8AwNIhocfau2
	 +LBgQG3yQuDi37Qn8v9jHnUklBjbuJka086Auk7YAJiRTWkhmvtMlicLPfBsjnZwO4Hak
	 EBM8kw0+cjFiQwRDqf78fIBSDEbq0ZjOnuzF9DPeQIBroCqCo9qh4Q1XTJSu1MDK109Cp
	 LAjtilohOsFC1o03Lba7b8p4YX9ZGWW8FUaIostezWMsK9YpYmCfOYQtz5IDNPvf7plln
	 OnFo0N+ErixMv86D8gU5X1OZvhYItBBUhXMviUDThBaKW0qDEFc9zdGCNnivnnda9nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
	b=kWuUY2xi94nEDUBhXkwS49mzosGgdjFh3Vo2hzrUy015uEk7j2MoFrmiiAvDk/1dftQE
	 vP86XTUhpEmldluVGjNQqMvdIb8xZMCUVY4w7s1rW5q4fusVwIORrv0oiilqKebLpuGoj
	 qxsCrf84mA68s2wX53GAwTIVCbfnqrPB15yVPlhvDWbo44IjKnIgHU7tdXRQh5eCnC3G7
	 6CT6qs7Eo2RODRzQrihbr3T7QgtlPhH+ODgiXPHkAa4g4zwSdgZmtI2a/ySI+PYi/dyJq
	 pNTQXpv9VgXvECAwyWG5S7+69Ubz9i+oDK3TFkr+GTIbS8UhlbG8yEWGNADrndZxxag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jWnEvbWn;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889B606C54A
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0889B606C54A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jWnEvbWn
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505186727fso264104066b.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586726; x=1795191526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
        b=jWnEvbWnqdes1k4uVtYm9anQvd0GymwXS/jdATf6Dz32TZ4gY5OguidECMAlvFmwZh
         Ue4j900NKT2Yo/x5y4yxTP5xtwO19hDyCqvhSTSFR/bQtihTSwcuOq3HE3s9AVey93SS
         BsiHqIIiPFeM1hRiSmjoEarRYCdxhk62aENkvxw7kq6bUNECcvCdy3pThJqG+MiaoZji
         Dc4YiXEhbJqfycIduPCYwqJUqaYi+olOgk4ESNKM5F9AeA/PjjWNNJsqfsE5ACI+9OQC
         XG1mOom210rF4qx2W1OpuT3kIXpC7IcPMR5oTHveE2Im95Z9Ii4GyfonkR791/vWq77V
         sg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586726; x=1795191526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
        b=tIgeUWG1vDZA5FPGL7YJ6eLn57kxEPfwcWwHwAYZcfMS3iJcBOxxzmATZdjAxEcVUw
         /p9gj24ukf8ZnkTWtv4PdrlLy7YDOJ7kC2Zi9gR7s9pZKQEqMECjSu1+MUKK2iSb366+
         +J5nzGt0BXjqGBWvcVkeAyrYkPATKylYlRd1w5OSixOyJ+pAAGEfaRaeO+CIEgM6EjZC
         6e0bRA51H7+LTzYLDUjjTbbdj4LeJvD1PwhdIzjR8tOaXR3YxKlg1RJHJPiqsq+fXFeu
         9nNrzL+lLcLEoiGWklCuAkQVay5mJ5ZEZ1LhRkx0mhmfruwnh/URmbsOfLPeyUEiPvjW
         WzwA==
X-Forwarded-Encrypted: i=1; AL+hErFpkHRAmteRZq6KMqy5is3PSOspU3WOSyjg2S+ZA+SvGV3ZjUZ0jzL3f2jgeSW40N0n+0AziqbxsRenyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZChd/rDRCAHHnFOyNub1ufjbFKpjjTbs/SVX0JKOAOAIr1gyn
	dmmBf38ycWID3kR33ISpAasaeGHPX1Q/4Gz1wgI9DntGxuc1zjd/as1/
X-Gm-Gg: AYBFou0hwWX3IP/RAsfb5IGuLZa3HRKJzplLdsLeHU7DoRWZ23IZORUjuAf/GTkNONz
	zUJ9fNgwxXRqmggO5ZdNb4+bXizEvA8/X8U9yujHsXoaiciBJ0eoJ1FsXHk0eJ+SpJSmzJtzoCc
	DTb+OPiJh7JyDIwtiuzESH4GSu25Ld53kWUaOb8WDhVdYXJ3ONrhDNdgEjAMyeMSdbJYS9zLtqX
	bUaqAenII3jHSk+bU/NqJIOJI/8T6N9yFGNiAi3CoDTJ///mD14h6CECSHx2YRP+zt4DYbpbEJy
	5/7cBOzMW25r80ApiOSAcRK3hXtEWFz/Y6kk1DwOypAeg2XYYAsVDG0Z7ImTr4uyxLHxieq04s1
	tWlRPPG08ja9Esd2WubRw97PO5s9OVkEWAmZy/vDn7CJDJyO7glwkFRdLOepyMhaKUnRU2ZfpaO
	biWRWarxr8XtY5JkvzyUKdkj1KUpJRsJkvuw8wRZqu1EsrYwpAzk8HnnKcpwwf3Zl9xfSEZkkUm
	coZ7LGm+p+IxcbmyYwY3dtCYtpOXnD8PV9St5Jg1NWRXEpaNaSEKaSXQQTJ/hVy8WSFIbY0dvXz
	fMLTSPGzrA65GexYkHv1EXZIroIymyBgsUJA4/FoxHjqfYXMP24hAttvCAcYijYa5+JuvmCWjpo
	KNldHIh5u5w==
X-Received: by 2002:a17:906:4795:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c509636a806mr256654266b.25.1794586726178;
        Fri, 13 Nov 2026 08:18:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:45 -0800 (PST)
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
Subject: [PATCH v1 03/10] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Fri, 13 Nov 2026 18:18:12 +0200
Message-ID: <20261113161819.36847-4-clamor95@gmail.com>
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
index cdadff98eae75..f27ecb1ba29a7 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -809,6 +809,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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
@@ -852,7 +861,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
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
index d8c77d1290efd..12eaa89304e84 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1935,9 +1935,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
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
index 46328e488aa38..ff5c9deed4c88 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -292,9 +292,12 @@ struct tegra_video_format {
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

