Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032199;
	b=IWaCKioORNy0DqDS0ZvaDLhbZE+84kYg/OTi+r5V53BoeWAt1vRLiy5w9vCT6QGKarZN
	 AU9a4Xof/3Xdl/6B4Bb3oL9tOFYPVXaJWzeS9ZPaUO9epK4McQ2uMVRqxZUJZCUmy4qUX
	 ZFMAZhEKBFyHMWO9T40mVKtUQUsiUkkn9epEkvpOYLz0ie6NGa74Y0inyFzIjKpARzwpg
	 ESC6hnSHuKABjC4/rGGvbXh1mpjxQ95Wjo1uXdCF794AxvTh2jIWQACqJmUsYhKo/Sw/l
	 xtHl6lMhEhO7QZ4iwekJdbHAqDYTXoYF2JQ+vuYdZm6wKM4OnTqQ4l0Ok3ItYQNA8qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
	b=32qQF2RO5xK+PdulnFpxmVCEGhdi3qs+vRHTtTHwLWAS8RxZG1lnIp1QuF7+vm9jp4QV
	 fIUtf/h0voHZK9sNXhgbdDte5h4AQJHmTaGOOI7q4SSSDvwLFSU09OLuPn6mSq8V4IxQ+
	 EnQRZhd1DGhmpXxWKVU5VTVTjxacttcePdry6uPjXyPaEkrfvGHfVx8mB8oXE6QbR8Lw2
	 S1AC3TiIAs8yPfcVKs8pUOVHOQNFYyhvVxXo122xaTIDb2SvOTl0LNV1cmqd0K3qzu/1K
	 IaoBCxNm+4TFTrnXsbFwQFoXETJWcC/7lckCQbvMrldxUX7siU8a5wjESVXY+ayZfLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tf8jqa21;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E02E60A5BD4
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 16:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E02E60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tf8jqa21
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1102738f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032197; x=1793636997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
        b=Tf8jqa21Nb+ekgxKako1TDbCbjNzgjEtGoUsMU0fOwnC0A+ILtOr9nfO9efwRhwT10
         4i8TQRXvwKgDXUHs/KarjRrxtjbDW1fmxwFbXsaDhkObgoMR0DeXKdLHfBCG271ZXmCL
         Bxmu/vn43pm9IuB4ltKf8eOHPvz/iOTJId9zcW6p9RIeMMvpoRDFJzMsgshfMOG23Yy+
         1p7CFvWxkWLuZIppDPzhxb05OyUcOCzyadUryWjg4dAajsjeG5vElLXtTqS70nGd19g0
         27y+yQsRskDqM/uqUxe66XIIDKDRHnocOvcanwdCvOwXoJiXOl3SPPHXO156DTPIKHHT
         pIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032197; x=1793636997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CzQSR2Mr9KQQooh036x28O9hJJYMD9oyrD3pTQshjY=;
        b=rxCV7ELT9pOworOnM3pef/6ayXZ2gtSEyTESrHm1inbMG7z3IQOMB/87xce25ijtbh
         Q3rYMKG2ZV2I7QHHXem2lB479qIUXj+UUsBpuHOTJ9pkSUCOaQwHNzf1J1IrVMNevHNP
         h0c21b/LyoA5zKe0ciGE4rv2p75MkDtijZTFkDM/d6UofMCwtYuNqCN5Te84FnZb+Ee4
         IdQ+uLRIINDpdxoEJ+Fdayk1Cz8/NIZ+lUfn7lDzpQiOJ+Kmlq8ICtv8IUvvdkVteciV
         fUEYpmVtaNgz+ucjm18+xx15B6D/ISiaQlGwwvd74f1OcmmBig5IDoyNpRSLDSMX8fiq
         +3tA==
X-Forwarded-Encrypted: i=1; AKwUvBzU+UfWDnOUmTraxyX4HBALPiGEteLaLPekBsKY5vP2IDaMJeqWYJ2/ej/zAMZTLLHh7UsiADdEC/EOFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLilOTskbNlTgBHJTbs4PAxYtqnBDcOwzhhGuKbbmUNX1Ap7u+b
	BdzUQrsTpxMFReCWe8Fp6JSADxMxeGUgdxfV6GMfRDzrUZQR/1gQRFQV8JeDdjJy8bE3DGUoH2O
	Q9FuErFw=
X-Gm-Gg: AYBFou2QnuDXAzVV1NNx2Ed+Xzdpc1Ncr8DjECvDrCZAlYBUgvzmSiKyWRKOjnGwL8+
	WJxSAzB4myELoNnsG3anO4gQmNNuGEg3984J3WltQcI5vGzUtu1YF8GxvqyJyEe8scVOp8JBQiT
	AisBzKAsqPGz67KWegIZ82tki2Dyj6ArBV0iBXqLZH6wcnjvqx1IX7A+kuuhqUZo+Vo6aoyU+Lx
	psra9R/AF/dNM/NGUyPbZDHsgqU9wTaK5ZEv9jgu+EwMfxfQ90M2uYIAUdpgpAo5QAVnRUrUwtq
	CFWYlFZPVbV4yGTpzg9/esBMp4LfZn+oKolg7E3o9Bp96V8PAsuLGojEU8B9Tp+JgLk0cqOLo/T
	71edV2Zwv2VXiRPMSLZoKRuXqPD1Y2Vs8cDLrOWW3yR1SHvZvSBWSkL/YJ//5tn2VaSQkTMMmPL
	X0Z+WrQ71n9rvPxcdx+XXqwN1wohiKzMYk/r3+pPvChS/PE77qg/rUZqaQ1OMRypEqaLd+ODhl0
	QjBWLv9fwVuR/GA0o8PRjJFYFbfeWujBIFLsMAngBml9cTm9p5o0iAUifpWj9Kx4QfLQmLSZlpD
	KORQ8h0PLPKaVUX8DRgI/d3maDzJeQJfm4tcsN2zyFc=
X-Received: by 2002:a05:6000:2990:20b0:48e:2bf4:e7f1 with SMTP id ffacd0b85a97d-48e3eb924c5mr9627380f8f.39.1793032196704;
        Mon, 26 Oct 2026 09:29:56 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e412cc164sm16225635f8f.7.2026.10.26.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:56 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 17/22] gpio: Unify style of acpi_device_id arrays
Date: Mon, 26 Oct 2026 17:28:28 +0100
Message-ID:  <df5cc7d6cb7deff715a4c7df967e8cf8c3ce7e2d.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7445; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xecV7P6Tu5XHFl5UH4gpYV2pLRSEwcVsWkWhxPVL700=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/GywwqYfW/7Ukt9tps3DUViG6wTxDhsZfje RqWXMmjVReJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/xgAKCRCPgPtYfRL+ TpvXCACryaryyzj1A6+A47NutuZqn3awXGBn/A6CWceak/6RVzwoJfCskIFX6Dz02vTGltw14s6 vaDX7nQeisNp/oEOnsZM8CYsQVsQzsDu7nroynZgUBErqVGmhbzVCOS3dXwhrBeiWXJlRNAP36i 6O/i3ywWn8+Ujrjm86kwhPUM0m6uOlmh8FwYwV4TaJf/EoyGbYEc9m32kx9+pKlL7h/yl185OsZ seDcjBfde6Ni6e9P3rNm7q1NK9abIUa6bp1EqsV3fO+ApgJraxl2qsn/0toVlt4NnpanaDBjmJ/ j1uSQI0VOqvL6AAQJmo7xGGuTyUCOhSm9xG8v5JJfCMUuCQd
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
index b6a460363d01..f07dca415b70 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -134,7 +134,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 
 static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ .id = "MLNXBF02" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 62d9ffb7b41e..3a0010fa6760 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -452,7 +452,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_
 
 static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ .id = "MLNXBF22" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf2_gpio_acpi_match);
 
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 96c40f745320..33efa819061b 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -274,7 +274,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 
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
index 34e084c95d7a..50de4bf20a5a 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1617,7 +1617,7 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
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
2.56.0.rc1

