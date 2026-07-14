Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D1E3F5BC5
	for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013943; cv=none; b=qw36AmNiEk58MO8ov3dm3GDxdhN8R20slxTmbe7H1QKsNMWQgSMEPSbKNglosZrxMeXe5mMMeN4DKfzgpxzgtSiHHcyNtE59RN3GPTJ6i+oIO8TUArlSQDShKgtsoTgzO4LaS1EqQgDbKfnU3w/8ps5cvTw0w6p2CkwnSa37YxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013943; c=relaxed/simple;
	bh=PfHNgIxFer1cIdDIDY78v9FhhYd7z/p/LVKOXhd1U1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HS/SL1Pz8fXfMlVK6I/a8gYBj6D806YT5Y77fNFNLFPMdrQ+I6c77gdXPU8huXrqF1uD9plkM9UAZCEFAnYmWbwO9IqSZ+OuHomlhYJ9HYhlhkTwN5w4Mdz7Z6K8mChQx8CAd1s7Q4A2qK/ocmQWUH6iUFukOJgbL89+XpRjOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T612YasR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T612YasR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso2636345f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013939; x=1784618739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKVpcpbupyOx6Fl5F9vu5I2pPM7w5ZPxAr6QRyujKkM=;
        b=T612YasRMniUffkSet+0Dgy9BhiOj4wKciTxof5AQyqOgN8xiABZG1KZWBGM7lB11a
         Eru6kKr9gylsSM6U89xv/5DrIZrZ2VJ/VJ/4UvwN68UZBa4SrfYL0WmyUNJlkisUIZzY
         q1+Kx9XStUoSvk8pAomAMtgasBu/nCcbE/09rbO9Ous3nXuO0iw2Uospcc2IAJgU2ali
         yyXPki67pvlkxOBaJtimCmih1PNvpIgBSFX2z/ZqYpOEalBxgNy/c+PEcM7Etbs5chd7
         lMaLy/V0oVAarHQ8vGqf3Bw9RLNVLhJZP64o1y6zVSfx4bDXxOQZyI76231UDMO4HeH9
         VSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013939; x=1784618739;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKVpcpbupyOx6Fl5F9vu5I2pPM7w5ZPxAr6QRyujKkM=;
        b=FBV72CWg+Hxp2b0SiikYZx5BPigmo/2CPnjhrwWpnYXLbIT72ZiItSHUjY5Wr5OLOi
         4S757/VqCeNUQcKJVHFq2hCBLVYhhPr6ZORAJwGdzmGL54wSbfZzCKAJcvKZoAW4NJFm
         MWLQqUu3rXeJqKyQYZiuE0OMCHk3TxpjVsldG8qXMntJgKyJsG46veamCPT2DrzdL6uf
         3reMxV7EpYm/bCrmdSPQ8dk6W4iS5xZ7meO7Lc1VCW+nz67MH8uWssaeYKV00Ss0xJKe
         L7NYpKeJ4vqN6/gYYYRYQIBgmnYkYDsNna2BXLmjFo885oQL8wqCXNdF2f1Oagj3NuHv
         C+lQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqEd7Ig2I1qB6abfwuHrAnJKw96YA23Y7vARByeHC7jKYMmxFdKrP7j1Z1cs66gWUmTtdTuIs2fI4GKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygOEIryrfoXuqFbbkS+wZbk8z5Xc5moACk8UBkrptDqa54j+lv
	+1l2a+A7DsqAoWoE4QWL1/X4Diz+4b3oJFN6SjJnjVDTNcIqbYMpSHMkyTluUd0K3S0=
X-Gm-Gg: AfdE7ck9NiW3x4bjXrIeKiMnlomGR9rbQjXhTzJHjCCM7HSOpWlS1qkBFmx9s0iVFTE
	/XARhhrtfr39qCidFWrwtYhkbEXeQFQRedWMcNVs6CFYiTKHCeFEWntupe/BEe99HLVtBD5KoLZ
	lDV0GxpdH4I46ToBTRmfFuJOC8/8DJ0689wbIam2Ge9iiEEtwDNTNk+J9sXumfV4SerWbgcSsDz
	bV/B3o0UJcX9GgePuUdNx50hplLrq1VoRAF7CMj2zPu0eV6WRQPcB9JcF7nwum9q6jfFz1ttohX
	lydjCQmTD6QyXELyFmVY7tffxcOOrhkSqYIETDGGpndkynkmJlVm4OMeIfPOxe682z/xHeOZqHG
	7TZN65SFs8dK5LYszjVSpzvIPWix9e3V9pCDhK79TGF7qUdK7HSCkS7O5TXCelNxVJFtz9v8bBU
	NuHTaZZrT8EeIgYUouD//VnhNplZ0UrhWDNPkdLzGq06rqcdc/1nr40RwCU+A68pQBm2eMiKdDi
	2nGNIip4t4Pthw=
X-Received: by 2002:a5d:674c:0:b0:475:f0f0:9ef0 with SMTP id ffacd0b85a97d-47f463a496amr2537068f8f.53.1784013938828;
        Tue, 14 Jul 2026 00:25:38 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635a9cesm5951456f8f.14.2026.07.14.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 15/20] gpio: Unify style of acpi_device_id arrays
Date: Tue, 14 Jul 2026 09:24:16 +0200
Message-ID:  <0b30d3cd699a41fb066903b1b9a6c231bfe49305.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PfHNgIxFer1cIdDIDY78v9FhhYd7z/p/LVKOXhd1U1A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeRB0ObMrDvo6qsv9BkMTsRdwVAr8lST6Xuz2 wGKMRUJTUiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkQQAKCRCPgPtYfRL+ Tif+B/9IWoa6wxVJxNkbuvjzYyEh36gf4GD10R6l/t05HUhOBtS3xumrpGhfOunhU04lLqtwGfu tpuFtJh1EOfir8rM19SGM4b7jF1cakriwKBmj2KzMzoyPEul9GdA/tLP7s1OqdQhF5rp1u/YCXc 5wKIu82/eSikme6Sve8S/NB3WCMV2sXovhocCkcVdb+i9TtiCd+Q0ZCekkYNgY20Q3twec27Y7/ fomF4dsU7fmnegowVPRc4Aja5zzujgOLgdvirH5iEEV28nO+EOtSdnjh+YwRxltAjO3zW7bkKwY DhI4gjsh15MJO2XykY+tpbDGb/lgxRJHFb+Yd3N0WLokSsEv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various acpi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amdpt.c           | 2 +-
 drivers/gpio/gpio-graniterapids.c   | 2 +-
 drivers/gpio/gpio-hisi.c            | 2 +-
 drivers/gpio/gpio-loongson-64bit.c  | 2 +-
 drivers/gpio/gpio-mlxbf3.c          | 2 +-
 drivers/gpio/gpio-novalake-events.c | 2 +-
 drivers/gpio/gpio-tegra186.c        | 2 +-
 drivers/gpio/gpio-xgene-sb.c        | 2 +-
 drivers/gpio/gpio-xgene.c           | 2 +-
 drivers/gpio/gpio-xlp.c             | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 32c4d0ee8101..74b40e2c3485 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -128,7 +128,7 @@ static const struct acpi_device_id pt_gpio_acpi_match[] = {
 	{ .id = "AMDF030", .driver_data = PT_TOTAL_GPIO },
 	{ .id = "AMDIF030", .driver_data = PT_TOTAL_GPIO },
 	{ .id = "AMDIF031", .driver_data = PT_TOTAL_GPIO_EX },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
index 6a77a5864d09..72be289c65fa 100644
--- a/drivers/gpio/gpio-graniterapids.c
+++ b/drivers/gpio/gpio-graniterapids.c
@@ -395,7 +395,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(gnr_gpio_pm_ops, gnr_gpio_suspend, gnr_gpio_resu
 
 static const struct acpi_device_id gnr_gpio_acpi_match[] = {
 	{ .id = "INTC1109" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gnr_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 1a89695ce515..f03df71e3296 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -223,7 +223,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
 	{ .id = "HISI0184" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344..d76c3cf177d1 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -556,7 +556,7 @@ static const struct acpi_device_id loongson_gpio_acpi_match[] = {
 		.id = "LOON000F",
 		.driver_data = (kernel_ulong_t)&loongson_gpio_ls3a6000_data,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 99b880596330..dd4df1fba60a 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -272,7 +272,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
 	{ .id = "MLNXBF33" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/gpio-novalake-events.c
index d5a3bd48bed3..113a4069120a 100644
--- a/drivers/gpio/gpio-novalake-events.c
+++ b/drivers/gpio/gpio-novalake-events.c
@@ -305,7 +305,7 @@ static int nvl_gpio_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id nvl_gpio_acpi_match[] = {
 	{ .id = "INTC1114" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, nvl_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d9a2dedf50ea..e94eaf23a5db 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1543,7 +1543,7 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
 	{ .id = "NVDA0708", .driver_data = (kernel_ulong_t)&tegra410_compute_soc },
 	{ .id = "NVDA0808", .driver_data = (kernel_ulong_t)&tegra410_system_soc },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 6f2907468507..30b6e9f3f8ba 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -340,7 +340,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_sb_of_match);
 
 static const struct acpi_device_id xgene_gpio_sb_acpi_match[] = {
 	{ .id = "APMC0D15" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_sb_acpi_match);
 
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 84c1cc165024..f4adf2962557 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -196,7 +196,7 @@ MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ .id = "APMC0D14" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 50625f98f8e2..d659112d7f1c 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -306,7 +306,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
 	{ .id = "BRCM9006" },
 	{ .id = "CAV9006" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
 #endif
-- 
2.55.0.11.g153666a7d9bb

