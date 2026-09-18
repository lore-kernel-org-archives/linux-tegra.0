Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BB74A204F
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736529; cv=none; b=RtGnqrqyctY+Zo8JSz/iYIuOZNbF71DZBad6P8tvOCAGxHOdd+BqSLHfY+/k0sWp52Q6F5/HpGbQqOiVua1uHW8xTg7g+qPqJ3Z01p1yCMqNoNEqVeJD0EAF69IxRxwPo/0LMRmNcozltztuvxSF17d3LtrnIW6ge39lTf7+4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736529; c=relaxed/simple;
	bh=uQuDrQC54rH73rDKSYpShBEhGdmb7pu28vKNxMjdMYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siYmsf7m2hcRugMBnq3lf8ANlR7mgrJzrXwQz8kTfehtEONMUFuWjgACPw20qbZIY72+yZOaOOUvwwRfnWjE50j7Ye2hKh/koQOUFMiKsIkXK4CzsRdrwG4VZVTre+udz31BECSvP0OqjQXpgThVy93z4XGI2wsF70XWRVr9BnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=TiEzSBW3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="TiEzSBW3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so4305425e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736523; x=1790341323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOCNg+dN98nBmxQbC7nXxjUH9WHqr4W+3IIRIsKj1vs=;
        b=TiEzSBW3jNjaaQmnPuUbb+aq2CgWDRQ3bNpfU7QVXpPy8mwYgw73Hw0IgMsX6CxmXI
         CaOaqlJMCySe6Ics6vIGkiczfcg17y1ps3Vv7JMD98VjjyyPnHA/GQDnMAufrLF2h8oz
         0eXg68HRlxrVfoHCVZSMJhR6rZCZmHivCcY47y0lG1E8nk9G7Rtdx+1cxQ1hMQJbcIdx
         365Y92wX4WzW0D1MHntvEO4KQtDRsKA/mSoubmnqD5AXF6GcDf8AL0ws/jX6x851MJlC
         h87L+zDZ9zGqJ+9h8Qd3nCFcyYA+kZEaW6E0qtZQQJkO2UW03CdcIV30KK2uMsxc5JiS
         iuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736523; x=1790341323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOCNg+dN98nBmxQbC7nXxjUH9WHqr4W+3IIRIsKj1vs=;
        b=BC4ur9MjvYYElGhL+YguVu/a1wYNPbnHVwHVqNBe4JF/fu1j7wj9rY1/5WDsOyhwGz
         dkHT5Meo2nDKLwXu8EFATGAqR8gjU+hIHYGweZIkv/5rmmsQcOxt3haB85Z2MR+KMUEe
         D/TZ4vfBEXGPqWZ6WPoi8XYamHWU7zZ6EwZcuTyiZNW1pqBZuSn/0aXjLB8VsqRbvUi8
         Cw+FLdVXtxer6ERPdmHvRLtAniT4+CEmhE3xOTsCdUotj1ANKTJmUvuQ1c5naZ37cN0+
         I0AJiHn/y5QP7VYWrhx/8NIZFT4vM+GpPvxT4pqQPfnzJC0R2w3ePYfNUDQ/WvlXTWMx
         yYZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf/dDsmkFgpnxXAed6KW3gHhTdAtcdRyaC0sH3z7AUKe72bIr/tnNHmTrAd3udaa3WSLhOUILgMJ8ixw==@vger.kernel.org
X-Gm-Message-State: AFuF++lLA66ijzJrJ8KauCINxb2M27wP64+wq3ZY7xTQ97qE8+FH8LN+
	CQAEflvqAiXP6l2MQQtPiYtFl3yP1J7Pd9bhK7e3FPxa13hwUptF/1ilyx21qvFL3ww=
X-Gm-Gg: AYBFou0vbjKr023RBCDRPkQfYySoCqvlae70A+5LeghmZAUtiFQ/DiRsU4V31dgx+Qm
	M1plYGOwdl2ak3JUs3ZLn94NC2ePj6Is4nEagl7iQjS9ltt+IEPm4aTS8nmXElub+4NSioBHZjX
	SbNyPDHStMIy3iGJhz0TTYSFBODxpjDx0JTybpdk+Qxfht8YvzdrDnv4hpUUEegjBsk9fx8A6O9
	oMnLD/1xc/y5M7+vYQEusNLp5UNr8BqnVpyhoLmWzhnY2jP29BPuMfBovFWy4EajZYmvMxbyoN2
	bD3suD0K/NFWNfedT43/UUruJFUeUpzbhgi52nAvaS0JppmqZrEqmCzdmpl7buJjAK+ALFRztFI
	5cnnT/MbcFaTCR9Fn8ame6Ln8xynha4QDfaOk+Tc742sD4qKkOACQnUSy0Sv3Im3saSl+RJ0OuV
	YkBumxe+tXQaRmgq5S4ldemmyT29UO2XhztDmLrixeTd/vgu3tLX6NDoU1ZDAopuzdkFYJp841q
	3guRkwHReC3HgA=
X-Received: by 2002:a05:600c:8584:b0:49f:cbf1:e76d with SMTP id 5b1f17b1804b1-49fcbf1e9a5mr8437375e9.0.1789736522589;
        Fri, 18 Sep 2026 06:02:02 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:02:01 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 18 Sep 2026 14:01:51 +0100
Subject: [PATCH 2/2] i2c: busses: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-acpi-i2c-v1-2-caf4bea4886c@thegoodpenguin.co.uk>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
In-Reply-To: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=13774;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=uQuDrQC54rH73rDKSYpShBEhGdmb7pu28vKNxMjdMYA=;
 b=mmV8nSqpS6TG7XYJiURdQ7w4GuYjUmy7J6hKP9xFaptGqBL9K2aUTD5JRl3498IAVGRzuiIDc
 40THKzjx2INDZqWshrv7JhKZ+YsJJ55ouYgxNk+4VAUf1eFbdJpE0gL
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Unify list item alignment to have a single space padding between the
brackets.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c       |  2 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |  2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 42 ++++++++++++++---------------
 drivers/i2c/busses/i2c-gpio.c               |  2 +-
 drivers/i2c/busses/i2c-hisi.c               |  2 +-
 drivers/i2c/busses/i2c-imx.c                |  2 +-
 drivers/i2c/busses/i2c-ls2x.c               |  2 +-
 drivers/i2c/busses/i2c-mlxbf.c              |  8 +++---
 drivers/i2c/busses/i2c-qcom-geni.c          |  4 +--
 drivers/i2c/busses/i2c-qup.c                |  2 +-
 drivers/i2c/busses/i2c-scmi.c               |  8 +++---
 drivers/i2c/busses/i2c-synquacer.c          |  4 +--
 drivers/i2c/busses/i2c-tegra.c              |  8 +++---
 drivers/i2c/busses/i2c-usbio.c              | 12 ++++-----
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c     |  2 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c      |  6 ++---
 drivers/i2c/busses/i2c-xlp9xx.c             |  6 ++---
 18 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index b0b40fe1d79bf..2a5711411ee5c 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -354,7 +354,7 @@ static int amd_asf_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id amd_asf_acpi_ids[] = {
-	{ "AMDI001A" },
+	{ .id = "AMDI001A" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_asf_acpi_ids);
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 9fdd6a5fb8b65..cc5961364bcc0 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -341,7 +341,7 @@ static void i2c_amd_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id i2c_amd_acpi_match[] = {
-	{ "AMDI0011" },
+	{ .id = "AMDI0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_amd_acpi_match);
diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index 208ce4f9e782c..a83e735d2086c 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -300,7 +300,7 @@ static const struct of_device_id cros_ec_i2c_of_match[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
 
 static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] __maybe_unused = {
-	{ "GOOG0012", 0 },
+	{ .id = "GOOG0012" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 447af5523c2e4..1da6b0314b6a0 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -260,27 +260,27 @@ static const struct of_device_id dw_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 
 static const struct acpi_device_id dw_i2c_acpi_match[] = {
-	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
-	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
-	{ "AMD0010", ACCESS_INTR_MASK },
-	{ "AMDI0010", ACCESS_INTR_MASK },
-	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
-	{ "AMDI0510", 0 },
-	{ "APMC0D0F", 0 },
-	{ "FUJI200B", 0 },
-	{ "GOOG5000", 0 },
-	{ "HISI02A1", 0 },
-	{ "HISI02A2", 0 },
-	{ "HISI02A3", 0 },
-	{ "HJMC3001", ACCESS_INTR_MASK },
-	{ "HYGO0010", ACCESS_INTR_MASK },
-	{ "INT33C2", 0 },
-	{ "INT33C3", 0 },
-	{ "INT3432", 0 },
-	{ "INT3433", 0 },
-	{ "INTC10EF", 0 },
-	{ "LECA0003", 0 },
-	{}
+	{ .id = "80860F41", .driver_data = ACCESS_NO_IRQ_SUSPEND },
+	{ .id = "808622C1", .driver_data = ACCESS_NO_IRQ_SUSPEND },
+	{ .id = "AMD0010", .driver_data = ACCESS_INTR_MASK },
+	{ .id = "AMDI0010", .driver_data = ACCESS_INTR_MASK },
+	{ .id = "AMDI0019", .driver_data = ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
+	{ .id = "AMDI0510" },
+	{ .id = "APMC0D0F" },
+	{ .id = "FUJI200B" },
+	{ .id = "GOOG5000" },
+	{ .id = "HISI02A1" },
+	{ .id = "HISI02A2" },
+	{ .id = "HISI02A3" },
+	{ .id = "HJMC3001", .driver_data = ACCESS_INTR_MASK },
+	{ .id = "HYGO0010", .driver_data = ACCESS_INTR_MASK },
+	{ .id = "INT33C2" },
+	{ .id = "INT33C3" },
+	{ .id = "INT3432" },
+	{ .id = "INT3433" },
+	{ .id = "INTC10EF" },
+	{ .id = "LECA0003" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
 
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 6294b0b0cc8f7..56d6847cbf6d7 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -664,7 +664,7 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
 
 static const struct acpi_device_id i2c_gpio_acpi_match[] = {
-	{ "LOON0005" }, /* LoongArch */
+	{ .id = "LOON0005" }, /* LoongArch */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_gpio_acpi_match);
diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
index ba5c9579ae190..fca1ca011312d 100644
--- a/drivers/i2c/busses/i2c-hisi.c
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -516,7 +516,7 @@ static int hisi_i2c_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
-	{ "HISI03D1", 0 },
+	{ .id = "HISI03D1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 19ec056b00afe..e5fb493327b10 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -349,7 +349,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
 
 static const struct acpi_device_id i2c_imx_acpi_ids[] = {
-	{"NXP0001", .driver_data = (kernel_ulong_t)&vf610_i2c_hwdata},
+	{ .id = "NXP0001", .driver_data = (kernel_ulong_t)&vf610_i2c_hwdata },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
index af7bf61b0f4d7..ef2e2a26981e5 100644
--- a/drivers/i2c/busses/i2c-ls2x.c
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -356,7 +356,7 @@ static const struct of_device_id ls2x_i2c_id_table[] = {
 MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
 
 static const struct acpi_device_id ls2x_i2c_acpi_match[] = {
-	{ "LOON0004" }, /* Loongson LS7A */
+	{ .id = "LOON0004" }, /* Loongson LS7A */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ls2x_i2c_acpi_match);
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 24ccc4546ab88..0cc8b9e5f3336 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2198,10 +2198,10 @@ static struct i2c_adapter_quirks mlxbf_i2c_quirks = {
 };
 
 static const struct acpi_device_id mlxbf_i2c_acpi_ids[] = {
-	{ "MLNXBF03", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] },
-	{ "MLNXBF23", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2] },
-	{ "MLNXBF31", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_3] },
-	{},
+	{ .id = "MLNXBF03", .driver_data = (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] },
+	{ .id = "MLNXBF23", .driver_data = (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2] },
+	{ .id = "MLNXBF31", .driver_data = (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_3] },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, mlxbf_i2c_acpi_ids);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 00013b41a6f59..37a071b885f0b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1303,8 +1303,8 @@ static const struct geni_i2c_desc sa8255p_geni_i2c = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id geni_i2c_acpi_match[] = {
-	{ "QCOM0220", (kernel_ulong_t)&geni_i2c},
-	{ "QCOM0411", (kernel_ulong_t)&geni_i2c},
+	{ .id = "QCOM0220", .driver_data = (kernel_ulong_t)&geni_i2c },
+	{ .id = "QCOM0411", .driver_data = (kernel_ulong_t)&geni_i2c },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index ee7915ee2ba2f..ce30634e1f402 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1688,7 +1688,7 @@ static void qup_i2c_disable_clocks(struct qup_i2c_dev *qup)
 }
 
 static const struct acpi_device_id qup_i2c_acpi_match[] = {
-	{ "QCOM8010"},
+	{ .id = "QCOM8010" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, qup_i2c_acpi_match);
diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 324a63efa1ab9..37442c9ee2229 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -42,10 +42,10 @@ static const struct smbus_methods_t ibm_smbus_methods = {
 };
 
 static const struct acpi_device_id acpi_smbus_cmi_ids[] = {
-	{"SMBUS01", (kernel_ulong_t)&smbus_methods},
-	{ACPI_SMBUS_IBM_HID, (kernel_ulong_t)&ibm_smbus_methods},
-	{ACPI_SMBUS_MS_HID, (kernel_ulong_t)&smbus_methods},
-	{"", 0}
+	{ .id = "SMBUS01", .driver_data = (kernel_ulong_t)&smbus_methods },
+	{ .id = ACPI_SMBUS_IBM_HID, .driver_data = (kernel_ulong_t)&ibm_smbus_methods },
+	{ .id = ACPI_SMBUS_MS_HID, .driver_data = (kernel_ulong_t)&smbus_methods },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_smbus_cmi_ids);
 
diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 0216e398f2740..968cbe32161ed 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -622,8 +622,8 @@ MODULE_DEVICE_TABLE(of, synquacer_i2c_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id synquacer_i2c_acpi_ids[] = {
-	{ "SCX0003" },
-	{ /* sentinel */ }
+	{ .id = "SCX0003" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, synquacer_i2c_acpi_ids);
 #endif
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9c281b4905ebd..76d21bc51c618 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2486,10 +2486,10 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 };
 
 static const struct acpi_device_id tegra_i2c_acpi_match[] = {
-	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
-	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
-	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
-	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
+	{ .id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw },
+	{ .id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw },
+	{ .id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw },
+	{ .id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
index 259754e5fd05b..66da1e90848ae 100644
--- a/drivers/i2c/busses/i2c-usbio.c
+++ b/drivers/i2c/busses/i2c-usbio.c
@@ -24,12 +24,12 @@ struct usbio_i2c {
 };
 
 static const struct acpi_device_id usbio_i2c_acpi_hids[] = {
-	{ "INTC1008" }, /* MTL */
-	{ "INTC10B3" }, /* ARL */
-	{ "INTC10B6" }, /* LNL */
-	{ "INTC10D2" }, /* MTL-CVF */
-	{ "INTC10E3" }, /* PTL */
-	{ "INTC1118" }, /* NVL */
+	{ .id = "INTC1008" }, /* MTL */
+	{ .id = "INTC10B3" }, /* ARL */
+	{ .id = "INTC10B6" }, /* LNL */
+	{ .id = "INTC10D2" }, /* MTL-CVF */
+	{ .id = "INTC10E3" }, /* PTL */
+	{ .id = "INTC1118" }, /* NVL */
 	{ }
 };
 
diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
index 764a2dbc957ab..81f0bfdf919f8 100644
--- a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
+++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
@@ -345,7 +345,7 @@ static const struct dev_pm_ops zxi2c_pm = {
 };
 
 static const struct acpi_device_id zxi2c_acpi_match[] = {
-	{"IIC1D17", 0 },
+	{ .id = "IIC1D17" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index b29dec66b2c33..08a126aa83dfa 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -539,9 +539,9 @@ MODULE_DEVICE_TABLE(of, xgene_slimpro_i2c_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_slimpro_i2c_acpi_ids[] = {
-	{"APMC0D40", XGENE_SLIMPRO_I2C_V1},
-	{"APMC0D8B", XGENE_SLIMPRO_I2C_V2},
-	{}
+	{ .id = "APMC0D40", .driver_data = XGENE_SLIMPRO_I2C_V1 },
+	{ .id = "APMC0D8B", .driver_data = XGENE_SLIMPRO_I2C_V2 },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_slimpro_i2c_acpi_ids);
 #endif
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index ad0e5cd218f0f..44cad95ee8abc 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -570,9 +570,9 @@ static void xlp9xx_i2c_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xlp9xx_i2c_acpi_ids[] = {
-	{"BRCM9007", 0},
-	{"CAV9007",  0},
-	{}
+	{ .id = "BRCM9007" },
+	{ .id = "CAV9007" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xlp9xx_i2c_acpi_ids);
 #endif

-- 
2.43.0

