Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C72139B5;
	Thu, 27 Jun 2024 04:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719463578; cv=none; b=pR7N+xotCoQzWwbjvahAnnlzcDUkgxN3c8nqK9UMsH+HvB/thmxjrJM6E6tkFjg81K6ebk/zEQhRrWIj2NosKGzuX/T+pTx3S47s9SCb9XVfWaCcFc1s6vvBIz5g/knK9KCYi7uiR75/thRAqUPBC8c55zpfI2aom7T7uA/DfVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719463578; c=relaxed/simple;
	bh=sPZMhhDT23wUlyWaNbtHCnHrbc6GXLB01l0IECAtbaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASXlnuOVC8yrXh7xr3WK/hb3XEXwwpfa07jOYfuYha0LWRg5LgrgR8z3GIAA3Prem4SUYNhGppsuoAiK8gAVyEADtWX8EbgU5NkrHXWBKt2imUXYgF6K4blPdvnl2UBraAv/8KlKVLK0ucxhQ0pcmyN9BC1nrda/8KVGUJ6KrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxtAL3sR; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxtAL3sR"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6e7b121be30so5564945a12.1;
        Wed, 26 Jun 2024 21:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719463577; x=1720068377; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJYxRBEnCR0c7heDIYrlzOpEfIjphMvhUvoRah75BKg=;
        b=BxtAL3sRDE5GbUoVYZngjz1SClJNEpKnaNKxPsPG7QrDHGFIww3ADij6OKYYlTX/4/
         oywhqod4ha98hsv49hXvcm3FEMrAAnLsBn6qWZ5NJfhlXwqOsMBIA1zlLpqxqR3MzSei
         qKq8E3UCU575hEsjc78xsGyRhnAHpFX3kH+g8EYSTstOSPsh5Z9xP7L/fhhdh6OnRZ7G
         BZLI9Vx4MKDLCputH7SmCryEkD2h9qRLmuhghosR3loD2g3/wEqdCSaKtlwIWNwBMJg/
         R7Pg91Yw/g1iBuwYGRecQosdJSyXRGCuLUFHnS/H+aoJIRF474NM+WS0Br9vqulXf3U+
         bfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719463577; x=1720068377;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJYxRBEnCR0c7heDIYrlzOpEfIjphMvhUvoRah75BKg=;
        b=GCYClLN9mLQj4PpUb26choUZJYgjLfx0VWWRFMA7yrqdQpu59DGsAdipbCh//ErC3T
         7F8CcZDkAKeAAmvw0nOgEixWUgP1P0QGU6ANwF4qja8V4wYj/en0kDO64C5bnWxnqQaX
         byoj0C6mRomUL174BxFpx8baVhyc+uTKqsFxby0pua0bQt4aQ9maqKx/GdfxFh1bKTxY
         B5aXtJu76DjtWHawH0NBf7MS5eVIjAcj9SyXdfp4m0lE4ymfCidpMWvTjULNOebv3W8V
         cVKYBIt9G7AOHREJOigc7TnK+G668Hjgih4DfjG2rJuKs7lSksoiFRkMAe19ARHXS/az
         gC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwcJrv2LtYUQkStb5kSTdsFN8eLhCEJpOEd1qZvQSKib91JMNDhBAgoa9xVhdviB2AWKrUPZCerOAP6uQ6/tbpjXZCbeDj5cEXNITU0qh+Z+rJDD91K2/D3m9vLMGXQg0g/d0Eov4xy0I=
X-Gm-Message-State: AOJu0YxTInEIUZ14hnu7NRwF5FparecCQr+TR9n76lMugTpXii8pvs67
	sPX1H6QcwbFLfzwZNusxs9hFJ/Te7pmf7uXwwMcY0iJB9QldlUiR
X-Google-Smtp-Source: AGHT+IFp29qp9vdgmc0J9c1HxM/cGT4fSjmGUFZR4eKfFGh80tpXolcvxJJZBzvoJxjV+1Xfwv7/mA==
X-Received: by 2002:a05:6a20:748c:b0:1bd:2413:a963 with SMTP id adf61e73a8af0-1becda2b052mr1205055637.41.1719463576445;
        Wed, 26 Jun 2024 21:46:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c4ea:7ce4:91ae:d360])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c33e1sm3332565ad.279.2024.06.26.21.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 21:46:16 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:46:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs for
 WiFi rfkill
Message-ID: <ZnzulZBukibZUXKM@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Complete conversion of the WiFi rfkill device to use device
properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead of
a lookup table.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Compiled only, no real hardware to test.

 arch/arm/mach-tegra/board-paz00.c | 50 ++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 18d37f90cdfe..3ec810b6f1a7 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -8,35 +8,49 @@
  * Copyright (C) 2010 Google, Inc.
  */
 
-#include <linux/property.h>
+#include <linux/err.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/property.h>
 
 #include "board.h"
 
-static struct property_entry wifi_rfkill_prop[] __initdata = {
-	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
-	PROPERTY_ENTRY_STRING("type", "wlan"),
-	{ },
+static const struct software_node tegra_gpiochip_node = {
+	.name	= "tegra-gpio",
 };
 
-static struct platform_device wifi_rfkill_device = {
-	.name	= "rfkill_gpio",
-	.id	= -1,
+static const struct property_entry wifi_rfkill_prop[] __initconst = {
+	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
+	PROPERTY_ENTRY_STRING("type", "wlan"),
+	PROPERTY_ENTRY_GPIO("reset-gpios",
+			    &tegra_gpiochip_node, 25, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("shutdown-gpios",
+			    &tegra_gpiochip_node, 85, GPIO_ACTIVE_HIGH),
+	{ }
 };
 
-static struct gpiod_lookup_table wifi_gpio_lookup = {
-	.dev_id = "rfkill_gpio",
-	.table = {
-		GPIO_LOOKUP("tegra-gpio", 25, "reset", 0),
-		GPIO_LOOKUP("tegra-gpio", 85, "shutdown", 0),
-		{ },
-	},
+static const struct platform_device_info wifi_rfkill_info __initconst = {
+	.name		= "rfkill_gpio",
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= wifi_rfkill_prop,
 };
 
 void __init tegra_paz00_wifikill_init(void)
 {
-	device_create_managed_software_node(&wifi_rfkill_device.dev, wifi_rfkill_prop, NULL);
-	gpiod_add_lookup_table(&wifi_gpio_lookup);
-	platform_device_register(&wifi_rfkill_device);
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register(&tegra_gpiochip_node);
+	if (err) {
+		pr_err("failed to register %s node: %d\n",
+		       tegra_gpiochip_node.name, err);
+		return;
+	}
+
+	pd = platform_device_register_full(&wifi_rfkill_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to register WiFi rfkill device: %d\n", err);
 }
-- 
2.45.2.741.gdbec12cfda-goog


-- 
Dmitry
