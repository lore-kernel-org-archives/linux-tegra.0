Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A22820A7;
	Tue,  6 May 2025 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538304; cv=none; b=kphijawiXDz2VjaS3azfcBdLLG0RfMudEm8yoI/tv3MBfPsStMeA1H8bo2FEnQVs2MKrhhPwyKC4bRPjcLHJ6OoOwyslA43ijRjuCjuBsDb6AbodqeT6w+f74ebAucaKoRu7E2LHsN85ChnhU2SsgWjBwkFNXqjTQVPECiH00As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538304; c=relaxed/simple;
	bh=lrwuG4bQw8qCKnFhkqqiJ7JURU6KN9FWONa8R+3YRKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrxclzCBciuF3H/wWa2s6DxnLZsjl6Uz+B+bPO1xm8GZblJxmR6liQrJWc1AP8SudQ+lYzuyO9wd/O2KbuMqVh9WSCUjz7ecTQrSOqy/qFN0O/DYozlY69bQDwgMsMwEAYd41FFxL2xM2lGQShE6O0MJSgvs1bjsqnIPL65GXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXP7mLzM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXP7mLzM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso31207045e9.2;
        Tue, 06 May 2025 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538301; x=1747143101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PksWHiD4N3FpH1+vZw7y8oi2NSzQ5jtgVCRXU5GEAuY=;
        b=mXP7mLzMp37HIdXwUz1IhWfaEnQJH8Ce0CkmKyORIbpWYfTNdvRg6cPaXe7UuFNiNZ
         fnpI5mwANlCm8ywiYz99vXepyk9FmeqR//aH6A3/+e7Bf5Wg8JGIfu2J0MEasH/HTdSy
         f9k3A+M3F8umv95GF5cCjG9Z+Qag5E5RHe37REZGqY1wJc6oBktYn6yVUIfakmYOdE5S
         2rt+UZY+zQ8s90lUxEx3Mhfh76AKQNUBBlVxGGdVyyLNwZeKNU85kiTqEhlKvkSOTij0
         zYJ5ghREFPvuoPxBrVA3z58E2eYtk1a1okPveI6UCC8gY/1QYeaVvPKbugLLB4mqr6/T
         6bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538301; x=1747143101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PksWHiD4N3FpH1+vZw7y8oi2NSzQ5jtgVCRXU5GEAuY=;
        b=fYQCWIHy6BlI7kIAAePMmS0GDJsE7Tt4LGBVEZdiAzYVwvpey/jGgNQSLrcQcbTQXD
         yu73t0OvQhfExwOVP63DRQ9hZV4rxLzqOfMvPRjDntPKi0z76LFYnt+qm5+jK2XUKq6w
         zNqryH/S4BJIBDaMGT7mg+I7zc6jvQ5+bwvVNzMZyAyGmsbwmdu41SHVB9qEG690TTVL
         8FTMa7ESFIhShDAJ6NQEERbgy53e2Xd1d7/deQWBLQsHB/b/bskvDkmCsplfQcKb1aET
         i2jaNEpmb0qaZuxKc9MvUylNqonRp11FiM71l2GjfYjL1IutvolSZD3Coclz55IB6zwr
         QLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9qsPQyMbciMthmXUDCzunL8BF8QAZ3mcO5DwCER2pDOij+FhoTGJ8Nbq8Rsqp9MvSX6gpubZj3Hs32jY=@vger.kernel.org, AJvYcCUVH1IKY9hXsp+DSE9VWAlTJqtEkWH9AtXAYUThYP5x5UGyw0xFl4wiOawjQPhJvoMTESOlqVNIKqBP@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaCqfK9POdD9vjGxrBwo5Wg9l/fykm9HXAM6tKdSekcmnynwu
	wgh+wSk3okJNTGzg8Fwb0bEqp8rQQ6tOEkT0MUuBwySHiUZJZP3U
X-Gm-Gg: ASbGncvueTuZy47BekXbwKZPmLBHz2HCruABgH8Ldm4srXtszCO4ftb23MG1sZR3y3v
	ihaDbaoxG++hjDGisHYYHTLfPNXnhzUkdd0KesRmnFfFyReOrbL3YNpdaHdpDHM1H+aH0BdtJLX
	t+MHuVNh/2YJz6kLKQxdvdWtXA8j4LfltogHK/gcExic9TvcLnP5XBEfvpUo/5wNoHfnsBTaMpc
	lCdJh93vD+inL6rRMW/7/c+tG45BW4+uTzbCKlXRdKZpTIo8Q1zEiaDRY0pOUb5JiWOPEIv4oTT
	GlkwqP0HxYR7QY2pC5WMG54NqA3UDeELArRCSp1dBGCs6qiC13MHhkTVIZiIC9Pf4SmMwZfEcRo
	MJlISuarBPH5DL6lsTWiGtB3SY2rJPcQytxxlh+15P5A=
X-Google-Smtp-Source: AGHT+IHLE1Eq0lTL9Cfyf1Kt69ib0NQg9CFhnHdihWtkKbmGh1CmoMvEF3tmeNPfc7JNVKMnaIukNQ==
X-Received: by 2002:a05:600c:1d0a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-441d053b038mr29764635e9.30.1746538300252;
        Tue, 06 May 2025 06:31:40 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad7688sm217221655e9.3.2025.05.06.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
Date: Tue,  6 May 2025 15:31:14 +0200
Message-ID: <20250506133118.1011777-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The PMC block on Tegra264 has undergone a few small changes since it's
Tegra234 predecessor. Match on the new compatible string to select the
updated SoC-specific data.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 132 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..6f1ea5b6b9db 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2892,9 +2892,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		if (IS_ERR(pmc->wake))
 			return PTR_ERR(pmc->wake);
 
-		pmc->aotag = devm_platform_ioremap_resource_byname(pdev, "aotag");
-		if (IS_ERR(pmc->aotag))
-			return PTR_ERR(pmc->aotag);
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aotag");
+		if (res) {
+			pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(pmc->aotag))
+				return PTR_ERR(pmc->aotag);
+		} else {
+			pmc->aotag = NULL;
+		}
 
 		/* "scratch" is an optional aperture */
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
@@ -4247,7 +4252,128 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
 	.has_single_mmio_aperture = false,
 };
 
+static const struct tegra_pmc_regs tegra264_pmc_regs = {
+	.scratch0 = 0x684,
+	.rst_status = 0x4,
+	.rst_source_shift = 0x2,
+	.rst_source_mask = 0x1fc,
+	.rst_level_shift = 0x0,
+	.rst_level_mask = 0x3,
+};
+
+static const char * const tegra264_reset_sources[] = {
+	"SYS_RESET_N",		/* 0x0 */
+	"CSDC_RTC_XTAL",
+	"VREFRO_POWER_BAD",
+	"SCPM_SOC_XTAL",
+	"SCPM_RTC_XTAL",
+	"FMON_32K",
+	"FMON_OSC",
+	"POD_RTC",
+	"POD_IO",		/* 0x8 */
+	"POD_PLUS_IO_SPLL",
+	"POD_PLUS_SOC",
+	"VMON_PLUS_UV",
+	"VMON_PLUS_OV",
+	"FUSECRC_FAULT",
+	"OSC_FAULT",
+	"BPMP_BOOT_FAULT",
+	"SCPM_BPMP_CORE_CLK",	/* 0x10 */
+	"SCPM_PSC_SE_CLK",
+	"VMON_SOC_MIN",
+	"VMON_SOC_MAX",
+	"VMON_MSS_MIN",
+	"VMON_MSS_MAX",
+	"POD_PLUS_IO_VMON",
+	"NVJTAG_SEL_MONITOR",
+	"NV_THERM_FAULT",	/* 0x18 */
+	"FSI_THERM_FAULT",
+	"PSC_SW",
+	"SCPM_OESP_SE_CLK",
+	"SCPM_SB_SE_CLK",
+	"POD_CPU",
+	"POD_GPU",
+	"DCLS_GPU",
+	"POD_MSS",		/* 0x20 */
+	"FMON_FSI",
+	"POD_FSI",
+	"VMON_FSI_MIN",
+	"VMON_FSI_MAX",
+	"VMON_CPU0_MIN",
+	"VMON_CPU0_MAX",
+	"BPMP_FMON",
+	"AO_WDT_POR",		/* 0x28 */
+	"BPMP_WDT_POR",
+	"AO_TKE_WDT_POR",
+	"RCE0_WDT_POR",
+	"RCE1_WDT_POR",
+	"DCE_WDT_POR",
+	"FSI_R5_WDT_POR",
+	"FSI_R52_0_WDT_POR",
+	"FSI_R52_1_WDT_POR",	/* 0x30 */
+	"FSI_R52_2_WDT_POR",
+	"FSI_R52_3_WDT_POR",
+	"TOP_0_WDT_POR",
+	"TOP_1_WDT_POR",
+	"TOP_2_WDT_POR",
+	"APE_C0_WDT_POR",
+	"APE_C1_WDT_POR",
+	"GPU_TKE_WDT_POR",	/* 0x38 */
+	"PSC_WDT_POR",
+	"OESP_WDT_POR",
+	"SB_WDT_POR",
+	"SW_MAIN",
+	"L0L1_RST_OUT_N",
+	"FSI_HSM",
+	"CSITE_SW",
+	"AO_WDT_DBG",		/* 0x40 */
+	"BPMP_WDT_DBG",
+	"AO_TKE_WDT_DBG",
+	"RCE0_WDT_DBG",
+	"RCE1_WDT_DBG",
+	"DCE_WDT_DBG",
+	"FSI_R5_WDT_DBG",
+	"FSI_R52_0_WDT_DBG",
+	"FSI_R52_1_WDT_DBG",	/* 0x48 */
+	"FSI_R52_2_WDT_DBG",
+	"FSI_R52_3_WDT_DBG",
+	"TOP_0_WDT_DBG",
+	"TOP_1_WDT_DBG",
+	"TOP_2_WDT_DBG",
+	"APE_C0_WDT_DBG",
+	"APE_C1_WDT_DBG",
+	"PSC_WDT_DBG",		/* 0x50 */
+	"OESP_WDT_DBG",
+	"SB_WDT_DBG",
+	"TSC_0_WDT_DBG",
+	"TSC_1_WDT_DBG",
+	"L2_RST_OUT_N",
+	"SC7"
+};
+
+static const struct tegra_wake_event tegra264_wake_events[] = {
+};
+
+static const struct tegra_pmc_soc tegra264_pmc_soc = {
+	.has_impl_33v_pwr = true,
+	.regs = &tegra264_pmc_regs,
+	.init = tegra186_pmc_init,
+	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.set_wake_filters = tegra186_pmc_set_wake_filters,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
+	.reset_sources = tegra264_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra264_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
+	.wake_events = tegra264_wake_events,
+	.num_wake_events = ARRAY_SIZE(tegra264_wake_events),
+	.max_wake_events = 128,
+	.max_wake_vectors = 4,
+};
+
 static const struct of_device_id tegra_pmc_match[] = {
+	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
 	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
-- 
2.49.0

