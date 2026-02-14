Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620477262E
	for <linux-tegra@vger.kernel.org>; Sat, 14 Feb 2026 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771029361; cv=none; b=OL45awLlxC/zh5lQ7aoSqduqYeWzU0csrptfF63SGK31RDS5q57OaS/uJQkhELs1N69nsNYvcotNL8s7vIBZqKOVHQVJy+7XQ5b6Y7zTE3t726MFF1cAdrJGeYMx/11In0QVOGZBok9TTnxYQ1pPOhH/8zOfhepTQXAfQFQM4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771029361; c=relaxed/simple;
	bh=4p7hBFXDdXswu7G3yFQn/WaKSEw2ehr5AYJm0du4iFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rv8tZOgyp4zL22+XAZm6DBDisFNT5yD/bQpW29UKuFzAuCWogReOHmgqmJtgNyZVWTR/tWKXW34ZkhVCcIlXAuVks51GI/svjNQa7ZchKReCK1dCQa+QavIclcLmIXsrn/hpj0HnfrHVg2tri8tCvFYtAfZr8Ro/IGTPoUrLJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROOPtLdg; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROOPtLdg"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-124afd03fd1so2436837c88.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Feb 2026 16:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771029359; x=1771634159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcsnYHnaR+mbYSPKQbdhDU9Bq2aFrrJLZtDn7VH/fJc=;
        b=ROOPtLdgtQJ+IRK+KTkrCp+mNYDeWZTS7OBWUF/3dSW3r7U8mHCyb39pVoJ1m9ToS3
         natrZ2oICz76E70y8mTjxastciSKosnAT4z21b1ct/gNEVW3gTbtWWgVCVwyz04IW5qX
         kYX91l/dSjtrb7Mhmuc0LH6T9YqiALiRoBvwUJtgWWvzeh6qXHExzU+PKoxvNLbrqaRa
         eLIXoepxsfd1kkSD6MNDnyRjmAl1UGMnOfVjK2pqu4Rv3SbqsK8/8bYBuQOWKEMnMxZm
         A6TmtoAWQUTViY1c2XrynpvT/SFDUgUadlHVR/QmuIVjVjgCoOoAaM+0gQpFn9PxoWcq
         kp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771029359; x=1771634159;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcsnYHnaR+mbYSPKQbdhDU9Bq2aFrrJLZtDn7VH/fJc=;
        b=Y7HX3de/+7vj4qH1YVbaJA+cIwzGHVDXDkJ/6h+yTsUL3o3AiqFZhyTxsgzFOKKRU+
         4MGNv8Z0sBp3grHYAnqUX63AV5+rBOPtvf2saETHumBdxHAqfrsG0DzBaNVE32F4wZUn
         s9WgNTd91OeT71A9txEpZfpIMMax/hN1SlmLItQVzYELpflCoM7rJXcpvc/gGWO9EQfK
         LYgg+nN8q6ojBMdofvp36QcKrbfXINu42j5VISqmizK0WsjXmVfqZcPpbIZ46zR/MEp8
         aempWIKItUl5IY2zwX8C/q5t/RtryQC/Wmo4UYeUwfar0RCn2SWHyHvjxUdHrTZApvik
         vuZg==
X-Forwarded-Encrypted: i=1; AJvYcCWpr13IumZPb8oeXBdJrFsKfg/0vTqcD09xwaQMV+2L4KG7xzPDvTgsi0xBTxfTUkaHqx5ZWzxX6hPZJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+uJourBdAyVG0Tl+rXm4k2WBVmHytSJRfs7Ys//PcgIigBNl
	mEG1xQ5OCP37bX8olpg5KYmBGVfQo5G1C8gP/LJgK4zAD0Q9nyqZtD3j
X-Gm-Gg: AZuq6aL6vIXayGR7K7ZeSL5ZBzG0kZqn3BrHT7Las3N5dX9CqaCms4iSHHDc7igNcqT
	GRPKrRf0Mje8v0e3loq6qDOTtKCFMzyM78jtvOh7/LNyrC+SQtjn5DIRZ4ifPJbmHd/kKhzU4aq
	DPbeNJFDc1+aRfwOKnDvnpSPVm2da3RMB4933K1FthyEZwKuBzWHx9sR5N0Lfr7aYiKwxTjwWSd
	5CkZUHprC5wIU+DQPQOh28jtsrTS6tfYnEGXeHodR8N+yzZVryUdbO1lM66ZZ5k4uG/JVsB6gZA
	0SSkO6z+GwzPTN0FTcKe+wj5YM07DBj6UBGNt0XgXyMVeGomFtK9N3D2EzDVRtYanULO7KX6XX9
	ObuRQw0pnl3QnHFZoXuwnk/HzpwNCMP+aAIbCMYjg6Xa9Ndyzm85Dsctz0dM4nU/0ain4ETszrU
	OJF3qDZeav9SnGc7iJvlo0l/qoSgMMzgvQL83jMwpn7N7g+3flYtxUHGrjaAe4A/R8
X-Received: by 2002:a05:7022:b81:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-12741bc706cmr630038c88.34.1771029359310;
        Fri, 13 Feb 2026 16:35:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:b713:5e7b:5963:d2ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6ce01sm371859c88.7.2026.02.13.16.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 16:35:58 -0800 (PST)
Date: Fri, 13 Feb 2026 16:35:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <aY_BpRQmLdqOOW2K@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
device can be instantiated via device tree.

Add the declaration there and drop board-paz00.c file and relevant
Makefile fragments.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is not tested on real hardware, compile tested only...

 arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
 arch/arm/mach-tegra/Makefile               |  2 -
 arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
 arch/arm/mach-tegra/board.h                |  2 -
 arch/arm/mach-tegra/tegra.c                |  4 --
 5 files changed, 8 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
index 1408e1e00759..d1093ad569e6 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
@@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
 		enable-active-high;
 	};
 
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "wifi_rfkill";
+		radio-type = "wlan";
+		reset-gpios = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-alc5632-paz00",
 			"nvidia,tegra-audio-alc5632";
diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index a2bb55bc0081..9e3abb14fbc1 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -15,5 +15,3 @@ obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= pm-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= pm-tegra30.o
-
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-paz00.o
diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
deleted file mode 100644
index 3ec810b6f1a7..000000000000
--- a/arch/arm/mach-tegra/board-paz00.c
+++ /dev/null
@@ -1,56 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-tegra/board-paz00.c
- *
- * Copyright (C) 2011 Marc Dietrich <marvin24@gmx.de>
- *
- * Based on board-harmony.c
- * Copyright (C) 2010 Google, Inc.
- */
-
-#include <linux/err.h>
-#include <linux/gpio/machine.h>
-#include <linux/gpio/property.h>
-#include <linux/platform_device.h>
-#include <linux/printk.h>
-#include <linux/property.h>
-
-#include "board.h"
-
-static const struct software_node tegra_gpiochip_node = {
-	.name	= "tegra-gpio",
-};
-
-static const struct property_entry wifi_rfkill_prop[] __initconst = {
-	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
-	PROPERTY_ENTRY_STRING("type", "wlan"),
-	PROPERTY_ENTRY_GPIO("reset-gpios",
-			    &tegra_gpiochip_node, 25, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("shutdown-gpios",
-			    &tegra_gpiochip_node, 85, GPIO_ACTIVE_HIGH),
-	{ }
-};
-
-static const struct platform_device_info wifi_rfkill_info __initconst = {
-	.name		= "rfkill_gpio",
-	.id		= PLATFORM_DEVID_NONE,
-	.properties	= wifi_rfkill_prop,
-};
-
-void __init tegra_paz00_wifikill_init(void)
-{
-	struct platform_device *pd;
-	int err;
-
-	err = software_node_register(&tegra_gpiochip_node);
-	if (err) {
-		pr_err("failed to register %s node: %d\n",
-		       tegra_gpiochip_node.name, err);
-		return;
-	}
-
-	pd = platform_device_register_full(&wifi_rfkill_info);
-	err = PTR_ERR_OR_ZERO(pd);
-	if (err)
-		pr_err("failed to register WiFi rfkill device: %d\n", err);
-}
diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
index 7b3ef0dc9be1..86c3ea0d6b30 100644
--- a/arch/arm/mach-tegra/board.h
+++ b/arch/arm/mach-tegra/board.h
@@ -19,6 +19,4 @@
 void __init tegra_map_common_io(void);
 void __init tegra_init_irq(void);
 
-void __init tegra_paz00_wifikill_init(void);
-
 #endif
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 9ef1dfa7b926..f324a7e491d8 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -83,10 +83,6 @@ static void __init tegra_dt_init(void)
 
 static void __init tegra_dt_init_late(void)
 {
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_machine_is_compatible("compal,paz00"))
-		tegra_paz00_wifikill_init();
-
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
 	    of_machine_is_compatible("nvidia,tegra20"))
 		platform_device_register_simple("tegra20-cpufreq", -1, NULL, 0);
-- 
2.53.0.310.g728cabbaf7-goog


-- 
Dmitry
