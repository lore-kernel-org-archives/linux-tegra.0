Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F74A2E30
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134588; cv=none; b=DvT+wX36fSCiVm2D884RtgkmJAujitBBnrFT9a26x4+5pUxA5uW4Pg8heXPdkqrCTJmIMbTlndjS4kM0kjPRq80CkVU39y33jR3XAWrTQMDxKx9IWXM2Ztdul+RrH2mDCEqgc7xTejlA/gy7HarOajvx6sGYvQbAouUMZypJiwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134588; c=relaxed/simple;
	bh=ee2QR/gfIYc+jCRim2ICgGnPXqWUDDOWkJvK3rxG850=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxlDj9PXolUYsUWhZTlqHCoGbrUO/cXwEGESA8fAUhVdIUhQBjEF26gu+VTw6eHDbgf2S/obYIU1KWNT2r8vB7G1UnFWLm+rWfmxDxM0GXLqcQ1TZUQSp29fqSFshatf6/MmtFMX1C5U52Y5WAT9eQwDzKdC7hSy+xMOV0wXTmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VfbtYthQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VfbtYthQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-470174001a0so1273642f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134584; x=1784739384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvItI+zIlZhuklLP+22VHIj0wsTksyFjBvsxZyBT7dM=;
        b=VfbtYthQzENSzxxiyeQOumQjpLhZT8zTKeGS2FjxEEY9XYkcNyK8BQmxKqAtw5xpq3
         KNDLYSQ7B0sPgsotuwXLypvG6/9R+zN41bghq+ye8wsPCA4xYLq0fhik9djTsY923v6X
         MVzhgu73iLyh5tnxgJi46bA7mK9ImnkhYJRHjOD4iCY4PYpCL/tvGnx7Mm7K0NUqly4q
         RyrsyZtX4c4t9L5Jybc5S4/uBw8g7hAH+XpLWSFupVgo4RAzqsSNUkPe9QB3kEEQ08zv
         kwiP6pW7QvwE86UR7F0FHB/m/9SEm3B0wGQxge8rMY0Of++ESt1zOJFyBP1jRG3ixhNO
         2LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134584; x=1784739384;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvItI+zIlZhuklLP+22VHIj0wsTksyFjBvsxZyBT7dM=;
        b=Z7TG5O1/32TfsnIbfX3zkKWezdnqFcq4IlXwLCr3rYZdoBI0HKGROmb5bhB5eL800N
         SqmBPC6lHlCr0VJg/jHa1RgEUsxf2065pjEOHE2aJJhmNP7zd/iXmAHeo/LOxNQKtxGd
         i1zOn9xV0QETFWKB2Ubjem+zG7Wp9bso2o1WMfSVbRSNlgU8xGI30EueVtmA8N5+oJox
         r0cQby0U4/45VJLDdtFD0ojTHmIqN2Y2WdADlmBoXvadvot/4ZvTFRD4uegKqjzgwO71
         jNBXatRRYspzmRiB6MgPeWO8AGo64ULPFMKsSAzcn8BgNPUkZI6vayLGJsuBRChMM4Pd
         AO+g==
X-Forwarded-Encrypted: i=1; AHgh+RrmmqV0lk3NHMsXteBQ7lHWYuVA7TmZlScioGNi5LKTBF78PEQFTdHp27iDCbYsbAVf0Sp6c4hXIwm08g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+M4uI1QcEubw/ZCCLhb3N7LCwf3fS1IT7Q/rTSWuo9cqSP1jp
	C02Zz6+GOt6uuTRBXU+l3Hybx9DDORXA5EHVKMrt8dDm9qgI4AKDC0yjSBj9dS3qbos=
X-Gm-Gg: AfdE7cnrRVwFrmGjum89Zj/YcSGLhQ7DanMe+lZ2HlbpGkaAYocSLVJ1OP2ZbKYoiKO
	HjpGtBGstge3sVhpq5OgAQf0/iBEU6lz7V3PuDVJcFDQBQjFSv9B1+gRvm5D6LUvpObuN36/Uee
	jLwl5GIbsfbwPiwZ4s/cOnP8UBiP13IWxjX8aBCNowPfpqn0E63516HZoDEJMHbUfR94dlm3j9g
	A4A6tI5Abul6geB0AT5hm3WYhDCyKiUsf7l5dowucVnKQ1urvDZZVGxwI/Uu2o3LN4E5/A7LPAu
	QaVIohi9IOt6u2fMUrgt5kB7JKhegjdwjCT9fpCgXt3210T05wwhU7x8CNK1Q4OE3wzAufTKIcf
	ZgnqlTE/42acL+h7ByrLE6BoVEi84Iw5PNuZCKC822Zuc4i1cubzaEqQ+ZXkNbQLThdIF4Ii3Y2
	agxmDl56FxBpKJZg34pIpHUrpVGr10Ap7Wi0qhlGU/UfThGt7zbwqmcG1YTsKSbDFkpO0Z+QkK0
	JA=
X-Received: by 2002:a05:6000:2004:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-47f2dc9bf61mr21111665f8f.22.1784134584294;
        Wed, 15 Jul 2026 09:56:24 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f47688f29sm15585803f8f.21.2026.07.15.09.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 16/21] gpio: Unify style of acpi_device_id arrays
Date: Wed, 15 Jul 2026 18:55:21 +0200
Message-ID:  <bf617dc2c662e80833406bd3a3f23cecdde071e4.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7506; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ee2QR/gfIYc+jCRim2ICgGnPXqWUDDOWkJvK3rxG850=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uQeZws1R4kgXuCG2n8bKgzFrmylax7rB1YM ibf41Pns7+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7kAAKCRCPgPtYfRL+ TsjCCACbaVuLtt4TRZY2eu/1Hp4eAyCbnlI1lTQC1dgr2I+C8aA2sm7K1//Y7jpvHVKnUTb3esK th6kMP9ZME6XrQQaHAbW70NefF2QiXac9+5YBQoG7t53s4fM+tTqwBBsjpZDaWkROdjQaFMcUmE bxRvz0d/0pLKCRBOvd64SeoNPtGdtjtzynut0HdGPPSSdJO766TV/6kvXjuzP4FT5mZzAAP+ETz guZ7yYjrY3YD82hiwh6bBdSQe9By1uiss0MdTuEPTgF8H29vCSKmhl6EIjoON8spBzcCiaP0sAY XXyD5IqkIVXDsjrLfZz76JsoAhL9hVZwfuO05Q+2pg6uJ7c/
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

Adapt the few offenders accordingly. Additionally sort the entries by
.id.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-amdpt.c           | 2 +-
 drivers/gpio/gpio-dwapb.c           | 2 +-
 drivers/gpio/gpio-graniterapids.c   | 2 +-
 drivers/gpio/gpio-hisi.c            | 2 +-
 drivers/gpio/gpio-loongson-64bit.c  | 2 +-
 drivers/gpio/gpio-mlxbf.c           | 2 +-
 drivers/gpio/gpio-mlxbf2.c          | 2 +-
 drivers/gpio/gpio-mlxbf3.c          | 2 +-
 drivers/gpio/gpio-novalake-events.c | 2 +-
 drivers/gpio/gpio-tegra186.c        | 2 +-
 drivers/gpio/gpio-xgene-sb.c        | 2 +-
 drivers/gpio/gpio-xgene.c           | 2 +-
 drivers/gpio/gpio-xlp.c             | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

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
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e159c3f98f1c..3b24daabcf0f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -720,10 +720,10 @@ static const struct of_device_id dwapb_of_match[] = {
 MODULE_DEVICE_TABLE(of, dwapb_of_match);
 
 static const struct acpi_device_id dwapb_acpi_match[] = {
-	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
 	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
+	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
 	{ }
 };
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
 
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index b2a7a41f1437..3fbb65200c55 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -134,7 +134,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ "MLNXBF02" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index ecb0feb9b73f..dd4cac6d96da 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -450,7 +450,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
 
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

