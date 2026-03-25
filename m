Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55037475C
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774481400; cv=none; b=SvO4XoccCDCcl07BsYLXTRE3d0tURlEVr+5js/iLT3IUP+whkp50Kq/BJgCe/P5ErwfwetgJNq05MBMxXqHgbRaP8hzYrYo3Qaxl1ARM7hkG2XJsg5pdZFdH102ACpALtnA8JbmO7FDZLwrCjrmAM5oSX3mgnWAcp4So1q9Lyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774481400; c=relaxed/simple;
	bh=mLvr4LbWxK3l3yaPJ/LpQ1h0O1hbnOLYnavoq7f3sM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Piwwtlwp6NfFzgfZbPpwQ5pJ2jhuTAf8Ri1ioCTfkSztLzR7cKTcrKkjhsPUpv8t9oZAtuEhcdGuHCIvz++PT7tMeUnZ7dQXXvY49ySe1xRd5DQJwzm+DWoCzMI5k56+qdHNzXz5wrsu0TrqfIo1tODk7KKLCq7z4NQL59b6onI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSD5b+kH; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSD5b+kH"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12a71ade78cso474580c88.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774481398; x=1775086198; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbyKbyFuHp+6dsr0KIzDsUutYDB3nuzbv/Jgu2ebttc=;
        b=CSD5b+kH9ZqDgar2SHAzMPOK7mDXuMmmZrHBb+gZ2Ax5xh/G8lJg9dXrWxAsBYCRRf
         7jj1UbSb2esolz+unuCrBn03FbSAn0+QQ0/v1zq+70hT4PuDgMJJCWxVphxg+3W4N0h4
         uMypRZMsu0rJrug8k6cVAgywDLabuf7nrUqz/8C/EtskLq/nvolMTyhnOwONGeibn8nv
         jT7WRkINCBrzzfHKJSGSS386A3naVQMHUJTkCkjMjtCrOscWguV4aLkYKE5sq194l2rS
         Gs3wTuf2Yda2/4eN9HROQpPjbsuuThmPRjO4MXqQh4FyA/kOfbWxiijOuBlx9QmWLusl
         ZoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774481398; x=1775086198;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbyKbyFuHp+6dsr0KIzDsUutYDB3nuzbv/Jgu2ebttc=;
        b=LIzE9dn41qnLj9z1vuRpSFvyBYbQz3vqvN8J6nRlvpLL1oh0OoIH6u/3HMwyEH0PTe
         Raunc/SyIy5PGW9Syqcw56Sph5ZfpqJfbABnxhPaTfya/GadQlzV5rr5wmixZwIedYge
         sGnAP2KIoguQTy5inlmZrfub7EICHutveTG11aiqF6U8AT7wFYRe14vs0WYjXuDRvdZH
         OgnQ0MATWwgERPTfIF+WKEhWwKT065Z+9CXq8JCKQ8fW8pHVZQj5m+7X04GstaI60ubT
         1rop0seqanBj/IPbXeJppo6wVrVxqaTWn87RYm0mdiSW/viiEso8E2BcQOVC7/sTrNtU
         oBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVDzXSztjFLUlZz3aNS/K8I5IGxGXPvEvFFsd+/Kb7r4DAg5y3NQLDwi3BiTMdiPrIpLv6g7HMbhpYWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSqPeiMD9DpR98VCs9Ewsr6pLmiusmCQ9bRhkL52RquPr+XAq
	tRbIABrSuvgVXGCvzHDkiaLtVO3v9C/I7TpInebOtquF/yeqKc/ZzMh6
X-Gm-Gg: ATEYQzyaXWdXhZ43DWg6OPac+DlbqZoS7I72NtevGFZPEb3SZ2yRipAa9Xp1DIqAArG
	mpTnzEkruekJhMcfFyCvHP3h8vHIuQaNqMUQNGeM7M364tdtUoe5xNUjoRHFGysJZM0u3P/6AR1
	YhBjYA1GbU/aTIByE7AtC+/WwnDYRlKUIiCGocBjWXT/GG4Aa3L7MTPpf7ECotwZuR0vyffefcf
	SlAVxuEXcjeeQX+Ai8Gu/4riwcxFpSopouGQac6HjwzsVDZL4HI5u/LizQ2IJNOY7GgtKVFA8rr
	flm8ZFxTib7BYG229GucuNiuOqp34yCVCpsq9WLilPLYOx2exeUmY5PHwDDFmc+Own35Y4vRBxs
	Mu0PG+uw+V5RBDNmcLIRxI9KKElp4R0GIrM3CvfuLv+R1nnrvI9Nxvxa2g8297ik7fhcjSJYliS
	HULkRfXAUeWDOF9zoiYDPG6qjLK2WTMejbI75eH8eKuDk4eHVZPXK7JMN0WxAiKVca
X-Received: by 2002:a05:7022:402:b0:122:8d:3688 with SMTP id a92af1059eb24-12a96eceb55mr2801523c88.22.1774481397800;
        Wed, 25 Mar 2026 16:29:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7274231sm1355207c88.8.2026.03.25.16.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:29:57 -0700 (PDT)
Date: Wed, 25 Mar 2026 16:29:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <acRtWZohqfDLbMKE@google.com>
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

Tested-by: Marc Dietrich <marvin24@gmx.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

V2:
- added Marc's Tested-by

V1:
- https://lore.kernel.org/r/aY_BpRQmLdqOOW2K@google.com

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
2.53.0.1018.g2bb0e51243-goog


-- 
Dmitry
