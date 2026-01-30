Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9220C37F0E9
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777399; cv=none; b=ar5gFILSZGmJ2wXRla8O1RcKdzWTF3Tg28/gu/e9W2ZXPcaQUzhsCmgMaxsu1uMOGkanyxuNBffLygBVH9x1HJPJYdYlJmGUaz4D/oKzSGDR9PpAGJ1rJGklp4rcPcCRNBYjz/IhWtuCAWWIGT5ZuCnZCDQf9lIq+g76Ls2Gj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777399; c=relaxed/simple;
	bh=To1d/zhAMJHw605taojXaeo9SAKZcoKeQpcDI3cxW/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ldzm6uiC4Q7Adgka1MDtaf5DTaM2TotO6tOlgs5Jbf2SENpbpbmMY7i7ajM902Yafscb7F/heRV7U3hCsqcGgBLu/xNOE5ZRl1RpFpkJERVxy2tOa9eyHyNIm5QoRS4Ljvaidz0fbOtthIRUI1DIiv0JMw3KxzV+flSKjP+mN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9EDDRx5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9EDDRx5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305882so1379061f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777396; x=1770382196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe8jyxD8htr2t5lhKuU5l2a42gpBrpfOGyfYmkBAV1Y=;
        b=G9EDDRx5tXJr1omgSbsBsXlXv7iiDyfI3BOgssqb//ShPrFFSoScwMQCZybFH2eh8K
         DXSpPAmaUeQwp43r6IAYLxgjN9XarT0hSjXg9eJCs7GV//m2aX/mEY3CjWdcT0Nd4x9i
         FIg4SdyxqkayfVTm8tQLWJaCHjz9T652z1bERichWXoK7bXwUPxwf9QmhmAV8l5N8+Jm
         AGNTwxMU44drUHD16uG+FQ9XgsbfXcJq5LbPvfeeddLVJVp773ekd57kHjPvZ8JtOJ8u
         ZYr5oxmVCsQeiB4p5OZcuosHxRin31ntoysAqUCBu3UfhdmHkOplxMOMNDZyTdAKKP3q
         BdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777396; x=1770382196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xe8jyxD8htr2t5lhKuU5l2a42gpBrpfOGyfYmkBAV1Y=;
        b=D3/8kgwb4ru04h0nBm5VHjx0YinhrCjKUhjqTUAYKxpRWIavzuZAbPYTiMbwe5dTHN
         gBgRmLU3ECM00T6Uw37xKanvAzf9Z0p+xHlx0wXIp67cLOerWnUmB3BeKlQnyDUPDYEg
         4eO7HycD3UxPPRN9MGOO2jHE/tNpM34KZe7hxgAo+Ku1/l1J944Qp6tJZ3hongWmCEOv
         MhjjsH+E/xaGEnua5sJjCK2SqMVHzoSrK0YRjTVrMsQv1I0doT1pLIn6pO4UEC9qvaIL
         t5MOcWzmhIwh0GEaiV88VFpn0sBjiBD9gs+xeC47zURVqO4dV8RsDhiYgRib5PGWqV+A
         jPvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7tMwjMsHSGDMPqLUUbyAUmf2zwqXvVWYQcxl7P7CosSN92jDUFq1HbWbQneinx9qU9++8svIHu2vT4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnEfHuJg3SmSOZsV4klIiKtOyCrHxSbYKmH+gzRA5ecD/i8qc
	/0TpwrPnriYIiCNRRcwRwFVxMdVin2US3DWLcAig2DS1LuhIC0a3KBvb
X-Gm-Gg: AZuq6aJOuM8Yx5++wxMUGvAC0d+5iC3J42eBvJjkkofugsgs6u4pP1PdpRKSW2zuqEY
	x6aQIHPJ5YHpX9M1Xs38t3G3ZrQSVHG2LA+gfuQ4ki4cu4ifjyTEJ0PKmVOzfDvC/KmyNAd/x5m
	+DinS/otH0mwvXuB4b+3aojxcueRyMuOGHHz0wMDD3VelDen6tVtlRMbf7mBnxuG+0JPGgELsM0
	vNY5lwyMK6gEPyzOZHmasI2QNXqWpwI9Jutmc8PV3JSoWs9WdSvTepQWsB+t04GM++X6DNpBAXv
	g42AUCWa5NWba2bwpGBWSQv+XzT+KcdD+rNqx4nddIfFn5fyC5ELq7eB3lx0p2MNxietR5wXt/z
	dUwwHsDjYMXCXItaAmxCQuUVxX3bdYSoaHW4GNs4pO0JQhi2Khn6u2yOFY0zuSy49vVxKtpsqGA
	6Y
X-Received: by 2002:a05:6000:4285:b0:431:b1e:7ff9 with SMTP id ffacd0b85a97d-435f3aba7ddmr3579193f8f.59.1769777395701;
        Fri, 30 Jan 2026 04:49:55 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:55 -0800 (PST)
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
Subject: [PATCH v6 01/15] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Fri, 30 Jan 2026 14:49:18 +0200
Message-ID: <20260130124932.351328-2-clamor95@gmail.com>
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

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 2 +-
 drivers/staging/media/tegra-video/vip.h    | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 14b327afe045..4b80086f8c05 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1959,7 +1959,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 68783d5ffeb1..4aec2ff9a69c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -121,7 +121,7 @@ static void host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 80cd3b113125..9ff1f1750a15 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -264,7 +264,7 @@ static void tegra_vip_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index fdded00447e4..563059cbf5b5 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,7 +50,7 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
-- 
2.51.0

